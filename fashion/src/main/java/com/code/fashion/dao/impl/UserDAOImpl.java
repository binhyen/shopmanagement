package com.code.fashion.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code.fashion.dao.UserDAO;
import com.code.fashion.entity.UserEntity;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	public UserEntity findUserInfo(String username) {
		Session session = sessionFactory.openSession();
		UserEntity user = null;
		try {
			session.beginTransaction();
			user = session.get(UserEntity.class, username);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}


	public String getUserGroup(String username) {
		Session session = sessionFactory.openSession();
		UserEntity user = null;
		try {
			session.beginTransaction();
//			listUser = session.createQuery("from UserEntity where ROWNUM = 1").set.list();
			user = session.get(UserEntity.class, username);
			String result = user.getGroupId().getId();
			return result;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
		
	}


	public List<UserEntity> getAllUser(int start, int end) {
		String sql = "Select u From " + UserEntity.class.getName() + " u ";
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(sql);
			List<UserEntity> list = query.list();
			session.getTransaction().commit();
			if (0 <= start && start <= list.size() && start <= end) {
				if (end > list.size()) {
					end = list.size() ;
				}
				return list.subList(start, end);
			} else
				return null;
//			return list;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	public void updateUser(UserEntity user) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
		} finally {
			session.close();
		}
	}


	public double getNumOfUser() {
		String sql = "Select u From " + UserEntity.class.getName() + " u ";
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(sql);
			List<UserEntity> list = query.list();
			session.getTransaction().commit();
			return list.size();
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
			return 0;
		} finally {
			session.close();
		}
	}

}
