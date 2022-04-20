package com.gearshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.OrderDetailEntity;
import com.gearshop.repository.OrderDetailRepository;

@Service
public class OrderDetailService {

	@Autowired
	OrderDetailRepository orderDetailRepository;
	
	public void save(OrderDetailEntity orderDetail) {
		orderDetailRepository.save(orderDetail);
	}
}
