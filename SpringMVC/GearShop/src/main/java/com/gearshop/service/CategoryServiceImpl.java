package com.gearshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.dao.CategoryDao;
import com.gearshop.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	public List<Category> getAllCategories() {
		return categoryDao.getAllCategories();
	}
}
