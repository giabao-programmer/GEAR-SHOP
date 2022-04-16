package com.gearshop.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.ProductEntity;
import com.gearshop.repository.ProductRepository;

@Service
@Transactional
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
}
