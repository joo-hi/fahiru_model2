package com.fas.fahiru.service;

import java.util.List; 
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.fas.fahiru.dao.FahsDAO;
import com.fas.fahiru.dao.SpotsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.dao.UsersDAO;
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.TfCook;

public class FahsServiceImpl implements FahsService{
	
	private FahsDAO fahsDAO;
	private SpotsDAO spotsDAO;
	private UsersDAO usersDAO;
	private TfCooksDAO tfcooksDAO;
	
	public void setFahsDAO(FahsDAO fahsDAO) {
		this.fahsDAO = fahsDAO;
	}
	
	public void setSpotsDAO(SpotsDAO spotsDAO) {
		this.spotsDAO = spotsDAO;
	}
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	
	public void setTfcooksDAO(TfCooksDAO tfcooksDAO) {
		this.tfcooksDAO = tfcooksDAO;
	}
	
	
	@Override
	public Map<String, Object> getSearchPageList() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("fahNew", fahsDAO.selectListNew());
		map.put("spotNew", spotsDAO.selectListNew());
		map.put("userNew", usersDAO.selectListNew());
		
		return map; 
	}
	
	@Override
	public Map<String, Object> checkFah(String name) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		if(fahsDAO.selectCheckFah(name)!=null) {
			map.put("fahs",fahsDAO.selectCheckFah(name));
		}
		
		return map;
	}
	
	//	0709 서승현
	@Override
	public List<Fah> getMyPageList(int no, int page) {
		PageVO pageVO = new PageVO(page,8,no);
		return fahsDAO.selectMyPageList(pageVO);
	}
	
	@Override
	public List<Fah> getFahList(int page) {
		PageVO pageVO = new PageVO(page,8);
		return fahsDAO.fahList(pageVO);
	}
	
	@Override
	public List<Fah> fahSearch(PageVO pageVO) {
		return fahsDAO.fahSearch(pageVO);
	}
	//	0709 서승현 end
	
	//메인페이지에 보여질 화씨 리스트
			@Override
			public Map<String, Object> getMainList() {
				Map<String, Object> map = new ConcurrentHashMap<String, Object>();
				List<Fah> mainList = fahsDAO.selectMainList();
				//한줄로 처리 할 수 있다.
				for(Fah fah : mainList) {  
					String fName = fah.getName();
					if(fName.length()>=7) {
						fName = fName.substring(0, 7)+"...";
					}
					System.out.println("fName : " + fName );
					System.out.println("getName : " + fah.getName());
					int fahNo = fah.getNo();
					System.out.println("getNo : "+fah.getNo());
					System.out.println("getRanking : "+fah.getRanking());
					List<TfCook> list = tfcooksDAO.selectTcListByFahNo(fahNo);
					
					fah.setTfCook(list);	
				}
				map.put("list", mainList);
				return map;
			}
			
			//fahDetail 상단
			@Override
			public Fah getOne(int no) {
				return fahsDAO.selectOneTop(no);
			}
			//main feed
			@Override
			public Map<String, Object> getFeedList(int no) {
				Map<String, Object> map = new ConcurrentHashMap<String, Object>();
				
				map.put("mainFeed",fahsDAO.selectListByUserNo(no));
				
				return map;
			}
			
		//0709 김근경 end
	
	//---------------->0710 자현
	//Fah 존재 check
	@Override
	public Fah getCheckedFah(String name) {
		return fahsDAO.selectCheckFah(name);
	}//getCheckedFah() end
	//<--------------------0710 자현
	
	
	// 07090709 주하
	@Override
	public List<Fah> getCookFahList(int no) {
		// TODO Auto-generated method stub
		return fahsDAO.selectCookFahList(no);
	}
}
