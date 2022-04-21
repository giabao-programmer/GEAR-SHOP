package com.gearshop.service;

import java.util.List;

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
	
	public List<OrderDetailEntity> getOrderDetail(String orderId) {
		return (List<OrderDetailEntity>) orderDetailRepository.findOrderDetail(orderId);
	}
	
}
