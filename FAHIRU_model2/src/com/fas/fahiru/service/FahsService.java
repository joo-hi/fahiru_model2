package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;

public interface FahsService {
	
	public Map<String, Object> getSearchPageList();
	public Map<String, Object> checkFah(String name);
	//	0709 서승현
	public List<Fah> getMyPageList(int no,int page);
	public List<Fah> getFahList(int page);
	public List<Fah> fahSearch(PageVO pageVO);
	//	0709 서승현 end
	
	//0709 김근경
		//public List<Fah> getMainList(); 
		//main 페이지에 나올 화씨 리스트
		public Map<String, Object> getMainList();
		
	public Fah getCheckedFah(String name);
	
	
	//fahDetail 상단
	public Fah getOne(int no);
	//main feed
	public Map<String, Object> getFeedList(int no);
	

	
	
	// 07090709 주하
	public List<Fah> getCookFahList(int no);
}
