package com.bcgbcg.br.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.PurchaseDto;
import com.bcgbcg.br.dto.UserDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.bcgbcg.br.dao.mapper.goods";

	@Override
	public void Goods(GoodsDto gdto) throws Exception {
		sql.insert(namespace + ".goods", gdto);

	}
	@Override
	public List<GoodsDto> Goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}
	@Override
	public GoodsDto GoodsDes(int gIdx) throws Exception {
		return sql.selectOne(namespace + ".goodsDes", gIdx);
	}
	@Override
	public void GoodsModify(GoodsDto gdto) throws Exception {
		sql.update(namespace + ".goodsModify", gdto);
	}
	@Override
	public void GoodsDelete(int gIdx) throws Exception {
		sql.update(namespace + ".goodsDelete", gIdx);
	}
	@Override
	public void GoodsSoldOut() throws Exception {
		sql.update(namespace + ".goodsSoldOut");
	}
	@Override
	public GoodsDto GoodsBuyMove(int gIdx) throws Exception {
		return sql.selectOne(namespace + ".goodsBuyMove", gIdx);
	}
	@Override
	public GoodsDto GoodsPayMove(int gIdx) throws Exception {
		return sql.selectOne(namespace + ".goodsBuyMove", gIdx);
		// 같은 SQL 동작이므로 BuyMove 매퍼를 동일하게 사용하였음.
	}
	@Override
	public int PayDecision(int gIdx) throws Exception {
		return sql.update(namespace + ".payDecision", gIdx);	
	}
	@Override
	public void PayDecision_User(int gPrice, int uIdx) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("gPrice", gPrice);
		map.put("uIdx", uIdx);
		
		sql.update(namespace + ".payDecision_user", map);
		
	}
	@Override
	public UserDto loginUpdate(int uIdx) throws Exception {
		
		return sql.selectOne(namespace + ".loginUpdate", uIdx);
	}

	@Override
	public void PurchaseInsert(PurchaseDto pdto) throws Exception {
		sql.insert(namespace + ".purchaseInsert", pdto);
		
	}
}