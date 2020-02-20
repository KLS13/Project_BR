package com.bcgbcg.br.util;

public class QnaPaging {
	
	public static String getPaging(String path, int nowPage, int recordPerPage, int totalRecord) {
	      
	      StringBuffer sb = new StringBuffer();

	      int totalPage = 0;
	      int beginPageOfBlock = 0;   // 블록의 시작 페이지 번호
	      int endPageOfBlock = 0;      // 블록의 끝 페이지 번호
	      int pagePerBlock = 3;       // 한 블록당 표시할 페이지 개수
	      
	     
	      totalPage= (int)(totalRecord / recordPerPage);
	      if((totalRecord%recordPerPage) != 0) {
	         totalPage++;
	      }
	      	   
	      if(nowPage>totalPage) {
	         totalPage = nowPage;
	      }

	      beginPageOfBlock = (int)(((nowPage-1) / pagePerBlock) * pagePerBlock) + 1;
	      endPageOfBlock = beginPageOfBlock + pagePerBlock - 1;
    
	      if(endPageOfBlock > totalPage) {
	         endPageOfBlock = totalPage;
	      }
	      
	    
	      if(beginPageOfBlock < pagePerBlock) {
	         sb.append("<span style='color:lightgray;'>◀</span>&nbsp;&nbsp;");
	      }else {
	         sb.append("<a href='" + path + "?currentPage=" + (beginPageOfBlock - 1) + "'>◀</a>&nbsp;&nbsp;");
	      }
	   
	      for(int page = beginPageOfBlock; page <= endPageOfBlock; page++) {
	         if(page == nowPage) {
	            sb.append("<span style='font-weight:bold'>" + page + "</span>&nbsp;");
	         }else {
	            //sb.append("<a href='" + path + "?currentPage=" + (page) + "'>" + page + "</a>&nbsp;");
	            sb.append("<a href='" + path + "?currentPage=" + (page) + "'>" + page + "</a>&nbsp;");
	         }
	      }
	     
	      if(endPageOfBlock >= totalPage) {
	         sb.append("&nbsp;<span style='color:lightgray;'>▶</span>");
	      }else {
	         sb.append("&nbsp;<a href='" + path + "?currentPage=" + (endPageOfBlock + 1) + "'>▶</a>");
	      }
	      return sb.toString();
	   }
	}
