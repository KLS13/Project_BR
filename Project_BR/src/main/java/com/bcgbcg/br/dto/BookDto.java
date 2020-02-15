package com.bcgbcg.br.dto;

import java.sql.Date;

public class BookDto {
	
	private long bISBN;
	private String bTitle, bWriter, bPublisher, bImage;
	private Date bPubdate;
	
	public BookDto() {
		// TODO Auto-generated constructor stub
	}
	public BookDto(long bISBN, String bTitle, String bWriter, String bPublisher, String bImage, Date bPubdate) {
		super();
		this.bISBN = bISBN;
		this.bTitle = bTitle;
		this.bWriter = bWriter;
		this.bPublisher = bPublisher;
		this.bImage = bImage;
		this.bPubdate = bPubdate;
	}
	
	public long getbISBN() {
		return bISBN;
	}
	public void setbISBN(long bISBN) {
		this.bISBN = bISBN;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbPublisher() {
		return bPublisher;
	}
	public void setbPublisher(String bPublisher) {
		this.bPublisher = bPublisher;
	}
	public String getbImage() {
		return bImage;
	}
	public void setbImage(String bImage) {
		this.bImage = bImage;
	}
	public Date getbPubdate() {
		return bPubdate;
	}
	public void setbPubdate(Date bPubdate) {
		this.bPubdate = bPubdate;
	}
	
}
