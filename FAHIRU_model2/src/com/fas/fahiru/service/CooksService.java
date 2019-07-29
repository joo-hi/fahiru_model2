package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fas.fahiru.vo.Cook;

public interface CooksService {

	public int insert(Cook cook, String name, String openAccept, String tipAccept);
	//	0709 서승현
	public List<Cook> getMyPageList(int no, int page);
	public List<Cook> getBucketList(int no, int page);
	//	0709 서승현 end
	
	// 07150715 주하
	public Map<String, Object> getOneCooksDetail(int no, HttpSession session);
}
