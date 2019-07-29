package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.fas.fahiru.dao.FahsDAO;
import com.fas.fahiru.dao.LikesDAO;
import com.fas.fahiru.dao.SpotsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.vo.Fah;
import com.fas.fahiru.vo.Like;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Spot;
import com.fas.fahiru.vo.TfCook;

public class SpotsServiceImpl implements SpotsService {
	
	private SpotsDAO spotsDAO;
	private FahsDAO fahsDAO;
	private LikesDAO likesDAO;
	private TfCooksDAO tfCooksDAO;
	
	public void setSpotsDAO(SpotsDAO spotsDAO) {
		this.spotsDAO = spotsDAO;
	}
	public void setFahsDAO(FahsDAO fahsDAO) {
		this.fahsDAO = fahsDAO;
	}
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	public void setTfCooksDAO(TfCooksDAO tfCooksDAO) {
		this.tfCooksDAO = tfCooksDAO;
	}
	
	@Override
	public List<Spot> getSearchSpotList(String name) {
		return spotsDAO.selectListBySearch(name);
	}
	
	@Override
	public Map<String, Object> getOne(int no) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		
		int bucketCnt = likesDAO.selectSpotBucketCnt(no);
		
		List<Fah> fahs = fahsDAO.selectListBySpotNo(no);
		
		for (Fah fah : fahs) {
			
			System.out.println(fah.getFname());
			
		}
		
		
		map.put("spot", spotsDAO.selectOneSpot(no));
		map.put("fahs", fahs);
		map.put("bucket", bucketCnt);
		map.put("tfCooks", tfCooksDAO.selectListbySpotNo(no));
		
		return map;
	}
	
	@Override
	public boolean spotCheck(int spotId) {
		return spotsDAO.selectOneBySpotId(spotId)==null;
	}
	
	@Override
	public int register(Spot spot) {
		return spotsDAO.insert(spot);
	}

	@Override
	public Map<String, Object> getSpotList(int pageNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(pageNo, 3);

		
		// spot.setFahList(spotsDAO.selectListSpotFah(1));
		//map.put("fahList",spotsDAO.selectListSpotFah(spot.getNo()));
		//map.put("tfList",spotsDAO.selectSpotTF(spot.getNo()));
		
//		spot.setTfList(spotsDAO.selectSpotTF(1));
//		map.put("TFs",spotsDAO.selectSpotTF(1));
		
		List<Spot> list = spotsDAO.selectListSpot(pageVO);

//		System.out.println(list);
//		System.out.println("get0"+list.get(0).getNo());
//		System.out.println("get1"+list.get(1).getNo());
//		System.out.println("get2"+list.get(2).getNo());
		
		for(Spot spot : list) {
			//int idx = 0;
			//idx++;
			
			System.out.println(spot.getNo());
			List<Fah> fahList = spotsDAO.selectListSpotFah(spot.getNo());
			spot.setFahList(fahList);
		}
		
		for(Spot spot : list) {
			List<TfCook> tfList = spotsDAO.selectSpotTF(spot.getNo());
			spot.setTfList(tfList);
			
		}
		
		for(Spot spot : list) {
			int spotBucketCnt = likesDAO.selectSpotBucketCnt(spot.getNo());
			spot.setSpotBucketCnt(spotBucketCnt);
		}
		
		
		map.put("spots",list);		
		
		return map;
	}
	
	@Override
	public Map<String, Object> getSpotListByNew(int pageNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(pageNo, 3);
		
		List<Spot> list = spotsDAO.selectListSpotOrderBy(pageVO);


		for(Spot spot : list) {
			//int idx = 0;
			//idx++;
			
			System.out.println(spot.getNo());
			List<Fah> fahList = spotsDAO.selectListSpotFah(spot.getNo());
			spot.setFahList(fahList);
		}
		
		for(Spot spot : list) {
			List<TfCook> tfList = spotsDAO.selectSpotTF(spot.getNo());
			spot.setTfList(tfList);
			
		}
		
		for(Spot spot : list) {
			int spotBucketCnt = likesDAO.selectSpotBucketCnt(spot.getNo());
			spot.setSpotBucketCnt(spotBucketCnt);
		}
		
		
		map.put("spots",list);		
		
		return map;
	}
	
	@Override
	public Map<String, Object> getSpotListByWord(String searchWord, int pageNo) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(pageNo, 3, searchWord);
		
		List<Spot> list = spotsDAO.selectSpotListByWord(pageVO);
		

		for(Spot spot : list) {

			System.out.println(spot.getNo());
			List<Fah> fahList = spotsDAO.selectListSpotFah(spot.getNo());
			spot.setFahList(fahList);
		}
		
		for(Spot spot : list) {
			List<TfCook> tfList = spotsDAO.selectSpotTF(spot.getNo());
			spot.setTfList(tfList);
			
		}
		
		for(Spot spot : list) {
			int spotBucketCnt = likesDAO.selectSpotBucketCnt(spot.getNo());
			spot.setSpotBucketCnt(spotBucketCnt);
		}
		
		
		map.put("spots",list);		
		
		return map;
	}
	//	0709 서승현
	@Override
	public List<Spot> myPageSpotList(int no, int page) {
		PageVO pageVO = new PageVO(page, 4, no);
		List<Spot> spots = spotsDAO.myPageSpotList(pageVO);
		for(Spot spot : spots) {
			List<TfCook> tfCooks = spotsDAO.selectSpotTF(spot.getNo());
			spot.setTfList(tfCooks);
		}
		for(Spot spot : spots) {
		List<Fah> fahs = spotsDAO.selectListSpotFah(spot.getNo());
			spot.setFahList(fahs);
		}		
		return spots;
	}

	@Override
	public List<Spot> myPageBucketSpotList(int no, int page) {
		PageVO pageVO = new PageVO(page, 4, no);
		List<Spot> spots = spotsDAO.MyPageSpotBucketList(pageVO);
		for(Spot spot : spots) {
			List<TfCook> tfCooks = spotsDAO.selectSpotTF(spot.getNo());
			spot.setTfList(tfCooks);
		}
		for(Spot spot : spots) {
		List<Fah> fahs = spotsDAO.selectListSpotFah(spot.getNo());
			spot.setFahList(fahs);
		}	
		return spots;
	}
	//	0709 서승현 end
	
	//trendyFood 클릭 후 spot list 
	@Override
	public List<Spot> getSpotList(String tfName, String name) {
		
		name = "%"+name+"%";
		
		Spot spot = new Spot();
		
		spot.setName(name);
		spot.setTfName(tfName);
		
		return spotsDAO.selectListByTF(spot);
	}//getSpotList() end
}
