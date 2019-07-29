package com.fas.fahiru.service;

import java.util.List;

import com.fas.fahiru.dao.UsersDAO;
import com.fas.fahiru.vo.User;

public class UsersServiceImpl implements UsersService {
	
	private UsersDAO usersDAO;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	@Override
	public List<User> getSearchUserList(String name) {
		return usersDAO.selectListBySearch(name);
	}
	
	@Override
	public User doLogin(User user) {
		return usersDAO.selectLogin(user);
	}
//	0709 서승현
	@Override
	public User getUser(int no) {
		return usersDAO.selectOne(no);
	}
	
	@Override
	public int profileModify(String profileImg, int no) {
		User user = new User();
		user.setNo(no);
		user.setProfileImg(profileImg);
		return usersDAO.profileUpdate(user);
	}
	
	@Override
	public int informationModify(User user) {
		return usersDAO.informationUpdate(user);
	}
	
	@Override
	public int selectCheckNickname(String nickname) {
		return usersDAO.selectCheckNickname(nickname);
	}
	
	@Override
	public int introModify(String message, int no) {
		User user = new User();
		user.setMessage(message);
		user.setNo(no);
		return usersDAO.introUpdate(user);
	}
//	0709 서승현 end
	//---------------->0709 자현
		//회원가입			
			@Override
			public int sign(User user) {
				return usersDAO.insert(user);
			}//sign() end
			
			
			//nickname 중복체크
			@Override
			public boolean checkNickname(String nickname) {
				return 0 == usersDAO.selectCheckNickname(nickname);
			}//checkNickname() end
			
			
			//email 중복체크
			@Override
			public boolean checkEmail(String id) {
				return 0 == usersDAO.selectCheckEmail(id);
			}//checkEmail() end
			//<--------------------0709 자현
}
