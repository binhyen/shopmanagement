package com.code.fashion.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Goods")
public class GoodsEntity {
	private String id;
	private String name;
	private String quantity;
	private String size;
	private String price;
	private Set<BuyGoodsEntity> listBuy = new HashSet<BuyGoodsEntity>(0);
	private Set<SellGoodsEntity> listSell = new HashSet<SellGoodsEntity>(0);

	public GoodsEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsEntity(String id, String name, String quantity, String size, String price) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.size = size;
		this.price = price;
	}

	public GoodsEntity(String id, String name, String quantity, String size, String price, Set<BuyGoodsEntity> listBuy,
			Set<SellGoodsEntity> listSell) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.size = size;
		this.price = price;
		this.listBuy = listBuy;
		this.listSell = listSell;
	}

	@Id
	@Column(name = "Id")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "Name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Quantity")
	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	@Column(name = "Size")
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Column(name = "Price")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@OneToMany(mappedBy = "goodsId")
	public Set<BuyGoodsEntity> getListBuy() {
		return listBuy;
	}

	public void setListBuy(Set<BuyGoodsEntity> listBuy) {
		this.listBuy = listBuy;
	}

	@OneToMany(mappedBy = "goodsId")
	public Set<SellGoodsEntity> getListSell() {
		return listSell;
	}

	public void setListSell(Set<SellGoodsEntity> listSell) {
		this.listSell = listSell;
	}

}
