package com.gearshop.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.ProductEntity;
import com.gearshop.service.ProductService;

@Controller(value = "productControllerofCustomer")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView getProductById(@RequestParam(value = "id", required = false) int productId) {
		ProductEntity product = productService.getProduct(productId);
		return new ModelAndView("customer/detail", "product", product);
	}
	
	@RequestMapping(value = "/cate", method = RequestMethod.GET)
	public ModelAndView getProductByCate(@RequestParam(value = "id") String cate) {
		List<ProductEntity> products = productService.findByProductCategory(cate);		
		return new ModelAndView("customer/productlist", "products", products);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView getProductByName(@RequestParam(value = "name") String name) {
		List<ProductEntity> products = productService.findByProductName(name);
		return new ModelAndView("customer/productlist", "products", products);
	}
}
