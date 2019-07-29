package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.Cook;
import com.fas.fahiru.vo.PageVO;

public interface CooksDAO {
	public int insert(Cook cook);
	//0709 승현 수정
	public List<Cook> myPageCookList(PageVO pageVO);
	public List<Cook> MyPageCookBucketList(PageVO pageVO);
	//0709 승현 수정 end
	
	// 07090709 주하
	public Cook selectOneCooksDetail(int no);
}
