package com.bcgbcg.br.dao;

import java.util.ArrayList;
import java.util.List;

import com.bcgbcg.br.dto.BookDto;
import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.dto.UserDto;

public interface MyPageDao {
	/* User */
	public ArrayList<UserDto> user();
	public UserDto login(String uId_, String uPassword);
	public UserDto logout();
	public UserDto chekcPw(String uPassword);
	public void create(String uName, String uId_, String uPassword,String uPhone, String uBirthday ,String uEmail, String uAddress, String uGenre );
	public int find(int uIdx);
	public UserDto myInformation(String uId_);
	public int myDelete(int uState, int uIdx);

	/*  리뷰  */
	public ArrayList<ReviewDto> mySelectReviewList(String uId_,int begin, int end);
	public int mySelectReviewListCount();
	public ReviewDto mySelectReviewDetailInReview_t(int rIdx);
	public BookDto mySelectReviewDetailInBook_t(long bISBN);
	public int myRemoveReview(int rIdx);
		
	/*	교환물품	*/
	public List<PurchaseDto> mySelectPurchaseList(String uId_,int begin, int end);
	public int mySelectPurchaseListCount();
	public PurchaseDto mySelectPurchaseDetail(int pIdx);
	public GoodsDto mySelectGoodsDetail(int gIdx);
	
	public UserDto mySelectView(String uId_);
	public int myModifyMemberByUser(String uId_, int uPoint, int uTotalPoint, String uMemberShip);
	
	/* 검색  */
	public List<ReviewDto> mySearchReviewByKey(String key, String value,String uId_, int begin, int end);
	public List<ReviewDto> mySearchReviewByDate(String value,String uId_, int begin, int end);
	
	public int mySearchReviewByKeyCount(String key, String value , String uId_);
	public int mySearchReviewByDateCount(String value , String uId_);
	// ---
	public List<PurchaseDto> mySearchPurchaseBypIdx(int pIdx ,String uId_);
	public List<PurchaseDto> mySearchPurchaseByuId(String value, int begin, int end);
	public List<PurchaseDto> mySearchPurchaseBygName(String value,String uId_, int begin, int end);
	public List<PurchaseDto> mySearchPurchaseByDate(String value,String uId_, int begin, int end);
	
	public int mySearchPurchaseBypIdxCount(int pIdx ,String uId_);
	public int mySearchPurchaseByuIdCount(String value);
	public int mySearchPurchaseBygNameCount(String value, String uId_);
	public int mySearchPurchaseByDateCount(String value,String uId_);
	public int modify(String uPassword, String uPhone, String uEmail, String uAddress, String uGenre, String uAddressDetail, String uId_);
}
