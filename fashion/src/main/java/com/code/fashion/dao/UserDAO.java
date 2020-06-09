package com.code.fashion.dao;

import java.util.List;

import com.code.fashion.entity.UserEntity;

public interface UserDAO {
	public List<UserEntity> getAllUser(int i, int j);
	
	public UserEntity findUserInfo(String username);

	public String getUserGroup(String username);

	public void updateUser(UserEntity user);

	public double getNumOfUser();
	
	public void deleteEmployee(String id);
}
 