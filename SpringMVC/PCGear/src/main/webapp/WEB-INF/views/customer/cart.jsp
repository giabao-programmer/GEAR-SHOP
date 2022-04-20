<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container mt-3" style="min-height: 720px">
	<div style="text-align: center">
		<h1>Your Cart</h1>
	</div>
	<hr />
	<div class="row py-3">
		<div style="border: 3px solid red; border-radius: 10px;">
			<table style="width: 100%">
				<thead>
					<tr>
						<th>Image</th>
						<th>Product</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Remove</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="total" value="0"></c:set>
					<c:forEach items="${cartlist}" var="cartItem">
						<tr class="my-5">
							<td><img class="cartimg" src="templates/images/uploads/${cartItem.image }" alt="${cartItem.image }"/></td>
							<td>${cartItem.name}</td>
							<td>
								<div class="cart-info quantity">
									<a type="button" class="btn-increment-decrement" href="<c:url value='/changequantity?productId=${cartItem.productId }&type=subtract'/>">-</a>
									<input type="text" class="cart-quantity" value="${cartItem.count }" disabled> 
									<a type="button" class="btn-increment-decrement" href="<c:url value='/changequantity?productId=${cartItem.productId }&type=add'/>">+</a>
								</div>
							</td>
							<td>
								<fmt:setLocale value="vi_VN" /> 
								<fmt:formatNumber currencySymbol="" minFractionDigits="0" value="${cartItem.price }" type="currency" />
							</td>
							<td><a href="<c:url value='/remove?productId=${cartItem.productId }'/>"><i class="fa fa-trash" style="color: black"></i></a></td>
						</tr>
						<c:set var="total" value="${total + cartItem.price * cartItem.count}"></c:set>
					</c:forEach>
					<tr>
						<td colspan="3" style="font-weight: 900">Total:</td>
						<td style="font-weight: 900">
							<fmt:setLocale value="vi_VN" /> 
							<fmt:formatNumber currencySymbol="" minFractionDigits="0" value="${total }" type="currency" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="py-5 center">
			<a href="<c:url value='/checkout'/>" type="button" class="btn btn-danger">Checkout</a>
		</div>
	</div>
</div>

<c:url var="editquantity" value="/changequantity"/>
<script>
function changeQuantity(id, type) {
    $.ajax({
        url: '{editquantity}',
        data: { productId: id, change: type },
        type: 'POST',
        success: function (data) {
            location.reload();
        }
    });
}
</script>