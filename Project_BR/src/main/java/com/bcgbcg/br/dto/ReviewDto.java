package com.bcgbcg.br.dto;

import java.sql.Date;

public class ReviewDto {

	private int rIdx, rGrade;
	private long bISBN;
	private String uId_, rContent, bTitle;
	private Date rDate;
	
	public ReviewDto() {
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int rIdx, int rGrade, long bISBN, String uId_, String rContent, String bTitle, Date rDate) {
		super();
		this.rIdx = rIdx;
		this.rGrade = rGrade;
		this.bISBN = bISBN;
		this.uId_ = uId_;
		this.rContent = rContent;
		this.bTitle = bTitle;
		this.rDate = rDate;
	}
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	public int getrGrade() {
		return rGrade;
	}
	public void setrGrade(int rGrade) {
		this.rGrade = rGrade;
	}
	public long getbISBN() {
		return bISBN;
	}
	public void setbISBN(long bISBN) {
		this.bISBN = bISBN;
	}
	public String getuId_() {
		return uId_;
	}
	public void setuId_(String uId_) {
		this.uId_ = uId_;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
	
}
