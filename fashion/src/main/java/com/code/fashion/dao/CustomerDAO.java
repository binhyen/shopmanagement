package com.code.fashion.dao;

import java.util.List;

import com.code.fashion.entity.CustomerEntity;

public interface CustomerDAO {
	public List<CustomerEntity> getListCustomer(int start, int end);

	public double countNumOfCustomer();

	public CustomerEntity getCustomer(String id);

	public void insertOrUpdateCustomer(CustomerEntity customerEntity);

	public void deleteCustomer(String id);

}
