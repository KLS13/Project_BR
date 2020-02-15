package com.bcgbcg.br.command;

import java.util.List;

import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.UserDto;

public interface GoodsCommand {
	
	public void Goods(GoodsDto gdto) throws Exception;	
	public List<GoodsDto> Goodslist() throws Exception;	
	public GoodsDto GoodsDes(int gIdx) throws Exception;	
	public void GoodsModify(GoodsDto pd) throws Exception;	
	public void GoodsDelete(int gIdx) throws Exception;	
	public void GoodsSoldOut() throws Exception;	
	public GoodsDto GoodsBuyMove(int gIdx) throws Exception;
	public GoodsDto GoodsPayMove(int gIdx) throws Exception;
	public int PayDecision(int gIdx) throws Exception;
	public void PayDecision_User(int gPrice, int uIdx) throws Exception;
	public UserDto loginUpdate(int uIdx) throws Exception;
	public void PurchaseInsert(PurchaseDto pdto) throws Exception;
	
}