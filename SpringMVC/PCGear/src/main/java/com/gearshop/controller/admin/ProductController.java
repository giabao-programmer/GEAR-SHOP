package com.gearshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.BrandEntity;
import com.gearshop.entity.CategoryEntity;
import com.gearshop.entity.ProductEntity;
import com.gearshop.service.BrandService;
import com.gearshop.service.CategoryService;
import com.gearshop.service.ProductService;

@Controller(value = "productControllerofAdmin")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = "/admin-allproduct", method = RequestMethod.GET)
	public ModelAndView getAllProducts() {
		List<ProductEntity> products = productService.listAll();
		List<CategoryEntity> categories = categoryService.listAll();
		List<BrandEntity> brands = brandService.listAll();
		ModelAndView mav = new ModelAndView("admin/list");
		mav.addObject("list", products);
		mav.addObject("categories", categories);
		mav.addObject("brands", brands);
		return mav;
	}
}
