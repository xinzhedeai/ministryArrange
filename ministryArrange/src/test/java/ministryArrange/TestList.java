package ministryArrange;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

public class TestList {

	@Test
	public void test() {
		List<Map> resultList = new ArrayList();
		Map tempMap1 = new HashMap();
		Map tempMap2 = new HashMap();
		Map tempMap3 = new HashMap();
		tempMap1.put("a", 123);
		resultList.add(tempMap1);
		tempMap2.put("b", 2343);
		resultList.add(tempMap2);
		tempMap3.put("c", "sssss");
		resultList.add(tempMap3);
		Map removedMap = tempMap3;
		resultList.remove(removedMap);
		System.err.println(resultList);
	}

}
