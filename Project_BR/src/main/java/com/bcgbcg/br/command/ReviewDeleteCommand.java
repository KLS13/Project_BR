package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.dao.BoardDao;
import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.UserDto;

public class ReviewDeleteCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String uId_ = request.getParameter("uId_");
		
		int rIdx = Integer.parseInt(request.getParameter("rIdx"));
	    String bTitle = request.getParameter("bTitle");
		long bISBN =Long.parseLong(request.getParameter("bISBN"));
		int result = bDao.reviewDelete(rIdx);
		model.addAttribute(result);
		
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		UserDto uDto = mDao.mySelectView(uId_);
		int uPoint = uDto.getuPoint();
		int uTotalPoint = uDto.getuTotalPoint();
		String uMemberShip = uDto.getuMemberShip();
		if(uTotalPoint < 3100) {
			uMemberShip = "normal";
		}else if(uTotalPoint < 10100) {
			uMemberShip = "expert";
		}
		uPoint -= 100;
		uTotalPoint -= 100;
		
		int result2 = mDao.myModifyMemberByUser(uId_, uPoint, uTotalPoint, uMemberShip);
		RedirectAttributes rda = (RedirectAttributes)map.get("rda");
		rda.addFlashAttribute("result", result);
		rda.addFlashAttribute("result2", result2);
		rda.addFlashAttribute("bTitle", bTitle);
		rda.addFlashAttribute("bISBN", bISBN);
	}

}
