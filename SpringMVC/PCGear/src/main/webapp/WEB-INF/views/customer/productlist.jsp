<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Body -->
<div class="container body1680px pt-4" style="display: block;">
	<div class="row" style="padding-right: 50px; padding-left: 50px;">
		<div class="col-lg-2" style="width: 11% !important;">
			<a href="#"><img src="templates/images/banner-left.png" alt=""></a>
		</div>
		<div class="col-lg-8" style="width: 78% !important;">
			<div class="row">
				<div class="col-lg-3" style="width: 22% !important;">
					<nav class="menu-nav">
						<ul class="nav-menulist">
							<li class="py-3"><a href="<c:url value='/cate?id=cpu'/>"> <span><img
										src="templates/images/icon/components.webp" alt=""></span> <span>CPU - Bộ vi xử lý</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=ram'/>"> <span><img src="templates/images/icon/ram.png"
										alt=""></span> <span>RAM - Bộ nhớ trong</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=vga'/>"> <span><img
										src="templates/images/icon/vga-card.png" alt=""></span> <span>VGA - Card màn hình</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=str'/>"> <span><img src="templates/images/icon/ssd.png"
										alt=""></span> <span>Lưu trữ SSD / HDD</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=psu'/>"> <span><img
										src="templates/images/icon/power-supply.png" alt=""></span> <span>PSU - Nguồn máy tính</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=mnb'/>"> <span><img
										src="templates/images/icon/mainboard.png" alt=""></span> <span>MAINBOARD - Bo mạch</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=mnt'/>"> <span><img
										src="templates/images/icon/monitor.png" alt=""></span> <span>MONITOR- Màn hình</span>
							</a></li>
							<li class="py-3"><a href="<c:url value='/cate?id=cse'/>"> <span><img
										src="templates/images/icon/computer-case.png" alt=""></span> <span>CASE - Vỏ máy tính</span>
							</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-9">
					<c:if test="${products.size() == 0}">
						<div style="text-align: center;" class="my-5">
							<h2>Product not found!</h2>
						</div>
					</c:if>
					<section>
						<div class="container px-4 ps-lg-5">
							<div class="row justify-content-center">

								<c:forEach items="${products}" var="prod">
									<div class="col-lg-4 mb-5">
										<div class="card h-100">
											<!-- Product image-->
											<img class="card-img-top px-3 py-3" src="templates/images/uploads/${prod.productImage}" alt="${prod.productImage}" />
											<!-- Product details-->
											<div class="card-body p-4 pb-2">
												<div class="text-center pt-3">
													<!-- Product name-->
													<h6 class="fw-bolder" style="height: 75px">${prod.productName}</h6>
													<!-- Product price-->
													<h5 class="productprice">
														<fmt:setLocale value="vi_VN" />
														<fmt:formatNumber currencySymbol="" minFractionDigits="0" value="${prod.productPrice}" type="currency" />
														vnđ
													</h5>
												</div>
											</div>
											<!-- Product actions-->
											<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
													<c:url var="updateNewURL" value="/detail">
														<c:param name="id" value="${prod.id}" />
													</c:url>
													<a class="btn btn-outline-dark mt-auto" href="${updateNewURL}">Xem sản phẩm</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

								<div>
									<c:if test="${not empty search}">
										<c:url value="/search?name=${search}" var="prev">
											<c:param name="page" value="${page-1}" />
										</c:url>
										<c:url value="/search?name=${search}" var="next">
											<c:param name="page" value="${page + 1}" />
										</c:url>
									</c:if>
									<c:if test="${not empty cateId}">
										<c:url value="/cate?id=${cateId}" var="prev">
											<c:param name="page" value="${page-1}" />
										</c:url>
										<c:url value="/cate?id=${cateId} " var="next">
											<c:param name="page" value="${page + 1}" />
										</c:url>
									</c:if>


									<nav aria-label="Page navigation example">
										<ul class="pagination" style="justify-content: center;">
											<c:if test="${page > 1}">
												<li class="page-item"><a class="page-link" href="<c:out value="${prev}" />" aria-label="Previous"> <span
														aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
												</a></li>
											</c:if>


											<c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
												<c:choose>
													<c:when test="${page == i.index}">
														<li class="page-item"><p class="page-link" style="background-color: #4d74df; color: black;">${i.index}</p></li>
													</c:when>
													<c:otherwise>
														<c:if test="${not empty search}">
															<c:url value="/search?name=${search}" var="url">
																<c:param name="page" value="${i.index}" />
															</c:url>
														</c:if>
														<c:if test="${not empty cateId}">
															<c:url value="/cate?id=${cateId}" var="url">
																<c:param name="page" value="${i.index}" />
															</c:url>
														</c:if>

														<li class="page-item"><a class="page-link" href="<c:out value="${url}" />">${i.index}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<c:if test="${page + 1 <= maxPages}">
												<li class="page-item"><a class="page-link" href="<c:out value="${next}" />" aria-label="Next"> <span
														aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
												</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
								<!-- End Pagination -->

							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<div class="col-lg-2" style="width: 11% !important;">
			<a href="#"><img class="img-right" src="templates/images/banner-right.png" alt=""></a>
		</div>
	</div>
</div>
