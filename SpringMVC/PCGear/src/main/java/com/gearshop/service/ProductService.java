package com.gearshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.ProductEntity;
import com.gearshop.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;

	public List<ProductEntity> listAll() {
		return (List<ProductEntity>) productRepository.findAll();
	}
	
	public List<ProductEntity> getAllHotProducts() {
		return (List<ProductEntity>) productRepository.getAllHotProducts();
	}
	
	public ProductEntity getProduct(int id) {
		ProductEntity product = productRepository.findOne(id);
		return product;
	}
	
	public List<ProductEntity> findByProductCategory(String cateId) {
		return (List<ProductEntity>) productRepository.findByProductCategoryOrderByProductPriceAsc(cateId);
	}
	
	public List<ProductEntity> findByProductName(String name) {
		return (List<ProductEntity>) productRepository.findByProductNameOrderByProductPriceAsc(name);
	}
	
	public void newProduct(ProductEntity product) {
		productRepository.save(product);
	}
	
	public void deleteProduct(Integer id) {
		productRepository.delete(id);
	}
}
