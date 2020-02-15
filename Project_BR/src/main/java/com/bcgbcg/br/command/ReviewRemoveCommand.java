package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.UserDto;

public class ReviewRemoveCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int rIdx = Integer.parseInt(request.getParameter("rIdx"));
		String uId_ = request.getParameter("uId_");
		
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int result = dao.removeReview(rIdx);
		UserDto uDto = dao.selectView(uId_);
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
		
		int result2 = dao.modifyMemberByAdmin(uId_, uPoint, uTotalPoint, uMemberShip);
		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
	}

}
