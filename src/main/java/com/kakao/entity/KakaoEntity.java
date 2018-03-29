package com.kakao.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="KAKAO")
public class KakaoEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	String email;
	String coupon;
	Date regDate;
	
	public KakaoEntity() {}
	
	public KakaoEntity(int id, String email, String coupon, Date regDate) {
		this.id = id;
		this.email = email;
		this.coupon = coupon;
		this.regDate = regDate;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
