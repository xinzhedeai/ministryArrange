package action;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import customMapper.CustomUserInfoMapper;
import exception.SysException;
import normalMapper.UserMapper;
import normalPo.User;
import normalPo.UserExample;
import pageModel.EasyUIGridObj;
import pageModel.ExcelObj;
import pageModel.JsonResult;
import pageModel.LayUIGridObj;
import service.UserService;
import util.ConvertUtil;
import util.DateDealUtil;
import util.MSG_CONST;
import util.POIUtil;
import util.PageUtil;
import util.SpringUtils;
@SuppressWarnings({"rawtypes"})
@Controller
@RequestMapping("/userAction")
public class UserAction extends BaseAction{
	
	public static Logger logger  = Logger.getLogger(UserAction.class);
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private UserService userServiceImpl;
	
	@Autowired
	private CustomUserInfoMapper customUserMapper;
/*	@RequestMapping("/login")
	public String login()throws Exception{
		return "login";
	}*/
	@ResponseBody
	@RequestMapping("/loginSubmit")
	public JsonResult loginSubmit(HttpSession session, String userName, String userPwd)throws Exception{
		System.out.println("进到servlet里面了。");
		UserExample userExp = new UserExample();
		UserExample.Criteria criteria = userExp.createCriteria();
		criteria.andUserNameEqualTo(userName).andUserPwdEqualTo(userPwd);
		List<User> userInfoList = userMapper.selectByExample(userExp);
		JsonResult j = new JsonResult();
		if(userInfoList.size() == 1){
			j.setSuccess(true);
			j.setMsg("登录成功！");
			j.setResult(userInfoList.get(0));
		}else{
			j.setSuccess(false);
			j.setMsg("账号或密码错误！");
		}
		return j;
	}
	@ResponseBody
	@RequestMapping("/loginSubmit1")
	public JsonResult loginSubmit1(HttpServletRequest req)throws Exception{
		System.out.println("进到login里面了。");
		Map reqMap = SpringUtils.getParameterMap(req);
		JsonResult j = new JsonResult();
		if(userServiceImpl.checkUser(reqMap) == 1){
			j.setSuccess(true);
			j.setMsg("登录成功！");
		}else{
			j.setSuccess(false);
			j.setMsg("账号或密码错误！");
		}
		return j;
	}
	@ResponseBody
	@RequestMapping("/getServiceUsers")
	public LayUIGridObj getServiceUsers(HttpServletRequest req)throws Exception{
		Map reqMap = SpringUtils.getParameterMap(req);
		LayUIGridObj layObj = new LayUIGridObj();
		try {
			 layObj = PageUtil.searchByPage(customUserMapper, reqMap, "getUserListByPage");
		} catch (SysException e) {
			e.printStackTrace();
		}
		if(layObj != null){
			layObj.setCode(0);
			layObj.setMsg("获取成功");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("获取失败");
		}
		return layObj;
	}
	
	@ResponseBody
	@RequestMapping("/getServiceAddress")
	public LayUIGridObj getServiceAddress(HttpServletRequest req)throws Exception{
		Map reqMap = SpringUtils.getParameterMap(req);
		LayUIGridObj layObj = new LayUIGridObj();
		try {
			 layObj = PageUtil.searchByPage(customUserMapper, reqMap, "getAddrListByPage");
		} catch (SysException e) {
			e.printStackTrace();
		}
		if(layObj != null){
			layObj.setCode(0);
			layObj.setMsg("获取成功");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("获取失败");
		}
		return layObj;
	}
	@ResponseBody
	@RequestMapping("/addUser")
	public LayUIGridObj addUser(HttpServletRequest req)throws Exception{
		Map reqMap = SpringUtils.getParameterMap(req);
		LayUIGridObj layObj = new LayUIGridObj();
		if(customUserMapper.insertUser(reqMap) > 0){
			layObj.setCode(0);
			layObj.setMsg("添加成功");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("添加失败");
		}
		return layObj;
	}
	@ResponseBody
	@RequestMapping("/addrRelDate")
	public LayUIGridObj addrRelDate(HttpServletRequest req)throws Exception{
		LayUIGridObj layObj = new LayUIGridObj();
		//获取堂点列表
		List<Map> addrs = customUserMapper.getAddrByType();
		//获取制定月份的周日、周六和周四对应的日期
		String[] s = {"2018-03"};//默认先指定个日期
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("EEE");//格式-星期几
		List<Map> dates = new ArrayList();
		for (String dateStr : s) {//遍历月
			 for(int i = 1; i <= DateDealUtil.getDays(dateStr); i++){//遍历月里面的天
				 Map tempMap = new HashMap();
				 Date serviceDate = sdf1.parse(dateStr + "-" + i);//聚会日期
	             String serviceDateF = sdf1.format(serviceDate);
		         String serviceDateCN = sdf2.format(serviceDate);
		         tempMap.put("reunion_date", serviceDateF);
		         tempMap.put("reunion_dateCN", serviceDateCN);
		         tempMap.put("weekofdate", DateDealUtil.getWeeks(serviceDate));
		         System.err.println("&&&&&&&&&&&&&&"+tempMap);
		         dates.add(tempMap);
			 }
		}
		List<Map> addrRelDate = new ArrayList();
		//获取日期集合之后，开始分配
		for(Map addr : addrs){
			for(Map date : dates){
				if(addr.get("reunion_type").equals(date.get("reunion_dateCN"))){
					Map temAddrDateMap = new HashMap();
					temAddrDateMap.putAll(addr);
					temAddrDateMap.putAll(date);
					addrRelDate.add(temAddrDateMap);
					System.err.println(temAddrDateMap);
				}
			}
		}
		//时间分配完成，向数据库插入记录
		
		if(customUserMapper.insertAddrDate(addrRelDate) > 0){
			layObj.setCode(0);
			layObj.setMsg("时间分配成功");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("时间分配失败");
		}
		return layObj;
	}
	//获取服侍派工列表数据
	@ResponseBody
	@RequestMapping("/getServiceList")
	public LayUIGridObj getServiceList(HttpServletRequest req)throws Exception{
		Map reqMap = SpringUtils.getParameterMap(req);
		LayUIGridObj layObj = new LayUIGridObj();
		try {
			 layObj = PageUtil.searchByPage(customUserMapper, reqMap, "getServiceList");
		} catch (SysException e) {
			e.printStackTrace();
		}
		if(layObj != null){
			layObj.setCode(0);
			layObj.setMsg("获取成功");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("获取失败");
		}
		return layObj;
	}
	
	@ResponseBody
	@RequestMapping("/serviceArrange")
	public LayUIGridObj serviceArrange(HttpServletRequest req)throws Exception{
		LayUIGridObj layObj = new LayUIGridObj();
		//定义分配完成的集合
		List<Map> arrangedRecs = new ArrayList();
		//获取待分配堂点记录列表（安排状态值为1的数据）(前四周)
		CopyOnWriteArrayList<Map> forthArrangeRecs = (CopyOnWriteArrayList<Map>) customUserMapper.getAddrRelDateList("forth");
		//获取待分配堂点记录列表（安排状态值为1的数据）(第五周)
		CopyOnWriteArrayList<Map> fifthArrangeRecs = (CopyOnWriteArrayList<Map>)customUserMapper.getAddrRelDateList("fifth");
		//获取服侍同工（serve_days_pre_forth值不为0的数据） 前四周可以服侍的同工
		List<Map> forthUsers = customUserMapper.getServiceUsers("forth");
		//获取服侍同工（serve_days_pre_forth值不为0的数据） 第五周可以服侍的同工
		List<Map> fifthUsers = customUserMapper.getServiceUsers("fifth");
		
		/**
		 * 由于系统中服侍同工不够，还有6次堂点聚会需要差派
		 * 目前为了测试完成分配想过，将id为183和144的两位同工进行服侍天数修改
		 * 由原来的0 0 改为 3 1 
		 */
		//开始分配同工(先进行前周四的同工分配)
		for (Map userMap : forthUsers) {//遍历服侍同工
			System.err.println(userMap.get("serve_days_pre_forth"));
			//此标记用来判断，当一个同工分派完毕之后推出分派堂点循环
			int arrangeCount = 0;
			//定义前四周需要分配堂点记录数量(不能放到for里面，不然每次遍历是都会被初始化为最初的值，而不是--后的)
			for(Map forthArrRec : forthArrangeRecs){
				 //分配完毕之后，退出该循序
				if(arrangeCount == ConvertUtil.long2int(userMap.get("serve_days_pre_forth"))){
					break;
				}
				if(!userMap.get("church").equals(forthArrRec.get("church"))){
					 //定义一个临时map,用来存储匹配的堂点信息
					 Map tempMap = forthArrRec;
					//将符合条件的同工分配给该堂点
					 tempMap.put("user_id", userMap.get("id"));
					//将符合条件的分配存到已分配结果list中
					 arrangedRecs.add(tempMap);
					//从原list中删除掉已分派完毕的堂点记录
					 forthArrangeRecs.remove(forthArrRec);
//					 System.err.println("&&& 已分配的记录 &&&"+ tempMap);
					//分配成功+1次
					 arrangeCount ++;
				 }
			 }
			 //当同工完全分配成功之后，将从原来的同工list移除
			 if(arrangeCount == ConvertUtil.long2int(userMap.get("serve_days_pre_forth"))){
				 forthUsers.remove(userMap);
			 }
		 }
		//开始分配同工(先进行周五的同工分配)
		for (Map userMap : fifthUsers) {//遍历服侍同工
			int arrangeCount = 0;//此标记用来判断一个同工分派完毕之后退出分派堂点循环
			 for(Map arrangeRec : fifthArrangeRecs){
				 //分配完毕之后，退出该循序
				 if(arrangeCount == ConvertUtil.long2int(userMap.get("serve_days_fifth"))){
					break;
				 }
				 if(!userMap.get("church").equals(arrangeRec.get("church"))){
					 Map tempMap = arrangeRec;
					 tempMap.put("user_id", userMap.get("id"));
					 arrangedRecs.add(tempMap);//将符合条件的分配存到已分配结果list中
					 System.err.println("&&& 已分配的记录 &&&"+ tempMap);
					 fifthArrangeRecs.remove(arrangeRec);//从原list中删除掉已分派完毕的堂点记录
					//分配成功+1次
					 arrangeCount ++;
					
				 }
			 }
			 //当同工完全分配成功之后，将从原来的同工list移除，用来统计那些分配完，那些还没分配完
			 if(arrangeCount == ConvertUtil.long2int(userMap.get("serve_days_fifth"))){
				 fifthUsers.remove(userMap);
			 }
		}
		
		for(Map remainRec : forthArrangeRecs){
			System.err.println("前四周剩余还未分配的堂点");
			System.err.println(remainRec);
		}
		for(Map remainRec : fifthArrangeRecs){
			System.err.println("第五周剩余还未分配的堂点");
			System.err.println(remainRec);
		}
		for(Map forthuser : forthUsers){
			System.err.println("前四周剩余还未分配的同工");
			System.err.println(forthuser);
		}
		for(Map fifthuser : fifthUsers){
			System.err.println("第五周剩余还未分配的同工");
			System.err.println(fifthuser);
		}
		
		//批量为同工分配堂点
		int sum = 0;
		for(Map recMap : arrangedRecs){
			int a = customUserMapper.serviceArrangeBySingle(recMap);
			sum += a;
			System.err.println(recMap);
		}
		System.err.println("****分派同工数量" + sum);
		//同工分配处理完成，更新服侍搭配表的user_id字段值。
//		customUserMapper.serviceArrange(arrangedRecs) > 0
		if(sum > 0){
			layObj.setCode(0);
			layObj.setMsg("派工处理完成");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("派工处理失败");
		}
		return layObj;
	}
	
	//设置派工状态接口
	@ResponseBody
	@RequestMapping("/setArrangeStatus")
	public LayUIGridObj setArrangeStatus(HttpServletRequest req)throws Exception{
		Map reqMap = SpringUtils.getParameterMap(req);
		List reqList = new ArrayList();
		reqList = JSON.parseArray(reqMap.get("recs").toString(), Map.class); 
		LayUIGridObj layObj = new LayUIGridObj();
		int flag = 0;
		if(reqMap.get("type").equals("Y")){
			flag = customUserMapper.setArrangeStatusY(reqList);
		}else{
			flag = customUserMapper.setArrangeStatusN(reqList);
		}
		if(flag > 0){
			layObj.setCode(0);
			layObj.setMsg("设置成功");
		}else{
			layObj.setCode(-1);
			layObj.setMsg("设置失败");
		}
		return layObj;
	}
	
	//excel导出
	@ResponseBody
	@RequestMapping("/exportArrangeExcel")
	public LayUIGridObj exportArrangeExcel(HttpSession session, HttpServletRequest req ,HttpServletResponse response)throws Exception{
		List<Map> resultList = customUserMapper.getAllServiceArrangeList();
		//根据不同的归类记性excel写入
		ExcelObj excelObj = new ExcelObj();
		try {
			String fileName = "江镜镇出口事奉轮流表";
			String path = req.getSession().getServletContext().getRealPath("/");
			excelObj.setFilename(fileName);
			
			excelObj.setWorkbook(exportExcel(resultList, path));
			
			 ByteArrayOutputStream os = new ByteArrayOutputStream();
		        try {
		        	exportExcel(resultList, path).write(os);
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		        byte[] content = os.toByteArray();
		        InputStream is = new ByteArrayInputStream(content);
		        // 设置response参数，可以打开下载页面
		        response.reset();
		        response.setContentType("application/vnd.ms-excel;charset=utf-8");
		        response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName+ ".xlsx").getBytes(), "iso-8859-1"));
		        ServletOutputStream out = response.getOutputStream();
		        BufferedInputStream bis = null;
		        BufferedOutputStream bos = null;
		        try {
		            bis = new BufferedInputStream(is);
		            bos = new BufferedOutputStream(out);
		            byte[] buff = new byte[2048];
		            int bytesRead;
		            // Simple read/write loop.
		            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
		                bos.write(buff, 0, bytesRead);
		            }
		        } catch (final IOException e) {
		            throw e;
		        } finally {
		            if (bis != null)
		                bis.close();
		            if (bos != null)
		                bos.close();
		        }
		        return null;
		} catch (IOException e) {
			throw new SysException("excel导出失败!");
		} 
	//	return excelObj;
	}
	//创建excel
	private Workbook exportExcel(List<Map> orginList, String path) throws IOException {
		InputStream inputStream = null;
		Workbook wb = null;
		try {
			//创建输入流
			inputStream = new FileInputStream(new File(path + "/storage/template/", "arrangeServiceExcel.xlsx"));
			//创建文档对象
			wb = new XSSFWorkbook(inputStream);
			//创建sheet页
			Sheet sheet = (XSSFSheet) wb.getSheetAt(0);
			//开始写入行
			writeExcel(orginList, sheet);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(inputStream != null) {
				inputStream.close();
			}
		}
		//测试用的。
		FileOutputStream fileStream = new FileOutputStream("E:\\test.xls");
		wb.write(fileStream);
		fileStream.close();
		return wb;
	}
	//数据格式整理并写入单元格处理
	public void writeExcel(List<Map> resultList, Sheet sheet){
		//周四聚会堂点 派工记录
		List<Map> thursdayList = new ArrayList();
		//周六聚会堂点 派工记录
		List<Map> saturdayList = new ArrayList();
		//周日聚会堂点 派工记录
		List<Map> sundayList = new ArrayList();
		//按照周四 周六 周日 进行记录归类标记
		String flag = "";
		//派工记录归类处理开始
		for(Map tempMap : resultList){
			flag = (String) tempMap.get("reunion_type");
			switch(flag){
				case "星期四":
					thursdayList.add(tempMap);
					break;
				case "星期六":
					saturdayList.add(tempMap);
					break;
				case "星期日":
					sundayList.add(tempMap);
					break;
			}
			System.err.println(tempMap);
		}
		//处理数据格式(周四)
//		List<Map> dealedListThursday = getNeededList(thursdayList);
		//处理数据格式(周六)
		List<Map> dealedListSaturday = getNeededList(saturdayList);
		//处理数据格式(周日)
//		List<Map> dealedListSunday = getNeededList(sundayList);
		
		//分别将周四 周六 周日的数据写入excel
//		createRowCell(dealedListThursday, sheet, "thursday");
		createRowCell(dealedListSaturday, sheet, "saturday");
//		createRowCell(dealedListSunday, sheet, "sunday");
		
	}
	//将获取的派工list->maps->map+list格式的数据整理为List->maps格式的
	public List getNeededList(List<Map> toDealList){
		//存放某类需要处理的集合数据（周日 周六 周四等）
		List<Map> neededListSheet = new ArrayList();
		//存放每行符合格式的数据
		List<Map> neededListRow = new ArrayList();
		//对堂点和派工人员进行拆分
		for(Map tempMap : toDealList){
			//存放每行符合格式的数据Map格式
			Map tempNeededMap = new HashMap();
			//获取行数据中每一列的键
			Set set = tempMap.keySet();
			//创建迭代器 
			Iterator it = set.iterator();
			//遍历Map
			while(it.hasNext()) {
				 Object itrKey = it.next();
				 if("church".equals(itrKey)){
					 //将堂点存到行list中
					 tempNeededMap.put(itrKey, tempMap.get(itrKey));
					 neededListRow.add(tempNeededMap);
				 }else if("arrangeRecs".equals(itrKey)){
					 List<Map> tempList = (List<Map>) tempMap.get(itrKey);
					 for(Map arrangeRec : tempList){
						 //将派工人员分别存入行Map中
						 tempNeededMap.putAll(arrangeRec);
					 }
				 }
			}
			//存放处理之后的行数据
			neededListSheet.add(tempNeededMap);
		}
		return neededListSheet;
	}
	
	/**
	 * 单纯的写入单元格数据
	 * @param dealedList
	 * @param sheet
	 * @param type 根据周四 周六 周日分别进行写入处理
	 */
	public void createRowCell(List<Map> dealedList, Sheet sheet, String type){
		/*switch(type){
			case "thursday":
				
		}*/
		
		//默认先处理一个模块的服侍数据
		Row row = null;
		//从第四行开始创建写入数据
		int rowIndex = 7;
		//k代表行的索引值
		for(int i = 0; i < dealedList.size(); i++) {
			//从第二行开始
			row = sheet.createRow(rowIndex);
			//获取行数据
			Map map = dealedList.get(i);
			//获取行数据中每一列的键
			Set set = map.keySet();
			//创建迭代器 
			Iterator it = set.iterator();
			int cellIndex = 0;
			while(it.hasNext()) {
				 Object itrKey = it.next();
				 row.createCell(cellIndex).setCellType(HSSFCell.CELL_TYPE_STRING); 
				 Object value = map.get(itrKey);
				 POIUtil.setCellValue(value, row.getCell(cellIndex));
				 cellIndex++;
			}
			rowIndex ++;
		//	logger.debug("列数"+l+"行数"+index);
		}
	}
}


