package action;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

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
import util.ConvertUtil;
import util.DateDealUtil;
import util.MSG_CONST;
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
}
