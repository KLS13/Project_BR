package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.MyPageDao;
import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.UserDto;


public class MyPurchaseDetailCommand implements MyPurchaseCommand {
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int pIdx = Integer.parseInt(request.getParameter("pIdx"));
		String currentPage = request.getParameter("currentPage");
		model.addAttribute("currentPage", currentPage);
		
		MyPageDao mDao = sqlSession.getMapper(MyPageDao.class);
		PurchaseDto pDto = mDao.mySelectPurchaseDetail(pIdx);
		UserDto uDto = mDao.mySelectView(pDto.getuId_());
		GoodsDto gDto = mDao.mySelectGoodsDetail(pDto.getgIdx());
		
		model.addAttribute("pDto", pDto);
		model.addAttribute("uDto", uDto);
		model.addAttribute("gDto", gDto);
		
		String pAddress = pDto.getpAddress();
		String address = pAddress.substring(5);
		String zoneCode = pAddress.substring(0, 5);
		
		model.addAttribute("address", address);
		model.addAttribute("zoneCode", zoneCode);
	}

}
 
