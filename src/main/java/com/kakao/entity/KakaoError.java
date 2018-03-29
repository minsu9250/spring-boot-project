package com.kakao.entity;

public class KakaoError {
	String status;
	String msg;
	
	public KakaoError(String status, String msg) {
		this.status = status;
		this.msg = msg;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setId(String msg) {
		this.msg = msg;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
