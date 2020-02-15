package com.bcgbcg.br.dto;

import java.sql.Date;

public class UserDto {
	
	private int uIdx, uPoint, uTotalPoint, uState;
	private String uName, uId_, uPassword, uPhone, uEmail, uAddress, uGenre, uMemberShip, uAddressDetail;
	private Date uBirthday;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	public UserDto(int uIdx, int uPoint, int uTotalPoint, int uState, String uName, String uId_, String uPassword,
			String uPhone, String uEmail, String uAddress, String uGenre, String uMemberShip, String uAddressDetail,
			Date uBirthday) {
		super();
		this.uIdx = uIdx;
		this.uPoint = uPoint;
		this.uTotalPoint = uTotalPoint;
		this.uState = uState;
		this.uName = uName;
		this.uId_ = uId_;
		this.uPassword = uPassword;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uAddress = uAddress;
		this.uGenre = uGenre;
		this.uMemberShip = uMemberShip;
		this.uAddressDetail = uAddressDetail;
		this.uBirthday = uBirthday;
	}
	
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public int getuPoint() {
		return uPoint;
	}
	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}
	public int getuTotalPoint() {
		return uTotalPoint;
	}
	public void setuTotalPoint(int uTotalPoint) {
		this.uTotalPoint = uTotalPoint;
	}
	public int getuState() {
		return uState;
	}
	public void setuState(int uState) {
		this.uState = uState;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuId_() {
		return uId_;
	}
	public void setuId_(String uId_) {
		this.uId_ = uId_;
	}
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getuGenre() {
		return uGenre;
	}
	public void setuGenre(String uGenre) {
		this.uGenre = uGenre;
	}
	public String getuMemberShip() {
		return uMemberShip;
	}
	public void setuMemberShip(String uMemberShip) {
		this.uMemberShip = uMemberShip;
	}
	public String getuAddressDetail() {
		return uAddressDetail;
	}
	public void setuAddressDetail(String uAddressDetail) {
		this.uAddressDetail = uAddressDetail;
	}
	public Date getuBirthday() {
		return uBirthday;
	}
	public void setuBirthday(Date uBirthday) {
		this.uBirthday = uBirthday;
	}
	
	
}
