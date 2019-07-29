package com.fas.fahiru.util;

import java.io.IOException; 
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	
	private static SqlSessionFactory factory;
	
	static {
		
		try {
			
			Reader reader = 
					Resources.getResourceAsReader("com/fas/fahiru/config/mybatis-config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}//try~catch end
		
	}// static

	public static SqlSession getSession() {
		
		return factory.openSession(true);
		
	}//getSession() end
	
}
