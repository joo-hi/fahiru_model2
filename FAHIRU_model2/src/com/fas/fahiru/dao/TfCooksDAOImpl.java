package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.TfCook;
import com.fas.fahiru.vo.TrendyFood;

public class TfCooksDAOImpl implements TfCooksDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/* Model2 시작 */

	@Override
	public List<TfCook> selectListTfBySearch(String name) {
		return session.selectList("tfCooks.selectListTfBySearch", "%" + name + "%");
	}

	@Override
	public List<TfCook> selectListCookBySearch(String name) {
		return session.selectList("tfCooks.selectListCookBySearch", "%" + name + "%");
	}

	@Override
	public List<TfCook> selectListbySpotNo(int spotNo) {
		return session.selectList("tfCooks.selectListbySpotNo", spotNo);
	}

	// 0706 주하
	@Override
	public int cookInsert(TfCook tfCook) {
		// TODO Auto-generated method stub
		return session.insert("tfCooks.cookInsert", tfCook);
	}

	@Override
	public TfCook selectOne(String name) {
		// TODO Auto-generated method stub
		return session.selectOne("tfCooks.selectOne", name);
	}

	//근경
		// 0709 
		// main에 보여질 화씨 리스트
		@Override
		public List<TfCook> selectTcListByFahNo(int fahNo) {
			return session.selectList("tfCooks.selectTcListByFahNo", fahNo);
		}

		@Override
		public List<TfCook> selectTcListByFahNoTf(int fahNo) {
			return session.selectList("tfCooks.selectTcListByFahNoTf", fahNo);
		}

		@Override
		public List<TfCook> selectTcListByFahNoCook(int fahNo) {
			return session.selectList("tfCooks.selectTcListByFahNoCook", fahNo);
		}
		
		
		// 0710
		// fahDetailPage 에 page 처리
		@Override
		public List<TfCook> selectTcListByFahNoMap(PageVO pageVO) {
			return session.selectList("tfCooks.selectTcListByFahNoMap",pageVO);
		}
		@Override
		public List<TfCook> selectTcListByFahNoMapTf(PageVO pageVO) {
			return session.selectList("tfCooks.selectTcListByFahNoMapTf",pageVO);
		}
		@Override
		public List<TfCook> selectTcListByFahNoMapCook(PageVO pageVO) {
			return session.selectList("tfCooks.selectTcListByFahNoMapCook",pageVO);
		}
		
		//main following List 에 필요
		@Override
		public List<TfCook> selectTcListByUserNo(int userNo) {
			return session.selectList("tfCooks.selectTcListByUserNo",userNo);
			
		}
	
	
	// trendyFoodSearchForm
	@Override
	public List<TfCook> selectTf(String trendyFoodName) {
		return session.selectList("tfCooks.selectTf", "%" + trendyFoodName + "%");
	}// selectTf() end
	
	//tf insert
	@Override
	public int insertTfCooks(TfCook tfCook) {
		return session.insert("tfCooks.insertTf", tfCook);
	}//insertTf() end

}
