package com.gearshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.dao.ProductDao;
import com.gearshop.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}
	
	public List<Product> getHotProducts() {
		return productDao.getHotProducts();
	}

	public Product getProductById(int productId) {
		return productDao.getProductById(productId);
	}

	public List<Product> getProductByCate(String cateId) {
		return productDao.getProductByCate(cateId);
	}
	
	public List<Product> getProductByName(String name) {
		return productDao.getProductByName(name);
	}
}
