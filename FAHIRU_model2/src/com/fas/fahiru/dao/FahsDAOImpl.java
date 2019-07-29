package com.fas.fahiru.dao;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.TfCook;

public class FahsDAOImpl implements FahsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	/*
	public static List<Fah> selectListByUserNo(int no) {
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("fahs.selectListByUserNo",no);
		}
		catch(Exception e) {
			e. printStackTrace();
			
			return null;
		}
		finally {
			session.close();
		}
	
	}
	*/
		
	//selectTotal
		public static int selectTotal() {
			int total = 0;
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				total = session.selectOne("fahs.selectTotal");
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}//try~catch~finally end 
			return total;
		}
		
		/*
		public static Fah selectOneTop(int no){
			Fah fah = null;
			SqlSession session =  null;
			
			try {
				session = SqlSessionUtil.getSession();
				fah = session.selectOne("fahs.selectOneTop",no);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}//try~catch~finally end 
			return fah;
		}
		*/
		public static int insertFah(Fah fah){
			int result = 0;
			SqlSession session = null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.insert("fahs.insertFah",fah);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return result;
		}
		
		
//		0619 홍 selectListBySearch
		
		public static List<TfCook> selectListTfBySearch(String name) {
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("fahs.selectListTfBySearch", "%"+name+"%");
			}
			catch(Exception e) {
				e. printStackTrace();
				return null;
			}
			finally {
				session.close();
			}
		}
		
		public static List<TfCook> selectListCookBySearch(String name) {
			SqlSession session = null;
			
			try {
				session = SqlSessionUtil.getSession();
				return session.selectList("fahs.selectListCookBySearch", "%"+name+"%");
			}
			catch(Exception e) {
				e. printStackTrace();
				return null;
			}
			finally {
				session.close();
			}
		}

		/* Model2 시작 */
		
		@Override
		public List<Fah> selectMainList() {
			return session.selectList("fahs.selectMainList");
		}
		
		@Override
		public List<Fah> selectListNew() {
			return session.selectList("fahs.selectListNew");
		}
		
		@Override
		public List<Fah> selectListBySpotNo(int spotNo) {
			return session.selectList("fahs.selectListBySpotNo",spotNo);
		}
		
		public List<Fah> selectListTfFahs(int tfNo){
			return session.selectList("fahs.selectListTfFahs", tfNo);
		}

		
		// 0706 주하
		@Override
		public Fah selectCheckFah(String name) {
			// TODO Auto-generated method stub
			return session.selectOne("fahs.selectCheckFah",name);
		}
		
		//0709 승현 수정
		@Override
		public List<Fah> selectMyPageList(PageVO pageVO) {
			return session.selectList("fahs.selectMyPageList",pageVO);
		}
		@Override
		public List<Fah> fahList(PageVO pageVO) {
			return session.selectList("fahs.selectList",pageVO);
		}
		@Override
		public List<Fah> fahSearch(PageVO pageVO) {
			return session.selectList("fahs.fahSearch",pageVO);
		}
		//0709 승현 수정 end
		
		//Fah 존재 여부 확인
		@Override
		public Fah selectCheckFahs(String name) {
			return session.selectOne("fahs.selectCheckFah",name);
		}//selectCheckFah() end
		
		// 07090709 주하
		@Override
		public List<Fah> selectCookFahList(int no) {
			// TODO Auto-generated method stub
			return session.selectList("fahs.selectCookFahList",no);
		}
		
		//근경 
		//fahDetail 상단
		@Override
		public Fah selectOneTop(int no) {
			return session.selectOne("fahs.selectOneTop",no);
		}
		//main feed
		@Override
		public List<Fah> selectListByUserNo(int no) {
			return session.selectList("fahs.selectListByUserNo",no);
		}
}
