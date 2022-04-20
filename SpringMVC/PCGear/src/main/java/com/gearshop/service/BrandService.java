package com.gearshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gearshop.entity.BrandEntity;
import com.gearshop.repository.BrandRepository;

@Service
public class BrandService {

	@Autowired
	BrandRepository brandRepository;
	
	public List<BrandEntity> listAll() {
		return (List<BrandEntity>) brandRepository.findAll();
	}
}
