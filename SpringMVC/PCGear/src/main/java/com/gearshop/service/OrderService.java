package com.gearshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.OrderEntity;
import com.gearshop.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;
	
	public void save(OrderEntity order) {
		orderRepository.save(order);
	}
}
