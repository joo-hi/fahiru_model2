package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.transaction.annotation.Transactional;

import com.fas.fahiru.dao.PostFahsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.dao.TrendyFoodsDAO;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.PostFah;
import com.fas.fahiru.vo.TfCook;
import com.fas.fahiru.vo.TrendyFood;

public class TfCooksServiceImpl implements TfCooksService {
	//------------------의존성 주입-------------------------
	private TfCooksDAO tfCooksDAO;
	private TrendyFoodsDAO foodsDAO;
	private PostFahsDAO postFahsDAO;
	
	public void setTfCooksDAO(TfCooksDAO tfCooksDAO) {
		this.tfCooksDAO = tfCooksDAO;
	}
	
	public void setFoodsDAO(TrendyFoodsDAO foodsDAO) {
		this.foodsDAO = foodsDAO;
	}
	
	public void setPostFahsDAO(PostFahsDAO postFahsDAO) {
		this.postFahsDAO = postFahsDAO;
	}
	/*-----------------------------------------------------*/
	
	
	
	@Override
	public List<TfCook> getSearchTfList(String name) {
		return tfCooksDAO.selectListTfBySearch(name);
	}
	
	@Override
	public List<TfCook> getSearchCookList(String name) {
		return tfCooksDAO.selectListCookBySearch(name);
	}
	
	@Override
	public int insert(TfCook tfCook) {
		// TODO Auto-generated method stub
		return tfCooksDAO.cookInsert(tfCook);
	}
	
	@Override
	public TfCook getOne(String name) {
		// TODO Auto-generated method stub
		return tfCooksDAO.selectOne(name);
	}
	
	//0709 근경
		@Override
		public List<TfCook> getFahList(int fahNo) {
			return tfCooksDAO.selectTcListByFahNo(fahNo);
		}
		@Override
		public List<TfCook> getFahListTf(int fahNo) {
			return tfCooksDAO.selectTcListByFahNoTf(fahNo);
		}
		
		@Override
		public List<TfCook> getFahListCook(int fahNo) {
			return tfCooksDAO.selectTcListByFahNoCook(fahNo);
		}
		
		
		@Override
		public Map<String, Object> getFahMapList(int no, int page) {
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			PageVO pageVO = new PageVO(page, 4,no);
			map.put("mapList",tfCooksDAO.selectTcListByFahNoMap(pageVO));
			return map;
		}
		
		@Override
		public Map<String, Object> getFahMapListTf(int no, int page) {
			//Map을 이용하면 먼저 map 객체를 만들고 map으로 리턴해야합니다.
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			//int pageNo, int numPage, int no =>pageVO에 원래 있던건데 page로 하는건 ajax에서 변수로 했기 때문,
			//numPage 는 한 페이지에 보여질
			//no는 fahNo
			PageVO pageVO = new PageVO(page,4,no);
			
			map.put("mapListTf",tfCooksDAO.selectTcListByFahNoMapTf(pageVO));
			return map;
		}
		
		@Override
		public Map<String, Object> getFahMapListCook(int no, int page) {
			Map<String, Object> map = new ConcurrentHashMap<String, Object>();
			PageVO pageVO = new PageVO(page,4,no);
			map.put("mapListCook",tfCooksDAO.selectTcListByFahNoMapCook(pageVO));
			
			return map;
		}	
		
		
		
	//근경 end 
		
		

	//---------------->0709 자현
	//trendyFoodSearchForm
	@Override
	public List<TfCook> getList(String trendyFoodName) {
		List<TfCook> list = tfCooksDAO.selectTf(trendyFoodName);
		
		return list; 
	}//getList() end
	//<--------------------0709 자현
	
	//---------------->0710 자현
	//tf insert 
	@Override
	@Transactional
	public boolean registerTF(int spotNo, int price, int userNo, String name, String img, int[] fahNos) {
		
		TfCook tfCook = new TfCook();
			//tfCook.setNo(no);
			tfCook.setUserNo(5);
			tfCook.setName(name);
			tfCook.setImg(img);
			
			
			tfCooksDAO.insertTfCooks(tfCook);
		
			
		TrendyFood trendyFood = new TrendyFood();
			trendyFood.setNo(tfCook.getNo());
			trendyFood.setSpotNo(spotNo);
			trendyFood.setPrice(price);
			
		
			foodsDAO.insertTf(trendyFood);
			
		for(int fahNo : fahNos) {
			
			PostFah postFah = new PostFah();
			postFah.setFahNo(fahNo);
			postFah.setPostNo(tfCook.getNo());
			
			
			postFahsDAO.insertTf(postFah);
			
		}//for end
		
		return true;
	}//registerTF() end
	//<--------------------0710 자현
}
