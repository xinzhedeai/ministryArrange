package service;

import java.util.List;
import java.util.Map;

import pageModel.ActiveUser;
@SuppressWarnings("rawtypes")
public interface UserService {
	//用户认证
	public int checkUser(Map map) throws Exception;
	
	public List<Map> getUserListByPage(Map map);
}
