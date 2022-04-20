package com.gearshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gearshop.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, String>{

}
