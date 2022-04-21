<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="margin-left: 45%;">Order</h1>
			<div class="" style="justify-content: space-between; display: flex;">
				<h4>List Orders</h4>
			</div>
			<div class="card mb-4">

				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>ID</th>
								<th>Customer name</th>
								<th>Phone number</th>
								<th>Order date</th>
								<th>Total</th>
								<th>Address</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orders}" var="item">
								<tr>
									<td>${item.orderId}</td>
									<td>${item.customerName}</td>
									<td>${item.customerPhone}</td>
									<td>${item.orderDate}</td>
									<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol="" minFractionDigits="0"
											value="${item.totalprice}" type="currency" /></td>
									<td>${item.address}, ${item.ward }, ${item.district },${item.province }</td>
									<td style="text-align: center;">
										<a class="btn btn-info mx-2" href="<c:url value='/admin-orderdetail?orderId=${item.orderId }'/>">See detail</a>
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