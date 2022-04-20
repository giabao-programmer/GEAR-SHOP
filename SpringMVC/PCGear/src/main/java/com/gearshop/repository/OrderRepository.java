package com.gearshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gearshop.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, String>{

}
