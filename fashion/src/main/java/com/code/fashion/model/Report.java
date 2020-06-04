package com.code.fashion.model;

import java.sql.Date;

public class Report {
	String maHang;
	String tenHang;
	long size;
	long soLuong;
	long tongThu;
	Date ngayLap;

	public String getMaHang() {
		return maHang;
	}

	public void setMaHang(String maHang) {
		this.maHang = maHang;
	}

	public String getTenHang() {
		return tenHang;
	}

	public void setTenHang(String tenHang) {
		this.tenHang = tenHang;
	}

	public long getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(long soLuong) {
		this.soLuong = soLuong;
	}

	public long getTongThu() {
		return tongThu;
	}

	public void setTongThu(long tongThu) {
		this.tongThu = tongThu;
	}

	public Date getNgayLap() {
		return ngayLap;
	}

	public void setNgayLap(Date ngayLap) {
		this.ngayLap = ngayLap;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public Report() {
		super();
	}

	public Report(String maHang, String tenHang, long size, long soLuong, long tongThu, Date ngayLap) {
		super();
		this.maHang = maHang;
		this.tenHang = tenHang;
		this.size = size;
		this.soLuong = soLuong;
		this.tongThu = tongThu;
		this.ngayLap = ngayLap;
	}

}
