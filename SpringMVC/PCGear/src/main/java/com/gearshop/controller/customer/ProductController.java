package com.gearshop.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gearshop.entity.ProductEntity;
import com.gearshop.service.ProductService;

@Controller(value = "productControllerofCustomer")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView getProductById(@RequestParam(value = "id", required = false) int productId) {
		ProductEntity product = productService.getProduct(productId);
		return new ModelAndView("customer/detail", "product", product);
	}
	
	@RequestMapping(value = "/cate", method = RequestMethod.GET)
    public ModelAndView getProductByCate(@RequestParam(value = "id") String cate,
            @RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("customer/productlist");
        List<ProductEntity> products = productService.findByProductCategory(cate);
        PagedListHolder<ProductEntity> pagedListHolder = new PagedListHolder<>(products);
        pagedListHolder.setPageSize(6);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        modelAndView.addObject("cateId", cate);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("products", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("products", pagedListHolder.getPageList());
        }

        return modelAndView;
    }
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView getProductByName(@RequestParam(value = "name") String name, @RequestParam(required = false) Integer page) {
		ModelAndView modelAndView = new ModelAndView("customer/productlist");
        List<ProductEntity> products = productService.findByProductName(name);
        PagedListHolder<ProductEntity> pagedListHolder = new PagedListHolder<>(products);
        pagedListHolder.setPageSize(6);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        modelAndView.addObject("search", name);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;

        modelAndView.addObject("page", page);
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("products", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("products", pagedListHolder.getPageList());
        }

        return modelAndView;
	}
}
