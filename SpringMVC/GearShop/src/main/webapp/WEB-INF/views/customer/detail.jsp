<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="templates/images/uploads/${product.productImage}"
					alt="${product.productImage}" />
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">${product.productName}</h1>
				<div class="fs-5 mb-5">
					<span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber
							currencySymbol="" minFractionDigits="0"
							value="${product.productPrice}" type="currency" /> vnđ</span>
				</div>
				<p class="lead">${product.productProperties}</p>
				<div class="d-flex">
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i> Add to cart
					</button>
				</div>
			</div>
		</div>
	</div>
</section>