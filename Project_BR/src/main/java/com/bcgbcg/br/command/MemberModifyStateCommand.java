package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bcgbcg.br.dao.AdminDao;

public class MemberModifyStateCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String state = request.getParameter("state");
		String uId_ = request.getParameter("uId_");
		String currentPage = request.getParameter("currentPage");
		
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int result = 0;
		if(state.equalsIgnoreCase("Stop")) {
			result = dao.modifyMemberToStop(uId_);
		}else if(state.equalsIgnoreCase("Remove")) {
			result = dao.removeMember(uId_);
		}else {
			result = dao.modifyMemberToRelease(uId_);
		}
		
		RedirectAttributes redirectAttributes = (RedirectAttributes) map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("result", result);
		redirectAttributes.addFlashAttribute("currentPage", currentPage);		
		
	}

}
