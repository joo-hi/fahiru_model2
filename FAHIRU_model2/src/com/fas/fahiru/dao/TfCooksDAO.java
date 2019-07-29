package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.TfCook;

public interface TfCooksDAO {
	
	public List<TfCook> selectListTfBySearch(String name);
	public List<TfCook> selectListCookBySearch(String name);
	public List<TfCook> selectListbySpotNo(int spotNo);
	public int cookInsert(TfCook tfCook);
	public TfCook selectOne(String name);
	public List<TfCook> selectTf(String trendyFoodName);
	public int insertTfCooks(TfCook tfCook);
	
	
	//근경
	
	//fahDetail page에서 전체/TF/COOK 
	public List<TfCook> selectTcListByFahNo(int fahNo);
	public List<TfCook> selectTcListByFahNoTf(int fahNo);
	public List<TfCook> selectTcListByFahNoCook(int fahNo);
	
	//fahDetail page 페이징처리 전체/TF/COOK
	public List<TfCook> selectTcListByFahNoMap(PageVO pageVO);
	public List<TfCook> selectTcListByFahNoMapTf(PageVO pageVO);
	public List<TfCook> selectTcListByFahNoMapCook(PageVO pageVO);
	
	//main followingList에 필요한..userNo를 이용한..오켕;//
	public List<TfCook> selectTcListByUserNo(int userNo);
}
