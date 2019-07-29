package com.fas.fahiru.dao;

import java.util.List; 
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;

public interface FahsDAO {
	
	public List<Fah> selectMainList();
	public List<Fah> selectListNew();
	public List<Fah> selectListBySpotNo(int spotNo);
	public List<Fah> selectListTfFahs(int tfNo);
	public Fah selectCheckFah(String name);
	//0709 승현 수정
	public List<Fah> selectMyPageList(PageVO pageVO);
	public List<Fah> fahList(PageVO pageVO);
	public List<Fah> fahSearch(PageVO pageVO);
	//0709 승현 수정 end
	public Fah selectCheckFahs(String name);
	
	// 07090709 주하
	public List<Fah> selectCookFahList(int no);
	
	//근경
	//fahDetail 상단
	public Fah selectOneTop(int no);
	//loginUser.no를 이용해 main에 feed 불러오기
	public List<Fah> selectListByUserNo(int no);
}
