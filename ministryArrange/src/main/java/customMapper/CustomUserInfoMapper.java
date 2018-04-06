package customMapper;

import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
@SuppressWarnings("rawtypes")
public interface CustomUserInfoMapper {
	int checkUser(Map map);

	int insertUser(Map map);
	
	int insertAddress(Map map);
	
	List<Map> getUserListByPage(Map map);
	
	List<Map> getAddrListByPage(Map map);

	int insertAddrDate(List<Map> addrRelDate);

	List<Map> getAddrByType();
	
	List<Map> getServiceList(Map map);

	CopyOnWriteArrayList<Map> getAddrRelDateList(String string);

	CopyOnWriteArrayList<Map> getServiceUsers(String string);

	int serviceArrange(List<Map> arrangedRecs);

	int serviceArrangeBySingle(Map recMap);

	int setArrangeStatusY(List reqList);

	int setArrangeStatusN(List reqList);

	List<Map> getAllServiceArrangeList();
}
