package ministryArrange;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DateDealUtil {
	//获取聚会地点集合测试数据
	public static List getAddrData(String addr){ 
		List<Map> list = new ArrayList<Map>();
		Map tempMap = new HashMap();
		for(int j = 0; j < 10; j++){
			tempMap.put("id", j);
			tempMap.put("address_name", addr+j);
			tempMap.put("reuniontype", 0);
			list.add(tempMap);
		}
		return list;
	}
	//获取事工同工测试数据集合
		public static List getUserData(String username, int days){ 
			List<Map> list = new ArrayList<Map>();
		
			for(int j = 0; j < 10; j++){
				System.err.println("我的j"+j);
				Map tempMap = new HashMap();
				tempMap.put("id", j);
				tempMap.put("user_name", username+j);
				tempMap.put("serve_days_pre_forth", (j%2)+1);
				tempMap.put("serve_days_fifth", j%2);
				list.add(tempMap);
			}
			return list;
		}
		/**
		 * 获取日期所在当月的第几周
		 * @param date
		 * @return week
		 */
		public static int getWeeks(Date date){  
	  /*      Calendar calendar = Calendar.getInstance();  
	        calendar.setTime(date);  
	        //第几周  
	        int week = calendar.get(Calendar.WEEK_OF_MONTH);
	        return week;*/
			Calendar cal = Calendar.getInstance();  
			cal.setFirstDayOfWeek(Calendar.MONDAY);//设置周一为一周的第一天  
			cal.setTime(date);  
			int num = cal.get(Calendar.WEEK_OF_MONTH);
			return num;
		}
		 
	 //判断闰年  
	public static boolean isLeap(int year){  
        if (((year % 100 == 0) && year % 400 == 0) || ((year % 100 != 0) && year % 4 == 0))  
            return true;  
        else  
            return false;  
    }  
  
    //返回当月天数  
	/**
	 *  2018-02
	 * @param year
	 * @return
	 */
    public static int getDays(String yearStr){  
    	int year = Integer.parseInt(yearStr.split("-")[0]),
    		month = Integer.parseInt(yearStr.split("-")[1]),
    		days,
    		FebDay = 28;
        if (isLeap(year))  
            FebDay = 29;  
        switch (month)  
        {  
            case 1:  
            case 3:  
            case 5:  
            case 7:  
            case 8:  
            case 10:  
            case 12:  
                days = 31;  
                break;  
            case 4:  
            case 6:  
            case 9:  
            case 11:  
                days = 30;  
                break;  
            case 2:  
                days = FebDay;  
                break;  
            default:  
                days = 0;  
                break;  
        }  
        return days;  
    }  
}
