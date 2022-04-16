package com.gearshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gearshop.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Integer>{
    @Query("SELECT t FROM ProductEntity t WHERE t.checkhot = true order by t.productPrice")
	List<ProductEntity> getAllHotProducts();
    
    List<ProductEntity> findByProductCategoryOrderByProductPriceAsc(String cateId);
    
    @Query("SELECT t FROM ProductEntity t WHERE t.productName LIKE %?1% order by t.productPrice")
    List<ProductEntity> findByProductNameOrderByProductPriceAsc(String name);
}
