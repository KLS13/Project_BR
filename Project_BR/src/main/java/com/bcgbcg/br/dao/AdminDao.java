package com.bcgbcg.br.dao;

import java.util.ArrayList;
import java.util.List;

import com.bcgbcg.br.dto.BookDto;
import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.HourDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.dto.UserDto;

public interface AdminDao {

	public HourDto selectReviewChartData();
	
	public List<UserDto> selectList(int begin, int end);
	public int selectMemberCount();
	
	public UserDto selectView(String uId_);
	public int selectReview_tByuId(String uId_);
	
	public int modifyMemberByAdmin(String uId_, int uPoint, int uTotalPoint, String uMemberShip);
	public int modifyMemberToStop(String uId_);
	public int modifyMemberToRelease(String uId_);
	public int removeMember(String uId_);
	
	// 리뷰 리스트, 상세보기, 삭제
	public ArrayList<ReviewDto> selectReviewList(int begin, int end);
	public int selectReviewListCount();
	public ReviewDto selectReviewDetailInReview_t(int rIdx);
	public BookDto selectReviewDetailInBook_t(long bISBN);
	public int removeReview(int rIdx);
	
	// 교환내역 리스트, 상세보기
	public List<PurchaseDto> selectPurchaseList(int begin, int end);
	public int selectPurchaseListCount();
	
	public PurchaseDto selectPurchaseDetail(int pIdx);
	public GoodsDto selectGoodsDetail(int gIdx);
	
	public int modifyInvoiceNo(int pIdx, String tInvoiceNo);

	// 검색(회원-리뷰-교환 순)
	public List<UserDto> searchMember(String key, String value, int begin, int end);
	public int searchMemberCount(String key, String value);
	
	public List<UserDto> searchMemberForMap(String key, String value, int begin, int end);
	public int searchMemberForMapCount(String key, String value);
	// ----
	public List<ReviewDto> searchReviewByKey(String key, String value, int begin, int end);
	public List<ReviewDto> searchReviewByDate(String value, int begin, int end);
	
	public int searchReviewByKeyCount(String key, String value);
	public int searchReviewByDateCount(String value);
	// ---
	public List<PurchaseDto> searchPurchaseBypIdx(int pIdx);
	public List<PurchaseDto> searchPurchaseByuId(String value, int begin, int end);
	public List<PurchaseDto> searchPurchaseBygName(String value, int begin, int end);
	public List<PurchaseDto> searchPurchaseByDate(String value, int begin, int end);
	
	public int searchPurchaseBypIdxCount(int pIdx);
	public int searchPurchaseByuIdCount(String value);
	public int searchPurchaseBygNameCount(String value);
	public int searchPurchaseByDateCount(String value);
}
