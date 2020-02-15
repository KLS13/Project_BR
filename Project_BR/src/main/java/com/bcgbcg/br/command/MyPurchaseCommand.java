package com.bcgbcg.br.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MyPurchaseCommand {
	public void execute(SqlSession sqlSession, Model model);
}
