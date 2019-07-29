package com.fas.fahiru.service;

import java.util.List;

import com.fas.fahiru.vo.User;

public interface UsersService {
	
	public List<User> getSearchUserList(String name);
	public User doLogin(User user); 
//	0709 서승현
	public User getUser(int no);
	public int profileModify(String profileImg,int no);
	public int informationModify(User user);
	public int selectCheckNickname(String nickname);
	public int introModify(String message,int no);
//	0709 서승현 end
	//---------------->0709 자현
		public int sign(User user);
		public boolean checkNickname(String nickname);
		public boolean checkEmail(String id);
		//<--------------------0709 자현
	
}
