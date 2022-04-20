package com.gearshop.controller.customer;

import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.CartEntity;
import com.gearshop.entity.OrderDetailEntity;
import com.gearshop.entity.OrderEntity;
import com.gearshop.entity.ProductEntity;
import com.gearshop.service.OrderDetailService;
import com.gearshop.service.OrderService;
import com.gearshop.service.ProductService;
import com.gearshop.utils.Utils;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addToCart", method = RequestMethod.GET)
	public String addToCart(@RequestParam(value = "productId") Integer productId, HttpSession session) {
		Map<Integer, CartEntity> cart = (Map<Integer, CartEntity>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<>();
		}
		ProductEntity productEntity = this.productService.getProduct(productId);
		if (cart.containsKey(productId) == true) {
			CartEntity c = cart.get(productId);
			c.setCount(c.getCount() + 1);
		} else {
			CartEntity c = new CartEntity();
			c.setProductId(productEntity.getId());
			c.setName(productEntity.getProductName());
			c.setPrice(productEntity.getProductPrice());
			c.setImage(productEntity.getProductImage());
			c.setCount(1);
			cart.put(productId, c);
		}
		session.setAttribute("cart", cart);
		session.setAttribute("cartcount", cart.size());
		return "redirect:cart";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView showCart(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("customer/cart");
		Map<Integer, CartEntity> carts = (Map<Integer, CartEntity>) session.getAttribute("cart");
		if (carts != null) {
			session.setAttribute("cartcount", carts.size());
			modelAndView.addObject("cartlist", carts.values());
		} else {
			modelAndView.addObject("cartlist", null);
		}

		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/changequantity", method = RequestMethod.GET)
	public String changeQuantity(@RequestParam(value = "productId") Integer productId, @RequestParam(value = "type") String change, HttpSession session) {
		Map<Integer, CartEntity> carts = (Map<Integer, CartEntity>) session.getAttribute("cart");
		for (CartEntity c : carts.values()) {
			if (c.getProductId() == productId) {				
				if (change.equals("add")) {
					c.setCount(c.getCount() + 1);
				}else if (change.equals("subtract")) {
					c.setCount(c.getCount() - 1);
					if (c.getCount() == 0) {
						removeCart(productId, session);
					}
				}
			}
		}
		return "redirect:cart";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String removeCart(@RequestParam(value = "productId") Integer productId, HttpSession session) {
		Map<Integer, CartEntity> carts = (Map<Integer, CartEntity>) session.getAttribute("cart");
		if (carts.containsKey(productId) == true)
			carts.remove(productId);
		return "redirect:cart";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkOut(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("customer/checkout");
		Map<Integer, CartEntity> carts = (Map<Integer, CartEntity>) session.getAttribute("cart");
		if (carts != null) {
			modelAndView.addObject("cartlist", carts.values());
		} else {
			modelAndView.addObject("cartlist", null);
		}

		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/confirm", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
	public String confirmOrder(@RequestParam(value = "cus_name") String cus_name,
			@RequestParam(value = "cus_phone") String cus_phone, @RequestParam(value = "cus_email") String cus_email,
			@RequestParam(value = "province") String province, @RequestParam(value = "district") String district,
			@RequestParam(value = "ward") String ward, @RequestParam(value = "address") String address,
			HttpSession session) {
		Map<Integer, CartEntity> carts = (Map<Integer, CartEntity>) session.getAttribute("cart");
		final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		SecureRandom rnd = new SecureRandom();
		StringBuilder sb = new StringBuilder(10);
		for (int i = 0; i < 10; i++)
			sb.append(AB.charAt(rnd.nextInt(AB.length())));

		try {
			OrderEntity newOrder = new OrderEntity();
			Date date = new Date();
			newOrder.setOrderId(sb.toString());
			newOrder.setCustomerName(cus_name);
			newOrder.setCustomerPhone(cus_phone);
			newOrder.setCustomerEmail(cus_email);
			newOrder.setOrderDate(date);
			newOrder.setAddress(address);
			newOrder.setProvince(province);
			newOrder.setDistrict(district);
			newOrder.setWard(ward);
			newOrder.setTotalprice(Utils.cartTotal(carts));
			this.orderService.save(newOrder);
			for (CartEntity c : carts.values()) {
				OrderDetailEntity orderDetail = new OrderDetailEntity();
				orderDetail.setOrderId(sb.toString());
				orderDetail.setProductId(c.getProductId());
				orderDetail.setUnitprice(c.getPrice());
				orderDetail.setQuantity(c.getCount());
				this.orderDetailService.save(orderDetail);
			}
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/trang-chu";
	}
}
