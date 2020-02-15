package com.bcgbcg.br.dto;

import java.sql.Date;

public class PurchaseDto {
	
	private int pIdx, gIdx, pQuantity;
	private String uId_, pReceiver, pPhone, pAddress, pAddressDetail, pMessage, pInvoiceNo;
	private Date pDate;
	
	public PurchaseDto() {
		// TODO Auto-generated constructor stub
	}
	public PurchaseDto(int pIdx, int gIdx, int pQuantity, String uId_, String pReceiver, String pPhone, String pAddress,
			String pAddressDetail, String pMessage, String pInvoiceNo, Date pDate) {
		super();
		this.pIdx = pIdx;
		this.gIdx = gIdx;
		this.pQuantity = pQuantity;
		this.uId_ = uId_;
		this.pReceiver = pReceiver;
		this.pPhone = pPhone;
		this.pAddress = pAddress;
		this.pAddressDetail = pAddressDetail;
		this.pMessage = pMessage;
		this.pInvoiceNo = pInvoiceNo;
		this.pDate = pDate;
	}
	
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public int getgIdx() {
		return gIdx;
	}
	public void setgIdx(int gIdx) {
		this.gIdx = gIdx;
	}
	public int getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}
	public String getuId_() {
		return uId_;
	}
	public void setuId_(String uId_) {
		this.uId_ = uId_;
	}
	public String getpReceiver() {
		return pReceiver;
	}
	public void setpReceiver(String pReceiver) {
		this.pReceiver = pReceiver;
	}
	public String getpPhone() {
		return pPhone;
	}
	public void setpPhone(String pPhone) {
		this.pPhone = pPhone;
	}
	public String getpAddress() {
		return pAddress;
	}
	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}
	public String getpAddressDetail() {
		return pAddressDetail;
	}
	public void setpAddressDetail(String pAddressDetail) {
		this.pAddressDetail = pAddressDetail;
	}
	public String getpMessage() {
		return pMessage;
	}
	public void setpMessage(String pMessage) {
		this.pMessage = pMessage;
	}
	public String getpInvoiceNo() {
		return pInvoiceNo;
	}
	public void setpInvoiceNo(String pInvoiceNo) {
		this.pInvoiceNo = pInvoiceNo;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	
}
