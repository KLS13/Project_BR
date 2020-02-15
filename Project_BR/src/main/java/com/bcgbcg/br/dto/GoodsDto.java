package com.bcgbcg.br.dto;

import java.sql.Date;

public class GoodsDto {

	private int gIdx, gQuantity, gPrice, gState;
	private String gName, gImage, gDetail;
	private Date gDate;
	
	public GoodsDto() {
		// TODO Auto-generated constructor stub
	}
	public GoodsDto(int gIdx, int gQuantity, int gPrice, int gState, String gName, String gImage, String gDetail,
			Date gDate) {
		super();
		this.gIdx = gIdx;
		this.gQuantity = gQuantity;
		this.gPrice = gPrice;
		this.gState = gState;
		this.gName = gName;
		this.gImage = gImage;
		this.gDetail = gDetail;
		this.gDate = gDate;
	}
	
	public int getgIdx() {
		return gIdx;
	}
	public void setgIdx(int gIdx) {
		this.gIdx = gIdx;
	}
	public int getgQuantity() {
		return gQuantity;
	}
	public void setgQuantity(int gQuantity) {
		this.gQuantity = gQuantity;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public int getgState() {
		return gState;
	}
	public void setgState(int gState) {
		this.gState = gState;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgImage() {
		return gImage;
	}
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	public String getgDetail() {
		return gDetail;
	}
	public void setgDetail(String gDetail) {
		this.gDetail = gDetail;
	}
	public Date getgDate() {
		return gDate;
	}
	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}
}
