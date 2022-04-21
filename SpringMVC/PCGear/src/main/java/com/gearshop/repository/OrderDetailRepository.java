package com.gearshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gearshop.entity.OrderDetailEntity;

public interface OrderDetailRepository extends JpaRepository<OrderDetailEntity, Integer>{

    @Query("SELECT t FROM OrderDetailEntity t WHERE t.orderId LIKE ?1")
    List<OrderDetailEntity> findOrderDetail(String orderId);
}
