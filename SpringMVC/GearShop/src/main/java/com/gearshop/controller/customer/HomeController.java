package com.gearshop.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerofCustomer")
public class HomeController {
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("customer/index");
		return mav;
	}
	@RequestMapping(value = "/trang-chu-1", method = RequestMethod.GET)
	public ModelAndView homePage1() {
		ModelAndView mav = new ModelAndView("customer/index");
		return mav;
	}
}
