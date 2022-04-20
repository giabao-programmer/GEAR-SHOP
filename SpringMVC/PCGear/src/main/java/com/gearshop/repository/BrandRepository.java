package com.gearshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gearshop.entity.BrandEntity;

public interface BrandRepository extends JpaRepository<BrandEntity, Integer>{

}
