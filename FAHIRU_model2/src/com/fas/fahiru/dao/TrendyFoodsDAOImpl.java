package com.fas.fahiru.dao;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.TrendyFood;

public class TrendyFoodsDAOImpl implements TrendyFoodsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

public static List<TrendyFood> selectListTFdetail(int no){
		
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectList("trendyFoods.selectListTFdetail",no);
		}
		catch(Exception e) {
			e.printStackTrace();
			
			return null;
		}
		finally {
			session.close();
		}

	}

	@Override
	public TrendyFood selectOneByTcNo(int no) {
		return session.selectOne("trendyFoods.selectOneByTcNo", no);
	}
	
	//0709 승현 수정
	@Override
	public List<TrendyFood> myPageTrendyFoodList(PageVO pageVO) {
		return session.selectList("trendyFoods.myPageTrendyFoodList",pageVO);
	}
	@Override
	public List<TrendyFood> MyPageTrendyFoodBucketList(PageVO pageVO) {
		return session.selectList("trendyFoods.MyPageTrendyFoodBucketList",pageVO);
	}
	//0709 승현 수정 end
	
	//-------------> 0710 자현
	@Override
	public int insertTf(TrendyFood trendyFood) {
		return session.insert("trendyFoods.insertTf", trendyFood);
	}//insertTf() end
	//<----------------- 0710 
}
