package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.TrendyFood;

public interface TrendyFoodsDAO {
	
	public TrendyFood selectOneByTcNo(int no);
	//0709 승현 수정
	public List<TrendyFood> myPageTrendyFoodList(PageVO pageVO);
	public List<TrendyFood> MyPageTrendyFoodBucketList(PageVO pageVO);
	//0709 승현 수정 end
	public int insertTf(TrendyFood trendyFood);
}
