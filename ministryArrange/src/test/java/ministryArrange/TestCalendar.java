package ministryArrange;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;

import com.hp.hpl.sparta.ParseException;
import com.mysql.fabric.xmlrpc.base.Array;

public class TestCalendar {

	@Test
	public void test() throws java.text.ParseException {
		String[] s = {"2018-02", "2018-03"};
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("EEE");//格式-星期几
		for (String dateStr : s) {
	        for(int i = 1; i <= DateDealUtil.getDays(dateStr); i++){
	            Date date = sdf1.parse(dateStr + "-" + i);
	            if(sdf2.format(date).equals("星期四") 
	            		|| sdf2.format(date).equals("星期六")
	            		|| sdf2.format(date).equals("星期日")){
	            	System.out.println(sdf1.format(date) + " : " + sdf2.format(date).replace("星期", "周"));
	            }
	        }
		}
		
	}
	@Test
	public void addressDateMapping() throws java.text.ParseException {
		String[] s = {"2018-03"};
		List<Map> addrs0 = new ArrayList<Map>();//周四聚会地点
		List<Map> addrs1 = new ArrayList<Map>();//周六聚会地点
		List<Map> addrs2 = new ArrayList<Map>();//周日聚会地点
		
		addrs0 = DateDealUtil.getAddrData("周四聚会的地点");
		addrs1 = DateDealUtil.getAddrData("周六聚会的地点");
		addrs2 = DateDealUtil.getAddrData("周日聚会的地点");
//		System.out.println(addrs0);
		
		List<Map> users0 = new ArrayList<Map>();//周四聚会地点
		users0 = DateDealUtil.getUserData("服侍同工", 2);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdf2 = new SimpleDateFormat("EEE");//格式-星期几
        
        List<Map> addrsNew = new ArrayList<Map>();//周四聚会地点日期映射集合
		List<Map> addrs1New = new ArrayList<Map>();//周六聚会地点日期映射集合
		List<Map> addrs2New = new ArrayList<Map>();//周日聚会地点日期映射集合
		
		for (String dateStr : s) {//遍历月
	        for(int i = 1; i <= DateDealUtil.getDays(dateStr); i++){//遍历月里面的天
	            Date serviceDate = sdf1.parse(dateStr + "-" + i);//聚会日期
	            String serviceDateF = sdf1.format(serviceDate);
	            String serviceDateCN = sdf2.format(serviceDate);
	            
	             
	            System.err.println(serviceDateF);
//	            System.err.println("第"+ week +"周");
	            int count = 1;
	            switch(serviceDateCN){
	            	case "星期四" :
	            		for (Map map : addrs0) {
	            			
	            			Map tempMap = new HashMap();
	            			tempMap.put("聚会日期映射表ID", count++);
	            			tempMap.put("address_id", count++);
	            			tempMap.put("reuniondate", serviceDateF);
	            			tempMap.put("reuniondateCN", serviceDateCN);
	            			tempMap.put("arrangestatus", "需要安排");
	            			tempMap.put("weekofdate", DateDealUtil.getWeeks(serviceDate));
							addrsNew.add(tempMap);
//							System.err.println(addrsNew.size());
//							System.out.println(tempMap);
						}
	            		
	            		break;
	            	case "星期六" :
        				for (Map map : addrs0) {
	            			Map tempMap = new HashMap();
	            			tempMap.put("聚会日期映射表ID", count++);
	            			tempMap.put("address_id", count++);
	            			tempMap.put("reuniondate", serviceDateF);
	            			tempMap.put("reuniondateCN", serviceDateCN);
	            			tempMap.put("arrangestatus", "需要安排");
	            			tempMap.put("weekofdate", DateDealUtil.getWeeks(serviceDate));
							addrsNew.add(tempMap);
//							System.err.println(addrsNew.size());
//							System.out.println(tempMap);
						}
	            		
	            		break;
	            	case "星期日" :
	            		break;
	            }
	            
	            /*if(sdf2.format(date).equals("星期四") 
	            		|| sdf2.format(date).equals("星期六")
	            		|| sdf2.format(date).equals("星期日")){
	            	System.out.println(sdf1.format(date) + " : " + sdf2.format(date).replace("星期", "周"));
	            }*/
	           
	        }
		}
//		System.err.println(addrsNew);
		//服侍同工事工分配
		for (Map userMap : users0) {
			System.err.println(userMap);
			//给人派工
			Set<String> keys = userMap.keySet();
			int servedays = 0;
//			keys.iterator()
			for (String key : keys) {
				if(key.equals("servedays")){
					servedays = (int) userMap.get(key);
					for (int i = 0; i < servedays; i++) {//遍历服侍人员服侍天数
						for (Map addr : addrsNew) {//遍历服侍的地点和时间
							
						}
					}
				}else{
					continue;
				}
			  }
		}
		
	}

}
