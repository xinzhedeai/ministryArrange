package ministryArrange;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class TestDate {

	@Test
	public void test() throws ParseException {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 1; i <= 31; i++){
			Date serviceDate = sdf1.parse("2018-3-"+i);
			System.err.println("2018-3-"+i);
			System.err.println(DateDealUtil.getWeeks(serviceDate));
		}
		
	}

}
