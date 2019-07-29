package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.User;

public class UsersDAOImpl implements UsersDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<User> selectListNew() {
		return session.selectList("users.selectListNew");
	}

	@Override
	public List<User> selectListBySearch(String name) {
		return session.selectList("users.selectListBySearch", "%" + name + "%");
	}

	@Override
	public User selectLogin(User user) {
		return session.selectOne("users.selectLogin", user);
	}

//	0709 서승현 
	@Override
	public User selectOne(int no) {
		return session.selectOne("users.myPageSelectOne", no);
	}

	@Override
	public int profileUpdate(User user) {
		return session.update("users.profileUpdate", user);
	}

	@Override
	public int informationUpdate(User user) {
		return session.update("users.informationUpdate", user);
	}

	@Override
	public int selectCheckNickname(String nickname) {
		return session.selectOne("users.selectCheckNickname", nickname);
	}

	@Override
	public int introUpdate(User user) {
		return session.update("users.introUpdate", user);
	}

//	0709 서승현	end
	// ---------------->0709 자현
	// 회원가입
	@Override
	public int insert(User user) {
		return session.insert("users.insertSign", user);
	}// insert() end

	// 닉네임 중복체크
	/*
	 * @Override public int selectCheckNickname(String nickname) { return
	 * session.selectOne("users.selectCheckNickname",nickname);
	 * }//selectCheckNickname() end
	 */

	// 이메일 중복체크
	@Override
	public int selectCheckEmail(String id) {
		return session.selectOne("users.selectCheckEmail", id);
	}// selectCheckEmail() end
		// <--------------------0709 자현

}
