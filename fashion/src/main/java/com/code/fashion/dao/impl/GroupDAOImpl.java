package com.code.fashion.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code.fashion.dao.GroupDAO;
import com.code.fashion.entity.GroupEntity;

@Repository
//@Service
public class GroupDAOImpl implements GroupDAO {
	
	@Autowired
	SessionFactory sessionFactory;
//	Configuration con = new Configuration().configure();
//	SessionFactory sessionFactory = con.buildSessionFactory();


	public List<GroupEntity> listGroup() {
		Session session = sessionFactory.openSession();
		List<GroupEntity> listGroup = null;
		try {
			
			session.beginTransaction();
			listGroup = session.createQuery("from GroupEntity").list();
			for (GroupEntity group : listGroup) {
				System.out.println(group.getId() + " " + group.getGroupName());
			}
			System.out.println("#yen debug thanh cong");
		} catch (Exception e) {
			System.out.println("#yen debug that bai");
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return listGroup;
	}

}
