package com.fas.fahiru.dao;

import java.util.List; 

import com.fas.fahiru.vo.User;

public interface UsersDAO {
	
	public List<User> selectListNew();
	public List<User> selectListBySearch(String name);
	public User selectLogin(User user);
	//	0709 서승현
	public User selectOne(int no);
	public int profileUpdate(User user);
	public int informationUpdate(User user);
	public int selectCheckNickname(String nickname);
	public int introUpdate(User user);
	//	0709 서승현 end
	
	//---------------->0709 자현
		public int insert(User user);
		public int selectCheckEmail(String id);
		//<--------------------0709 자현
	
}
