package com.gearshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.ProductEntity;
import com.gearshop.service.ProductService;

@Controller(value = "productControllerofAdmin")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/admin-allproduct", method = RequestMethod.GET)
	public ModelAndView getAllProducts() {
		List<ProductEntity> products = productService.listAll();
		return new ModelAndView("admin/list", "products", products);
	}
}
