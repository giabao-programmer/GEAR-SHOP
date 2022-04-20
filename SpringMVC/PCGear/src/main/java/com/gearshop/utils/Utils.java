package com.gearshop.utils;

import java.util.Map;

import com.gearshop.entity.CartEntity;

public class Utils {
	public static Long cartTotal(Map<Integer, CartEntity> cart) {
		Long total = 0l;
		if (cart != null) {
			for (CartEntity c : cart.values())
				total += c.getCount() * c.getPrice();
		}
		return total;
	}
}
