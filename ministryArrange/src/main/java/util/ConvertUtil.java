package util;

public class ConvertUtil {
	public static int long2int(Object object){
		Number nm = (Number) object;
		return nm.intValue();
	}
}
