package com.bcgbcg.br.dao;

import java.util.List;

import com.bcgbcg.br.dto.QnaDto;

public interface QnaDao {

	public List<QnaDto> qnaList(int begin, int end);
	public int qnaListCount();
	public int qnaWrite(int qCategory, String qTitle, String uId_, String qContent);
	public QnaDto qnaView(int qIdx);
	public void qnaModify(int qIdx, int qCategory,String qTitle,String qContent);
	public void qnaDelete(int qIdx);
	public void qnaCheckUpdate(int qIdx);
	public List<QnaDto> qnaMyList(String uId_, int begin, int end);
	
}