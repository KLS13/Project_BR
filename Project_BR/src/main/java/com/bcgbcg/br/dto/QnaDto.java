package com.bcgbcg.br.dto;

import java.sql.Date;

public class QnaDto {
	private int qIdx, qCategory, qCheck;
	private String qTitle, uId_, qContent;
	private Date qDate;
	
	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public QnaDto(int qIdx, int qCategory, int qCheck, String qTitle, String uId_, String qContent, Date qDate) {
		super();
		this.qIdx = qIdx;
		this.qCategory = qCategory;
		this.qCheck = qCheck;
		this.qTitle = qTitle;
		this.uId_ = uId_;
		this.qContent = qContent;
		this.qDate = qDate;
	}


	public int getqCheck() {
		return qCheck;
	}


	public void setqCheck(int qCheck) {
		this.qCheck = qCheck;
	}


	public int getqIdx() {
		return qIdx;
	}

	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}

	public int getqCategory() {
		return qCategory;
	}

	public void setqCategory(int qCategory) {
		this.qCategory = qCategory;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getuId_() {
		return uId_;
	}

	public void setuId_(String uId_) {
		this.uId_ = uId_;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	
	
}
