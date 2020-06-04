package com.code.fashion.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;


import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Table(name = "GROUP_DB")
public class GroupEntity {
	private String id;
	private String groupName;
	private Set<UserEntity> userAccount = new HashSet<UserEntity>(0);

	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", length = 10, nullable = false)
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "Group_Name", length = 20)
	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupId")
	public Set<UserEntity> getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(Set<UserEntity> userAccount) {
		this.userAccount = userAccount;
	}

}
