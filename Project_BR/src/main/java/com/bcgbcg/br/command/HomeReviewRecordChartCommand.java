package com.bcgbcg.br.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.AdminDao;
import com.bcgbcg.br.dto.HourDto;

public class HomeReviewRecordChartCommand implements AdminCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		HourDto hDto = dao.selectReviewChartData();
		
		model.addAttribute("hDto", hDto);
	}

}
