package com.code.fashion.dao;

import java.util.List;

import com.code.fashion.entity.GoodsEntity;

public interface GoodsDAO {

	public List<GoodsEntity> getList();

	public List<GoodsEntity> getListSearch(String searchString);

}
