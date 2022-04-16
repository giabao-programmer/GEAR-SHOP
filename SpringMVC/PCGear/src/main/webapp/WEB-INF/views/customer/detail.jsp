<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0" src="templates/images/uploads/${product.productImage}" alt="${product.productImage}" />
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">${product.productName}</h1>
				<div class="fs-5 mb-5">
					<span> <fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol="" minFractionDigits="0" value="${product.productPrice}"
							type="currency" /> vnđ
					</span>
				</div>

				<c:set var="productProperties" value="${fn:split(product.productProperties, '/')}" />
				<c:forEach items="${productProperties}" var="props">
					<p style="font-weight: bold;" class="lead">${props}</p>
					<br>
				</c:forEach>

				<div class="d-flex">
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i> Add to cart
					</button>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-lg-12" style="text-align: center;">
			<h4>Description</h4>
		</div>
		<div class="col-sm-12">
			<p style="font-size: 25px;">${product.productDescription}</p>
		</div>
	</div>
</section>