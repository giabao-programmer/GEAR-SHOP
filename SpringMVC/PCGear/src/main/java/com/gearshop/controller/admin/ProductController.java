package com.gearshop.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.BrandEntity;
import com.gearshop.entity.CategoryEntity;
import com.gearshop.entity.ProductEntity;
import com.gearshop.service.BrandService;
import com.gearshop.service.CategoryService;
import com.gearshop.service.ProductService;

@Controller(value = "productControllerofAdmin")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = "/admin-allproduct", method = RequestMethod.GET)
	public ModelAndView getAllProducts(Map<String, Object> modelMap) {
		List<ProductEntity> products = productService.listAll();
		List<CategoryEntity> categories = categoryService.listAll();
		List<BrandEntity> brands = brandService.listAll();
		ModelAndView mav = new ModelAndView("admin/list");
		ProductEntity product = new ProductEntity();
		modelMap.put("product", product);
		mav.addObject("list", products);
		mav.addObject("categories", categories);
		mav.addObject("brands", brands);
		return mav;
	}
	
	@RequestMapping(value = "/admin-save", method = RequestMethod.POST)
	public String saveNewProduct(@ModelAttribute("product") ProductEntity product) {
		if (product.getProductQuantity() > 0) {
			product.setProductInstock(true);
		}
		product.setCheckhot(false);
		productService.newProduct(product);
		return "redirect:/admin-allproduct";
	}
	
	@RequestMapping(value = "/admin-edit", method = RequestMethod.GET)
	public ModelAndView saveNewProduct(@RequestParam("id") Integer id) {
		ModelAndView mav = new ModelAndView("admin/productedit");
		List<CategoryEntity> categories = categoryService.listAll();
		List<BrandEntity> brands = brandService.listAll();
		ProductEntity product = productService.getProduct(id);
		mav.addObject("categories", categories);
		mav.addObject("brands", brands);
		mav.addObject("product", product);
		return mav;
	}
	
	@RequestMapping("/admin-delete")
	public String deletePersonForm(@RequestParam("id") Integer id) {
		productService.deleteProduct(id);
		return "redirect:/admin-allproduct";
	}
}
