<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container body1680px pt-4" style="display: block">
	<div style="text-align: center">
		<h1>Your Info</h1>
	</div>
	<div class="form-horizontal">
		<div class="py-4">
			<div class="container px-4 px-lg-5 my-4">
				<div class="row gx-4 gx-lg-5 align-item-center px-lg-5">
					<c:url value="/confirm" var="url"></c:url>
					<form action="${url }" style="text-align: center" method="POST">
						<div class="form-group mb-3 checkout">
							<label for="name">Họ tên</label> <input name="cus_name" type="text" class="form-control"
								placeholder="Nhập tên của bạn..." required />
						</div>
						<div class="form-group mb-3 checkout">
							<label for="phone">Số điện thoại</label> <input name="cus_phone" type="text" class="form-control"
								placeholder="Nhập số điện thoại..." required />
						</div>
						<div class="form-group mb-3 checkout">
							<label for="email">Email</label> <input name="cus_email" type="text" class="form-control" placeholder="Địa chỉ email..."
								required />
						</div>
						<div class="form-group mb-3 checkout">
							<select class="form-control" id="province" name="province" onclick="changeFunc();" required>
								<option value="" selected>----</option>
							</select>
						</div>
						<div class="form-group mb-3 checkout">
							<select class="form-control" id="district" name="district" onchange="changeFuncDistrict();" required>
								<option value="" selected>Quận huyện</option>
							</select>
						</div>
						<div class="form-group mb-3 checkout">
							<select class="form-control" id="ward" name="ward" aria-placeholder="Quận huyện" onchange="changeFuncWard();" required>
								<option value="" selected>Phường xã</option>
							</select>
						</div>
						<div class="form-group mb-3">
							<label for="address">Địa chỉ cụ thể</label> <input name="address" type="text" class="form-control"
								style="width: 89%; border-radius: 20px; margin: 0 auto;"
								placeholder="Số nhà, tên đường..." required />
						</div>
						<div class="form-group mb-3 mt-5">
							<div style="border: 3px solid red; border-radius: 10px; width: 90%; margin: auto;">
								<table style="width: 100%">
									<tbody>
										<c:set var="total" value="0"></c:set>
										<c:forEach items="${cartlist}" var="cartItem">
											<tr class="my-5">
												<td><img class="cartimg" src="templates/images/uploads/${cartItem.image }" alt="${cartItem.image }" /></td>
												<td>${cartItem.name}</td>
												<td>x${cartItem.count}</td>
												<td><fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol="" minFractionDigits="0"
														value="${cartItem.price }" type="currency" /></td>
											</tr>
											<c:set var="total" value="${total + cartItem.price * cartItem.count}"></c:set>
										</c:forEach>
										<tr>
											<td colspan="3" style="font-weight: 900">Tổng cộng:</td>
											<td style="font-weight: 900"><fmt:setLocale value="vi_VN" /> <fmt:formatNumber currencySymbol=""
													minFractionDigits="0" value="${total }" type="currency" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="py-5 center">
							<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Xác nhận thanh toán</button>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Đặt hàng thành công!</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h5>Bạn đã đặt hàng thành công, chúng tôi sẽ giao hàng đến cho bạn trong thời gian sớm nhất.</h5>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success" data-bs-dismiss="modal">OK</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

