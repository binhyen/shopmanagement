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
@Table(name = "BUY_GOODS")
public class BuyGoodsEntity {
	private String maPhieuNhap;
	private GoodsEntity goodsId;
	private UserEntity nguoiNhap;
	private String soLuong;
	private long donGia;
	private Date ngayNhap;

	public BuyGoodsEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BuyGoodsEntity(String maPhieuNhap, GoodsEntity goodsId, UserEntity nguoiNhap, String soLuong, long donGia,
			Date ngayNhap) {
		super();
		this.maPhieuNhap = maPhieuNhap;
		this.goodsId = goodsId;
		this.nguoiNhap = nguoiNhap;
		this.soLuong = soLuong;
		this.donGia = donGia;
		this.ngayNhap = ngayNhap;
	}

	@Id
	@Column(name = "MaPhieuNhap")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getMaPhieuNhap() {
		return maPhieuNhap;
	}

	public void setMaPhieuNhap(String maPhieuNhap) {
		this.maPhieuNhap = maPhieuNhap;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MaHang")
	public GoodsEntity getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(GoodsEntity goodsId) {
		this.goodsId = goodsId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NguoiNhap")
	public UserEntity getNguoiNhap() {
		return nguoiNhap;
	}

	public void setNguoiNhap(UserEntity nguoiNhap) {
		this.nguoiNhap = nguoiNhap;
	}

	@Column(name = "SoLuong")
	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	@Column(name = "DonGia")
	public long getDonGia() {
		return donGia;
	}

	public void setDonGia(long donGia) {
		this.donGia = donGia;
	}

	@Column(name = "NgayNhap")
	public Date getNgayNhap() {
		return ngayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}

}
