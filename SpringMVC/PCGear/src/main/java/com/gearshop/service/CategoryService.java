package com.gearshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.CategoryEntity;
import com.gearshop.repository.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	CategoryRepository categoryRepository;
	
	public List<CategoryEntity> listAll() {
		return (List<CategoryEntity>) categoryRepository.findAll();
	}
}
