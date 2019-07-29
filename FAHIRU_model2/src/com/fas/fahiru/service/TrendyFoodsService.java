package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fas.fahiru.vo.TrendyFood;

public interface TrendyFoodsService {
	
	public Map<String, Object> getOneDetail(int no, HttpSession session);
	//	0709 서승현
	public List<TrendyFood> getMyPageList(int no,int page);
	public List<TrendyFood> getBucketList(int no,int page);
	//	0709 서승현 end
} 
