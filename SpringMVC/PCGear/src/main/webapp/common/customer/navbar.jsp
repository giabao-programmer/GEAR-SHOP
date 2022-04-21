<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!-- Banner -->
<div class="gearshop-top-banner" style="background-image: url(templates/images/banner.png)"></div>
<!-- Navigation-->
<nav class="navbar navbar-expand-sm navbar-light bg-milk nav-border">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="<c:url value='/trang-chu'/>"><img src="templates/images/logo.png" alt=""
			style="width: 50px; height: 50px;"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="margin: 0;">
				<li class="nav-item"><a class="nav-link active fontbold" aria-current="page" href="https://www.facebook.com/noffyns">Liên hệ</a></li>
				<li class="nav-item"><a class="nav-link fontbold" href="https://www.youtube.com/">Youtube</a></li>
				<li class="nav-item" style="margin-left: 100px"><c:url value="/search" var="url"></c:url> <form:form action="${url}"
						class="form-input" method="get">
						<input class="ps-3" type="text" placeholder="Nhập để tìm kiếm..." name="name">
						<button type="submit">
							<img src="templates/images/icon/search.png" alt="search.icon">
						</button>
					</form:form></li>
			</ul>
			<form class="d-flex">
				<a class="btn btn-outline-dark" type="submit" style="border-radius: 1.5rem" href="<c:url value='/cart'/>"> Giỏ hàng <c:choose>
						<c:when test="${not empty cartcount}">
							<span class="badge bg-dark text-white ms-1 rounded-pill">${cartcount }</span>
						</c:when>
						<c:otherwise>
							<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
						</c:otherwise>
					</c:choose> 
				</a>
			</form>
		</div>
	</div>
</nav>