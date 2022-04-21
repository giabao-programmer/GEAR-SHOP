package com.gearshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.OrderDetailEntity;
import com.gearshop.entity.OrderEntity;
import com.gearshop.service.OrderDetailService;
import com.gearshop.service.OrderService;

@Controller(value = "orderControllerofAdmin")
public class OrderController {
	
	@Autowired
	private OrderDetailService orderDetailService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/admin-allorder", method = RequestMethod.GET)
	public ModelAndView getAllOrders() {
		List<OrderEntity> orders = orderService.listAll();
		ModelAndView mav = new ModelAndView("admin/listOrders");
		mav.addObject("orders", orders);
		return mav;
	}
	
	@RequestMapping(value = "/admin-orderdetail", method = RequestMethod.GET)
	public ModelAndView orderDetail(@RequestParam("orderId") String orderId) {
		List<OrderDetailEntity> orderd = orderDetailService.getOrderDetail(orderId);
		ModelAndView mav = new ModelAndView("admin/orderDetail");
		mav.addObject("orderd", orderd);
		return mav;
	}
}
