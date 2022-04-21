<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="margin-left: 45%;">Product</h1>
			<div class="" style="justify-content: space-between; display: flex;">
				<h4>List Product</h4>
				<button type="button" class="mb-4 btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"
					data-bs-whatever="@getbootstrap">New Product</button>
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
							<c:forEach items="${list}" var="item">
								<tr>
									<td>${item.id}</td>
									<td><img alt="${item.productImage }" src="templates/images/uploads/${item.productImage }"
										style="width: 30px; height: 30px"></td>
									<td>${item.productName}</td>
									<td>${item.productCategory}</td>
									<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol="" minFractionDigits="0"
											value="${item.productPrice}" type="currency" /></td>
									<td><c:choose>
											<c:when test="${item.productInstock == true}">Yes</c:when>
											<c:otherwise>Out of stock</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${item.checkhot == true}">✓</c:when>
											<c:otherwise>Χ</c:otherwise>
										</c:choose></td>
									<td style="text-align: center;">
										<a class="btn btn-info mx-2" href="<c:url value='/admin-edit?id=${item.id }'/>">Edit</a>
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


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<form:form action="admin-save" method="post" modelAttribute="product">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New Product</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Product Name</label>
						<form:input path="productName" cssClass="form-control" />
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Category</label>
						<form:select path="productCategory" cssClass="form-control">
							<form:option value="" label="-- Chọn thể loại --" />
							<c:forEach items="${categories }" var="item">
								<form:option value="${item.categoryId}" label="${item.name}" />
							</c:forEach>
						</form:select>
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Brand</label>
						<form:select path="productBrand" cssClass="form-control">
							<form:option value="0" label="-- Hãng sản xuất --" />
							<c:forEach items="${brands }" var="item">
								<form:option value="${item.brandId}" label="${item.name}" />
							</c:forEach>
						</form:select>
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Quantity</label>
						<form:input path="productQuantity" type="number" cssClass="form-control" />
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Price</label>
						<form:input path="productPrice" type="number" cssClass="form-control" />
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Properties</label>
						<form:textarea path="productProperties" cssClass="form-control" />
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Description</label>
						<form:textarea path="productDescription" cssClass="form-control" />
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Choose Image</label>
						<form:input path="productImage" type="file" cssClass="form-control" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</form:form>
		</div>
	</div>
</div>