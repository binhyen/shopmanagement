package com.code.fashion.entity;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER_DB")
public class CustomerEntity {
	private String id;
	private String name;
	private Date dateOfBirth;
	private String address;
	private String sex;
	private String phone;
	private String email;
	private int point;
	private String rank;
	private Set<SellGoodsEntity> listSell = new HashSet<SellGoodsEntity>(0);

	public CustomerEntity() {
		super();
	}

	public CustomerEntity(String id, String name, Date dateOfBirth, String address, String sex, String phone,
			String email, int point, String rank) {
		super();
		this.id = id;
		this.name = name;
		this.dateOfBirth = dateOfBirth;
		this.address = address;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.point = point;
		this.rank = rank;
	}

	public CustomerEntity(String id, String name, Date dateOfBirth, String address, String sex, String phone,
			String email, int point, String rank, Set<SellGoodsEntity> listSell) {
		super();
		this.id = id;
		this.name = name;
		this.dateOfBirth = dateOfBirth;
		this.address = address;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.point = point;
		this.rank = rank;
		this.listSell = listSell;
	}

	@Id
	@Column(name = "MaKH")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "HoTen")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "NgaySinh")
	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@Column(name = "DiaChi")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "GioiTinh")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "SDT")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "Email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Diem")
	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Column(name = "CapBac")
	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	@OneToMany(mappedBy = "customerId")
	public Set<SellGoodsEntity> getListSell() {
		return listSell;
	}

	public void setListSell(Set<SellGoodsEntity> listSell) {
		this.listSell = listSell;
	}

	@Override
	public String toString() {
		return "CustomerEntity [id=" + id + ", name=" + name + ", dateOfBirth=" + dateOfBirth + ", address=" + address
				+ ", sex=" + sex + ", phone=" + phone + ", email=" + email + ", point=" + point + ", rank="
				+ rank + "]";
	}
	
	
}
