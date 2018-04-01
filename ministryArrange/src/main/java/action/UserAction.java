package action;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import customMapper.CustomUserInfoMapper;
import exception.SysException;
import normalMapper.UserMapper;
import normalPo.User;
import normalPo.UserExample;
import pageModel.EasyUIGridObj;
import pageModel.JsonResult;
import pageModel.LayUIGridObj;
import service.UserService;
import util.DateDealUtil;
import util.MSG_CONST;
import util.PageUtil;
import util.SpringUtils;
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
}
