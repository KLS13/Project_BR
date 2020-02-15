package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dto.UserDto;


public class ReviewWriteCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String uId_ = request.getParameter("uId_");
		long bISBN =Long.parseLong(request.getParameter("bISBN"));
		
		String rContent = request.getParameter("rContent");
		int rGrade = Integer.parseInt(request.getParameter("rGrade"));
		String bTitle = request.getParameter("bTitle");
		String bWriter = request.getParameter("bWriter");
		String bPublisher = request.getParameter("bPublisher");
		String bPubdate = request.getParameter("bPubdate");
		String bImage = request.getParameter("bImage");
		
		bDao.addBook(bISBN, bTitle, bWriter, bPublisher, bPubdate, bImage);

		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		UserDto uDto = dao.selectView(uId_);
		int uPoint = uDto.getuPoint();
		int uTotalPoint = uDto.getuTotalPoint();
		String uMemberShip = uDto.getuMemberShip();
		if(uTotalPoint < 3100) {
			uMemberShip = "normal";
		}else if(uTotalPoint < 10100) {
			uMemberShip = "expert";
		}
		uPoint += 100;
		uTotalPoint += 100;
		
		int result2 = dao.modifyMemberByAdmin(uId_, uPoint, uTotalPoint, uMemberShip);
		
		RedirectAttributes rda = (RedirectAttributes)map.get("rda");
		rda.addFlashAttribute("result", bDao.reviewWrite(uId_, bISBN, rContent, rGrade, bTitle));
		rda.addFlashAttribute("result2", result2);	
		rda.addFlashAttribute("bISBN", bISBN);
		
		
	}

}
