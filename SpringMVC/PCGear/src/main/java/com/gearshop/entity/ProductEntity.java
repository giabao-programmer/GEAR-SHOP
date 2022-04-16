package com.gearshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "name")
	private String productName;
	
	@Column(name = "category")
	private String productCategory;
	
	@Column(name = "brand")
	private int productBrand;
	
	@Column(name = "quantity")
	private int productQuantity;
	
	@Column(name = "price")
	private Long productPrice;
	
	@Column(name = "instock")
	private Boolean productInstock;
	
	@Column(name = "description")
	private String productDescription;
	
	@Column(name = "properties")
	private String productProperties;
	
	@Column(name = "image")
	private String productImage;
	
	@Column(name = "hot")
	private Boolean checkhot;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(int productBrand) {
		this.productBrand = productBrand;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Long getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}

	public Boolean getProductInstock() {
		return productInstock;
	}

	public void setProductInstock(Boolean productInstock) {
		this.productInstock = productInstock;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductProperties() {
		return productProperties;
	}

	public void setProductProperties(String productProperties) {
		this.productProperties = productProperties;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public Boolean getCheckhot() {
		return checkhot;
	}

	public void setCheckhot(Boolean checkhot) {
		this.checkhot = checkhot;
	}
	
}
