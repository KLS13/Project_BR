package com.bcgbcg.br.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dto.ReviewDto;
import com.bcgbcg.br.dto.UserDto;
import com.bcgbcg.br.util.Paging2;



public class ReviewListCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	    BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		//////////
		String currentPage = request.getParameter("currentPage");
		
        int nowPage = 1;
		
		if(currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}
		
		model.addAttribute("currentPage", nowPage);
		
		int recordPerPage = 3;
		int begin = (nowPage -1 ) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;
		///////////페이징//////
		
		
		long bISBN = Long.parseLong(request.getParameter("bISBN"));
		String bTitle = request.getParameter("title");
	    String bWriter = request.getParameter("writer");
	    String bPublisher = request.getParameter("publisher");
	    String bImage = request.getParameter("img");
	    String bPubdate = request.getParameter("pubdate");
	    
	    try {	
	    	UserDto uDto = (UserDto)session.getAttribute("loginDto");
	    	String uId_ = uDto.getuId_();
	    	if(uId_ != null) {
	    		int reviewRecord = bDao.getIfYourReviewExists(uId_, bISBN);
	    		model.addAttribute("reviewRecord", reviewRecord);
	    		model.addAttribute("uId_",uId_);
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }	
	   
       
		model.addAttribute("result", bDao.getReviewList(bISBN,begin,end).size());
	    ArrayList<ReviewDto> list = bDao.getReviewList(bISBN,begin,end);
		model.addAttribute("list", list);
		
		int totalRecord = bDao.getTotalReview();
		
		String pagingView = Paging2.getPaging("viewBook?bTitle="+bTitle+"&bISBN="+bISBN+"&bWriter="+bWriter+"&bPublisher="+bPublisher+"&bImage="+bImage+"&bPubdate="+bPubdate, nowPage, recordPerPage, totalRecord);
		model.addAttribute("pagingView", pagingView);
        
		
		
	}

}
