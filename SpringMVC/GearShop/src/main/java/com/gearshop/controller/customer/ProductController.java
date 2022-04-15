package com.gearshop.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.model.Product;
import com.gearshop.service.ProductService;

@Controller(value = "productControllerofCustomer")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView getProductById(@RequestParam(value = "id", required = false) int productId) {
		Product product = productService.getProductById(productId);
		return new ModelAndView("customer/detail", "product", product);
	}
	
	@RequestMapping(value = "/cate", method = RequestMethod.GET)
	public ModelAndView getProductByCate(@RequestParam(value = "id") String cate) {
		List<Product> products = productService.getProductByCate(cate);		
		return new ModelAndView("customer/productlist", "products", products);
	}
	
	@RequestMapping(value = "/search?{name}=", method = RequestMethod.GET)
	public ModelAndView getProductByName(@RequestParam(value = "name") String name) {
		System.out.print(name);
		List<Product> products = productService.getProductByName(name);		
		System.out.print(products);
		return new ModelAndView("customer/productlist", "products", products);
	}
}
