package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.Source;

public interface SourcesDAO {

	public int insert(Source source);
	
	// 07090709 주하
	public List<Source> selectSources(int no);
}
