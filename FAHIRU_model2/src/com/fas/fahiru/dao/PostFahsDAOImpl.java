package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Cook;
import com.fas.fahiru.vo.Follow;
import com.fas.fahiru.vo.PostFah;

public class PostFahsDAOImpl implements PostFahsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public static List<Follow> selectFahsList (int fahNo) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectList("follows.selectFahsList",fahNo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end

		return null;
	}
	
	public static int insert(PostFah postFah) {
		int result = 0;
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("postFahs.insertCook",postFah);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}

//	0619 홍 selectListByFahNo
	
	public static List<PostFah> selectListByFahNo(int fahNo) {
		
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			
			return session.selectList("postFahs.selectListByFahNo",fahNo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end

		return null;
	}
	
	// 0706 주하
	
	@Override
	public int insertCook(PostFah postFah) {
		// TODO Auto-generated method stub
		return session.insert("postFahs.insertCook", postFah);
	}
	
	
	//------------------> 0710 자현
	@Override
	public int insertTf(PostFah postFah) {
		return session.insert("postFahs.insertCook",postFah);
	}//insertTf() end
	//<------------------------ 0710 자현
}
