package com.bcgbcg.br.command;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcgbcg.br.dao.GoodsDao;
import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.UserDto;

@Service
public class GoodsCommandImpl implements GoodsCommand {
	
	@Inject
	private GoodsDao dao;
	
	@Override
	public void Goods(GoodsDto gdto) throws Exception {
		dao.Goods(gdto);
	}
	@Override
	public List<GoodsDto> Goodslist() throws Exception {
		return dao.Goodslist();
	}
	@Override
	public GoodsDto GoodsDes(int gIdx) throws Exception {
	
		return dao.GoodsDes(gIdx);
	}
	@Override
	public void GoodsModify(GoodsDto gdto) throws Exception {
		dao.GoodsModify(gdto);
	}
	@Override
	public void GoodsDelete(int gIdx) throws Exception {
		dao.GoodsDelete(gIdx);
	}
	@Override
	public void GoodsSoldOut() throws Exception {
		dao.GoodsSoldOut();
		
	}
	@Override
	public GoodsDto GoodsBuyMove(int gIdx) throws Exception {
		return dao.GoodsBuyMove(gIdx);
		
	}
	@Override
	public GoodsDto GoodsPayMove(int gIdx) throws Exception {
		return dao.GoodsBuyMove(gIdx);
	}
	@Override
	public int PayDecision(int gIdx) throws Exception {
		return dao.PayDecision(gIdx);	
	}
	@Override
	public void PayDecision_User(int gPrice, int uIdx) throws Exception {
		dao.PayDecision_User(gPrice, uIdx);
	}
	@Override
	public UserDto loginUpdate(int uIdx) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginUpdate(uIdx);
	}
	@Override
	public void PurchaseInsert(PurchaseDto pdto) throws Exception {
		dao.PurchaseInsert(pdto);	
	}
}