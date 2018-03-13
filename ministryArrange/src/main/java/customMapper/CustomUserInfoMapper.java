package customMapper;

import java.util.List;
import java.util.Map;
@SuppressWarnings("rawtypes")
public interface CustomUserInfoMapper {
	int checkUser(Map map);

	int insertUser(Map map);
	
	int insertAddress(Map map);
	
	List<Map> getUserListByPage(Map map);
}
