package com.gearshop.controller.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.ProductEntity;
import com.gearshop.service.ProductService;

@Controller(value = "homeControllerofCustomer")
public class HomeController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView getHotProducts(HttpSession session) {
		if (session.getAttribute("cartcount") == null) {
			session.setAttribute("cartcount", 0);
		}
		List<ProductEntity> products = productService.getAllHotProducts();
		return new ModelAndView("customer/index", "products", products);
	}
}
