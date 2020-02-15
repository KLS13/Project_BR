package com.bcgbcg.br.dto;

import java.sql.Date;

public class CommentDto {
	private int qIdx;
	private String cContent;
	private Date cDate;
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentDto(int qIdx, String cContent, Date cDate) {
		super();
		this.qIdx = qIdx;
		this.cContent = cContent;
		this.cDate = cDate;
	}
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	
	
}
