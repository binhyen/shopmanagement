package com.code.fashion.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code.fashion.dao.CustomerDAO;
import com.code.fashion.entity.CustomerEntity;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SessionFactory sessionFactory;
	public List<CustomerEntity> getListCustomer(int start, int end) {
		String sql = "Select e From " + CustomerEntity.class.getName() + " e";
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(sql);
			List<CustomerEntity> list = query.list();
			session.getTransaction().commit();
			if (0 <= start && start <= list.size() && start <= end) {
				if (end > list.size()) {
					end = list.size();
				}
				return list.subList(start, end);
			} else
				return null;
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
			return null;
		} finally {
			session.close();
		}
	}
	public double countNumOfCustomer() {
		String sql = "Select e From " + CustomerEntity.class.getName() + " e";
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(sql);
			List<CustomerEntity> list = query.list();
			session.getTransaction().commit();

			return list.size();
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
			return 0;
		} finally {
			session.close();
		}
	}
	public CustomerEntity getCustomer(String id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			CustomerEntity emp = (CustomerEntity) session.get(CustomerEntity.class, id);
			session.getTransaction().commit();
			return emp;
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
			System.out.println("CustomerDAO :" + e.getMessage());
			return null;
		} finally {
			session.close();
		}
	}
	public void insertOrUpdateCustomer(CustomerEntity customerEntity) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(customerEntity);
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
	}
	public void deleteCustomer(String id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCustomer(id));
			session.getTransaction().commit();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Loi CustomerDAO: " + e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		
	}

}
