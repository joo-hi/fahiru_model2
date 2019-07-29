package com.fas.fahiru.dao;

import java.util.List; 

import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Spot;
import com.fas.fahiru.vo.TfCook;

public interface SpotsDAO {

	public List<Spot> selectListNew();
	public List<Spot> selectListBySearch(String name);
	public Spot selectOneSpot(int no);
	public Spot selectOneBySpotId(int spotId);
	public int insert(Spot spot);
	public List<Spot> selectListSpot(PageVO pageVO);
	public int selectTotalSpot();
	public List<TfCook> selectSpotTF(int no);
	public List<Fah> selectListSpotFah(int no);
	public List<Spot> selectListSpotOrderBy(PageVO pageVO);
	public List<Spot> selectSpotListByWord(PageVO pageVO);
	//0709 승현 수정
	public List<Spot> myPageSpotList(PageVO pageVO);
	public List<Spot> MyPageSpotBucketList(PageVO pageVO);
	//0709 승현 수정 end
	public List<Spot> selectListByTF(Spot spot);
}
