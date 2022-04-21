<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="margin-left: 45%;">Edit</h1>
			<div class="card mb-4">
				<div class="" style="justify-content: space-between; display: flex;">
					<button type="button" class="mb-4 btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
				</div>
				<div class="card-body">
					<form:form action="admin-save" method="post" modelAttribute="product">
						<div class="modal-body">
							<form:hidden path="id" />
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
								<img alt="" src="templates/images/uploads/${product.productImage }">
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">Choose Image</label>
								<form:input path="productImage" type="file" cssClass="form-control" />
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Save</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete: ${product.productName }</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Woohoo, you're deleting this product!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <a type="button" class="btn btn-primary" href="<c:url value='/admin-delete?id=${product.id }'/>">Delete</a>
      </div>
    </div>
  </div>
</div>