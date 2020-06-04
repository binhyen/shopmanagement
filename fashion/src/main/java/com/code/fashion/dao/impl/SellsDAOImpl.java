package com.code.fashion.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.code.fashion.dao.SellsDAO;
import com.code.fashion.entity.SellGoodsEntity;
import com.code.fashion.model.Report;

@Repository
public class SellsDAOImpl implements SellsDAO {

	@Autowired
	SessionFactory sessionFactory;

	public List<Report> getDayReport(String date) {
		// TODO Auto-generated method stub
		String sql = "Select e.goodsId.id,e.goodsId.name,e.goodsId.size,SUM(e.quanlity),e.date,e.goodsId.price From "
				+ SellGoodsEntity.class.getName() + " e WHERE e.date='" + date + "' GROUP BY e.goodsId.id";
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(sql);

			List<Object[]> results = (List<Object[]>) query.list();
			List<Report> reports = new ArrayList<Report>();
			for (Object[] result : results) {
				Report report = new Report();
				report.setMaHang((String) result[0]);
				report.setTenHang((String) result[1]);
				report.setSize((Long) result[2]);
				report.setSoLuong((Long) result[3]);
				report.setNgayLap((Date) result[4]);
				report.setTongThu( (Long) result[5] * report.getSoLuong());
				reports.add(report);
			}
			session.getTransaction().commit();

			return reports;
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	public int getNumberOfReport(String date) {
		// TODO Auto-generated method stub
		String sql = "Select e.goodsId.id,e.goodsId.name,e.goodsId.size,SUM(e.quanlity),e.date,e.goodsId.price From "
				+ SellGoodsEntity.class.getName() + " e WHERE e.date='" + date + "' GROUP BY e.goodsId.id";
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(sql);

			List<Object[]> results = (List<Object[]>) query.list();
			List<Report> reports = new ArrayList<Report>();
			for (Object[] result : results) {
				Report report = new Report();
				report.setMaHang((String) result[0]);
				report.setTenHang((String) result[1]);
				report.setSize((Long) result[2]);
				report.setSoLuong((Long) result[3]);
				report.setNgayLap((Date) result[4]);
				report.setTongThu( (Long) result[5] * report.getSoLuong());
				reports.add(report);
			}
			session.getTransaction().commit();

			return reports.size();
		} catch (Exception e) {
			// TODO: handle exception
			session.getTransaction().rollback();
			System.out.println(e.getMessage());
			return 0;
		} finally {
			session.close();
		}
	}

}
