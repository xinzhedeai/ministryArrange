package pageModel;

import java.util.List;

import util.MSG_CONST;

public class LayUIGridObj {
	private long count;
	private List data;
	private int code;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	private String msg;
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	public void setMsg(MSG_CONST msg) {
		this.msg = msg.getValue();
	}
	@Override
	public String toString() {
		return "LayUIGridObj [count=" + count + ", data=" + data + "]";
	}
}
