package com.code.fashion.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code.fashion.dao.GoodsDAO;
import com.code.fashion.entity.GoodsEntity;

@SuppressWarnings("deprecation")
@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<GoodsEntity> getList() {
		String hql = "SELECT u FROM " + GoodsEntity.class.getName() + " u";
		
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery(hql);
			session.getTransaction().commit();
			return query.list();
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e);
			return null;
		} finally {
			session.close();
		}
	}

	public List<GoodsEntity> getListSearch(String searchString) {
		String hql = "SELECT u FROM " + GoodsEntity.class.getName() + " u where Id like  '%"+searchString+"%' or Name like  '%"+searchString+"%'";
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery(hql);
			session.getTransaction().commit();
			return query.list();
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e);
			return null;
		} finally {
			session.close();
		}
	}

}
