package com.gearshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.OrderEntity;
import com.gearshop.entity.ProductEntity;
import com.gearshop.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	public void save(OrderEntity order) {
		orderRepository.save(order);
	}
	
	public List<OrderEntity> listAll() {
		return (List<OrderEntity>) orderRepository.findAll();
	}
	
	public OrderEntity getOrder(String orderId) {
		OrderEntity order = orderRepository.findOne(orderId);
		return order;
	}
}
