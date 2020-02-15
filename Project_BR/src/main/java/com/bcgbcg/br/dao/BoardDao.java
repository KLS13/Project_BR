package com.bcgbcg.br.dao;

import java.util.ArrayList;

import com.bcgbcg.br.dto.BCDto;
import com.bcgbcg.br.dto.BookDto;
import com.bcgbcg.br.dto.ReviewDto;


public interface BoardDao {

 public int reviewWrite(String uId_, double bISBN, String rContent, int rGrade, String bTitle);
 public int addBook(long bISBN, String bTitle, String bWriter,String bPublisher,String bPubdate,String bImage);
 public ArrayList<ReviewDto> getReviewList(long bISBN, int begin, int end);
 public ArrayList<ReviewDto> getAllReviewList(int begin, int end);
 public ArrayList<ReviewDto> getNumberOfReview();
 public ArrayList<ReviewDto> dynamicQueryList(String query, String content, int begin, int end);
 public ArrayList<BookDto> getAllBookList();
 public ArrayList<Long> getBooksByGrade();
 public ArrayList<BookDto> getBooksByNumOfReview();
 public int getTotalReview();
 public int getDynamicTotalReview(String query, String content);
 public int reviewDelete(int rIdx);
 public int reviewModify(int rIdx, String rContent,int rGrade);
 public int getIfYourReviewExists(String uId_, Long bISBN);
 public BookDto searchViewBook(Long bISBN);
 public BCDto bookChartList(); // 북 차트
 public int addPoint(String uId_);
}
