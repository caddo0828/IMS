package com.ssm.common;

import java.io.Serializable;
/**
 * 返回的最终操作是否成功的状态信息
 * @author 老腰
 *
 */
public class Result implements Serializable{
	private int status ; //操作结果状态码
	private Object msg;  
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Object getMsg() {
		return msg;
	}
	public void setMsg(Object msg) {
		this.msg = msg;
	}
	
}
