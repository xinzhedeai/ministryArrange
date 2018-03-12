package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import customMapper.CustomUserInfoMapper;
import exception.SysException;
import pageModel.JsonResult;
import util.DateUtil;
import util.MD5Util;
import util.WDUtil;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping("/ministryAction")
public class UploadAction {
	public static Logger logger = Logger.getLogger(UploadAction.class);
	public static String type = "address";
	@Autowired
	public CustomUserInfoMapper customUserMapper;
	@ResponseBody
	@RequestMapping("/impUserBatch")
	public JsonResult impScriptureBatch(HttpSession session, HttpServletRequest req) throws SysException {
		JsonResult j = new JsonResult();
		try {
			Boolean uploadSuccess = true;
			String file_path = "";
			// 将excel文件保存到本地
			req.setCharacterEncoding("UTF-8");
			MultipartRequest multiReq = (MultipartRequest) req;
			Iterator<String> files = multiReq.getFileNames();
			while (files.hasNext()) {
				String fileName = (String) files.next();
				MultipartFile multiFile = multiReq.getFile(fileName);
				if (multiFile != null && !multiFile.isEmpty()) {
					file_path = req.getSession().getServletContext().getRealPath("/storage/");
					if (multiFile != null && !multiFile.isEmpty()) {
						String originName = multiFile.getOriginalFilename();
						originName = URLDecoder.decode(originName, "UTF-8");
						String file_extension = (originName.substring(originName.lastIndexOf(".") + 1)).toLowerCase();
						if (!file_extension.equals("xls") && !file_extension.equals("xlsx"))
							throw new SysException("请上传正确的文件!");
						// if(file_extension.equals("xlsx")) throw new
						// SysException("仅支持2003版本的Excel!");
						File f = new File(file_path);
						FileOutputStream fos = null;
						if (!f.exists()) {
							f.mkdirs();
							logger.info("创建了" + file_path + "文件夹.");
						}

						file_path = file_path + "test." + file_extension;
						try {
							fos = new FileOutputStream(file_path);
							if (multiFile != null && !multiFile.isEmpty())
								fos.write(multiFile.getBytes());
						} catch (Exception e) {
							uploadSuccess = false;
							logger.error(e);
							throw new SysException("写文件错误.");
						} finally {
							if (fos != null)
								try {
									fos.close();
									fos = null;
								} catch (IOException e) {
									uploadSuccess = false;
									logger.error(e);
									throw new SysException("关闭文件流错误.");
								}
						}
					}
				}
			}
			// 将excel表中内容读出来
			if (uploadSuccess) {
				/*InputStream input = new FileInputStream(file_path); // 建立输入流
				POIFSFileSystem fs = new POIFSFileSystem( input );
				Workbook xs = new XSSFWorkbook(input);
				System.out.println(xs.getNumberOfSheets());*/
				for(int i = 0; i < 1; i++)
					readExcel(req, file_path, i);
				File f = new File(file_path);
				f.delete();
				System.err.println("导入成功啦啊哈 哈哈哈哈哈哈");
				j.setMsg("导入成功");
				j.setSuccess(true);
			}
			return j;
		} catch (Exception e) {
			logger.error(e);
			throw new SysException("上传excel出现异常。");
		}

		
	}

	public void readExcel(HttpServletRequest req, String fileName, int sheetNum) throws SysException {
		try {
			InputStream input = new FileInputStream(fileName); // 建立输入流
			Workbook wb = null;
			boolean isExcel2003 = true;
			Sheet sheet;
			Iterator<Row> rows = null;
			if (WDUtil.isExcel2007(fileName)) {// 我是用本地2013作的excel表，改了后缀名为xls格式的，
				// 虽然判断后认为事2003以前的，但实际解析还是为2007以上的文件格式。
				isExcel2003 = false;
			}
			if (isExcel2003) {
				wb = new HSSFWorkbook(input);// hssF是Excel2003以前（包括2003）的版本没有问题
				sheet = (HSSFSheet) wb.getSheetAt(sheetNum);
				rows = sheet.rowIterator();
			} else {
				wb = new XSSFWorkbook(input);
				sheet = (XSSFSheet) wb.getSheetAt(sheetNum);
				rows = sheet.rowIterator();
			}

			// 获取excel表中有数据的行数
			int numOfRow = sheet.getLastRowNum();
			int dataRowNum = 0;
			if (numOfRow > 0) {
				for (int rowNum = 1; rowNum <= numOfRow; rowNum++) {
					Row hssfRow = sheet.getRow(rowNum);
					if (isEmptyRow1(hssfRow) == false) {
						dataRowNum++;
					}
				}
			}
			logger.info("lineNum已读行数" + dataRowNum);
			// 获取表中的数据，每个公司信息存一个Map，所有的放在一个List<Map>中,同样的，每个用户信息存一个Map，所有的放在一个List<Map>中。
			List<Map> data_list = new ArrayList();
			logger.error("sheet工作表index" + sheetNum);
			
			data_list = getCellData(rows, dataRowNum, type);
			// 将数据存入数据库
			for (Map map : data_list) {
				if(insert(map, type) == 0)
					throw new SysException("导入失败!");
			}

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	private static String getValue(Cell hssfCell) {
		if (hssfCell == null) {
			return "";
		} else {
			try {
				if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
					// 返回布尔类型的值
					return toString(hssfCell.getBooleanCellValue());
				} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
					try {
						// 返回数值类型的值
						boolean isCellDateFormatted = HSSFDateUtil.isCellDateFormatted(hssfCell);
						if (isCellDateFormatted) {
							short format = hssfCell.getCellStyle().getDataFormat();
							SimpleDateFormat sdf = null;
							if (format == 14 || format == 31 || format == 57 || format == 58) {
								// 日期
								sdf = new SimpleDateFormat("yyyy-MM-dd");
							} else if (format == 20 || format == 32) {
								// 时间
								sdf = new SimpleDateFormat("HH:mm");
							}
							double value = hssfCell.getNumericCellValue();
							Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
							return sdf.format(date);
						} else {
							try {
								DecimalFormat df = new DecimalFormat("0");
								String number = df.format(hssfCell.getNumericCellValue());
								return number;

							} catch (Exception e) {
								return toString(hssfCell.getNumericCellValue());
							}
						}
					} catch (Exception e) {
						return toString(hssfCell.getNumericCellValue());
					}
				} else {
					// 返回字符串类型的值
					return toString(hssfCell.getStringCellValue());
				}
			} catch (Exception e) {
				return "";
			}
		}
	}

	// 只要没有数据,就判断为空行,不管它是不是有格式,而poi自带的row == null,指的是既没有数据又没有格式Style
	public static boolean isEmptyRow1(Row hssfRow) {
		int temp = 0;
		boolean isEmptyRow = false;
		if (hssfRow == null) {
			isEmptyRow = true;
		} else {
			for (int i = 0; i <= hssfRow.getLastCellNum(); i++) {
				if (hssfRow.getCell(i) != null) {
					if (getValue(hssfRow.getCell(i)) != null && !("".equals(getValue(hssfRow.getCell(i))))) {
						temp++;
					}
				}
			}
			if (temp == 0) {
				isEmptyRow = true;
			}
		}
		return isEmptyRow;
	}
	public static String toString(Object object) {
		String temp = "";
		if (object != null) {
			temp = object.toString();
		}
		return temp;
	}
	public int insert(Map map, String type){
		System.err.println(type);
		return "user".equals(type) ? customUserMapper.insertUser(map) : customUserMapper.insertAddress(map);
	}
	
	public List<Map> getCellData(Iterator<Row> rows, int dataRowNum, String type){
		List<Map> data_list = new ArrayList();
		int line = 0;
		while (rows.hasNext()) {
			Map data_map = new HashMap();
			Row row = rows.next(); // 获得行数据
			Iterator<Cell> cells = row.cellIterator();// 获得第一行的迭代器
			if (line != 0) {
				String[] temp_cell_arr = new String[6];
				int num = 0;
				while (cells.hasNext()) {
					Cell cell = cells.next();
					if (num != cell.getColumnIndex()) {
						temp_cell_arr[num] = "";
						num++;// 这里的num++为什么要写两个。
					}
					temp_cell_arr[num] = getValue(cell).trim();
					num++;
				}
				if("user".equals(type)){
					data_map.put("username", temp_cell_arr[0]);
					data_map.put("pwd", MD5Util.toSHA256(DateUtil.nowTimeMilli()));
					data_map.put("tel", temp_cell_arr[1]);
					data_map.put("area", temp_cell_arr[2]);
					data_map.put("church", temp_cell_arr[3]);
					data_map.put("serve_days_pre_forth", temp_cell_arr[4]);
					data_map.put("serve_days_fifth", temp_cell_arr[5]);
				}else if("address".equals(type)){
					data_map.put("area", temp_cell_arr[0]);
					data_map.put("church", temp_cell_arr[1]);
					data_map.put("reunion_type", temp_cell_arr[2]);
				}
				data_list.add(data_map);
				logger.error("第一個單元格的内容" + temp_cell_arr[0]);
				logger.error("第二個單元格的内容" + temp_cell_arr[1]);
			}

			if (line == dataRowNum)
				break;
			line++;
		}
		logger.error("已读"+ line +"行");
		return data_list;
	}
}
