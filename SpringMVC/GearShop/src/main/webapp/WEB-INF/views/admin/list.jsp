<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="margin-left: 45%;">Product</h1>
			<div class="" style="justify-content: space-between; display: flex;">
				<h4>List Product</h4>
				<a class="mb-4 btn btn-warning" href="create.html" type="button">New product</a>
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
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products}" var="prod">
								<tr>
									<td>${prod.id}</td>
									<td> <img alt="${prod.productImage }" src="templates/images/uploads/${prod.productImage }" style="width: 30px; height: 30px"> </td>
									<td>${prod.productName}</td>
									<td>${prod.productCategory}</td>
									<td>${prod.productPrice }</td>
									<td>
										<c:if test="${prod.checkhot } == true">
											hot
										</c:if>
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

