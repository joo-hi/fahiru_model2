package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import com.fas.fahiru.vo.TfCook;

public interface TfCooksService {

	public List<TfCook> getSearchTfList(String name);
	public List<TfCook> getSearchCookList(String name);
	// 0706 주하
	public int insert(TfCook tfCook);
	public TfCook getOne(String name);
	// 0709 근경
	public List<TfCook> getFahList(int fahNo);
	// 0716
	public List<TfCook> getFahListTf(int fahNo);
	public List<TfCook> getFahListCook(int fahNo);
	public Map<String, Object> getFahMapList(int no, int page);
	public Map<String, Object> getFahMapListTf(int no, int page);
	public Map<String, Object> getFahMapListCook(int no, int page);
	// 근경 end
	// ---------------->0709 자현
	public List<TfCook> getList(String trendyFoodName);
	// ---------------->0710 자현
	public boolean registerTF(int spotNo, int price, int userNo, String name, String img, int[] fahNos);
	// <--------------------0710 자현
}
