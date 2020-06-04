package com.code.fashion.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SELL_GOODS")
public class SellGoodsEntity {
	private String id;
	private CustomerEntity customerId;
	private GoodsEntity goodsId;
	private int soLuong;
	private Date ngayLap;

	public SellGoodsEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SellGoodsEntity(String id, CustomerEntity customerId, GoodsEntity goodsId, int soLuong, Date ngayLap) {
		super();
		this.id = id;
		this.customerId = customerId;
		this.goodsId = goodsId;
		this.soLuong = soLuong;
		this.ngayLap = ngayLap;
	}

	@Id
	@Column(name = "MaHD")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MaKH")
	public CustomerEntity getCustomerId() {
		return customerId;
	}

	public void setCustomerId(CustomerEntity customerId) {
		this.customerId = customerId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MaHang")
	public GoodsEntity getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(GoodsEntity goodsId) {
		this.goodsId = goodsId;
	}

	@Column(name = "SoLuong")
	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	@Column(name = "NgayLap")
	public Date getNgayLap() {
		return ngayLap;
	}

	public void setNgayLap(Date ngayLap) {
		this.ngayLap = ngayLap;
	}

}
