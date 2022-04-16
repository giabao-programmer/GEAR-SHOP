<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="margin-left: 45%;">Product</h1>
			<div class="" style="justify-content: space-between; display: flex;">
				<h4>List Product</h4>
				<a class="mb-4 btn btn-success" href="create.html" type="button">New product</a>
			</div>
			<div class="card mb-4">

				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>ID</th>
								<th>Image</th>
								<th>Product Name</th>
								<th>Category</th>
								<th>Price</th>
								<th>In stock</th>
								<th>Hot</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products}" var="prod">
								<tr>
									<td>${prod.id}</td>
									<td><img alt="${prod.productImage }" src="templates/images/uploads/${prod.productImage }" style="width: 30px; height: 30px"></td>
									<td>${prod.productName}</td>
									<td>${prod.productCategory}</td>
									<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol="" minFractionDigits="0" value="${prod.productPrice}"
											type="currency" /></td>
									<td><c:choose>
											<c:when test="${prod.productInstock == true}">Yes</c:when>
											<c:otherwise>Out of stock</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${prod.checkhot == true}">✓</c:when>
											<c:otherwise>Χ</c:otherwise>
										</c:choose></td>
									<td style="text-align: center;">
										<button class="btn btn-info mx-2">Edit</button>
										<button class="btn btn-danger mx-2">Delete</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
</div>