package ministryArrange;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestStr {

	@Test
	public void test() {
		String type = "address";
		System.err.println("user".equals(type));
		System.out.println("user".equals(type) ? "user": "address");
	}

}
