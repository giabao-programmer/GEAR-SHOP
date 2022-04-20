package com.gearshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orderdetails")
public class OrderDetailEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int stt;
	
	@Column(name = "orderId")
	private String orderId;
	
	@Column(name = "productId")
	private int productId;
	
	@Column(name = "unitprice")
	private Long unitprice;
	
	@Column(name = "quantity")
	private int quantity;

	public int getStt() {
		return stt;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Long getUnitprice() {
		return unitprice;
	}

	public void setUnitprice(Long unitprice) {
		this.unitprice = unitprice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
