<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4" style="margin-left: 45%;">Order Detail</h1>
			<div class="card mb-4">

				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Product Id</th>
								<th>Unit Price</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderd}" var="item">
								<tr>
									<td>${item.productId}</td>									
									<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol="" minFractionDigits="0"
											value="${item.unitprice}" type="currency" /></td>
									<td>${item.quantity}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
</div>