package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;


import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.UserDto;

public class MyReviewRemoveCommand implements MyReviewCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int rIdx = Integer.parseInt(request.getParameter("rIdx"));
		String uId_ = request.getParameter("uId_");
		
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		int result = mDao.myRemoveReview(rIdx);
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
		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
	}

}
