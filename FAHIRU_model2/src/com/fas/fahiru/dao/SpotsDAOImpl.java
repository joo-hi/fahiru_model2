package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Spot;
import com.fas.fahiru.vo.TfCook;

public class SpotsDAOImpl implements SpotsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/* model2 시작 */
	
	@Override
	public List<Spot> selectListNew() {
		return session.selectList("spots.selectListNew");
	}
	
	@Override
	public List<Spot> selectListBySearch(String name) {
		return session.selectList("spots.selectListBySearch", "%"+name+"%");
	}
	
	@Override
	public Spot selectOneSpot(int no) {
		return session.selectOne("spots.selectOneSpot", no);
	}
	
	@Override
	public Spot selectOneBySpotId(int spotId) {
		return session.selectOne("spots.selectOneBySpotId", spotId);
	}
	
	@Override
	public int insert(Spot spot) {
		return session.insert("spots.insert", spot);
	}

	
	// 0707 주하
	@Override
	public List<Spot> selectListSpot(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("spots.selectListSpot",pageVO);
	}
	
	// spot 총 개수
	@Override
	public int selectTotalSpot() {
		// TODO Auto-generated method stub
		return session.selectOne("spots.selectTotalSpot");
	}
	
	// spot에 따른 트렌드메뉴
	@Override
	public List<TfCook> selectSpotTF(int no) {
		// TODO Auto-generated method stub
		return session.selectList("spots.selectSpotTF",no);
	}
	
	// spot에 따른 트렌드메뉴에 따른 화씨
	@Override
	public List<Fah> selectListSpotFah(int no) {
		// TODO Auto-generated method stub
		return session.selectList("spots.selectListSpotFah",no);
	}
	
	@Override
	public List<Spot> selectListSpotOrderBy(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("spots.selectListSpotOrderBy",pageVO);
	}
	
	@Override
	public List<Spot> selectSpotListByWord(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("spots.selectSpotListByWord",pageVO);
	}
	
	//0709 승현 수정
	@Override
	public List<Spot> myPageSpotList(PageVO pageVO) {
		return session.selectList("spots.myPageSpotList",pageVO);
	}
	@Override
	public List<Spot> MyPageSpotBucketList(PageVO pageVO) {
		return session.selectList("spots.MyPageSpotBucketList",pageVO);
	}
	//0709 승현 수정 end
	
	//trendyFood 클릭 후 spot list  
	@Override
	public List<Spot> selectListByTF(Spot spot) {
		return session.selectList("spots.selectListByTF", spot);
	}//selectTotalByTF() end
}
