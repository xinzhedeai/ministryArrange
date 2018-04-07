package util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MathUtilCustom {
	   public static int[] getRandom(int totalNum){
//		   	int totalNum = 20;//需要随机的个数
		    Random rd = new Random();//定义随机数对象
		    int[] randomArr = new int[totalNum];//存储随机数的数组
		    List<Integer> orderList = new ArrayList<Integer>();//存放有序数字集合
		    int index = 0;//随机索引       
		    for(int i = 1; i <= totalNum; i++){
		    	orderList.add(i);//存入1~20个数
		    }
		    for(int i = 0; i < totalNum; i++){
		    	//匹配一个随机数后，随机范围减一
		        index = rd.nextInt(totalNum - i);      
		        randomArr[i] = orderList.get(index);
		        /**
		         * 当获取一个随机数的时候，就从有序数组中移出一个
		         * 虽然上面index可能会出现相同的，但是在有序数组中
		         * 改索引所对应有序数组中的值与之前是不一样的。
		         * 这样，总共就获取20个数，每次都是不一样的
		         */
		        orderList.remove(index);
		        System.err.println(randomArr[i]);
		    }
		    
		    return randomArr;
		}
}
