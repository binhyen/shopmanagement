package com.code.fashion.entity;


import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "user_db")
public class UserEntity {
	private String id;
	private GroupEntity groupId;
	private String firstName;
	private String lastName;
	private Date dateOfBirth;
	private long phone;
	private String email;
	private String address;
	private String sex;
	private String password;
	private Set<BuyGoodsEntity> list = new HashSet<BuyGoodsEntity>();

	public UserEntity() {
		super();
	}

	
	
	public UserEntity(String id, GroupEntity groupId, String firstName, String lastName, Date dateOfBirth, long phone,
			String email, String address, String sex, String password, Set<BuyGoodsEntity> list) {
		super();
		this.id = id;
		this.groupId = groupId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.sex = sex;
		this.password = password;
		this.list = list;
	}



	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
//	@Column(name = "Group_Id",length = 10)
	@ManyToOne(fetch = FetchType.LAZY)
//	@ElementCollection(targetClass = GroupEntity.class)
	@JoinColumn(name = "Group_Id")
	public GroupEntity getGroupId() {
		return groupId;
	}

	public void setGroupId(GroupEntity groupId) {
		this.groupId = groupId;
	}

	@Column(name = "First_name")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "Last_name")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "Date_Of_birth")
	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@Column(name = "Phone")
	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	@Column(name = "Email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "Address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "Sex")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "Password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@OneToMany(mappedBy = "nguoiNhap")
	
	public Set<BuyGoodsEntity> getList() {
		return list;
	}

	public void setList(Set<BuyGoodsEntity> list) {
		this.list = list;
	}



	@Override
	public String toString() {
		return "UserEntity [id=" + id + ", groupId=" + groupId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", dateOfBirth=" + dateOfBirth + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", sex=" + sex + ", password=" + password + "]";
	}
	
	

}
