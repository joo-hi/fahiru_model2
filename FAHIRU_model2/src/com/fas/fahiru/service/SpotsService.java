package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import com.fas.fahiru.vo.Spot;

public interface SpotsService {
	
	public List<Spot> getSearchSpotList(String name);
	public Map<String, Object> getOne(int no);
	public boolean spotCheck(int spotId);
	public int register(Spot spot);
	
	public Map<String, Object> getSpotList(int pageNo);

	public Map<String, Object> getSpotListByNew(int pageNo);

	public Map<String, Object> getSpotListByWord(String searchWord, int pageNo);
	//	0709 서승현
	public List<Spot> myPageSpotList(int no,int page);
	public List<Spot> myPageBucketSpotList(int no, int page);
	//	0709 서승현 end
	public List<Spot> getSpotList(String tfName,String name);
}
