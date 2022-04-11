<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row" style="padding-right: 50px; padding-left: 50px;">
		<div class="col-lg-2" style="width: 11% !important;">
			<a href="#"><img src="templates/images/banner-left.png" alt=""></a>
		</div>
		<div class="col-lg-8" style="width: 78% !important;">
			<div class="row">
				<!-- Menu-->
				<div class="col-lg-3" style="width: 22% !important;">
					<nav class="menu-nav">
						<ul class="nav-menulist">
							<li><a href='<c:url value="/getProductByCate/${GMK }" />'> <span><img src="templates/images/icon/keyboard.webp" alt=""></span> <span>Gaming Keyboard</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/monitor.webp" alt=""></span> <span>Monitor</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/headphones.webp" alt=""></span> <span>Headphone</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/mouse_pad.webp" alt=""></span> <span>Gaming Mouse</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/chair.webp" alt=""></span> <span>Gaming Chair</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/components.webp" alt=""></span> <span>Components</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/laptop.webp" alt=""></span> <span>Laptop Gaming</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/networkdevice.webp" alt=""></span> <span>Network Device</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/pcbuilt.webp" alt=""></span> <span>Ready-built PC</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/console.webp" alt=""></span> <span>Console</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/usb.jpg" alt=""></span> <span>USB + Memory Card</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/micro.webp" alt=""></span> <span>Speaker + Microphone</span>
							</a></li>
							<li><a href="#"> <span><img src="templates/images/icon/other.webp" alt=""></span> <span>Other</span>
							</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-7">
					<div class="tophome">
						<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="templates/images/carousel/slideshow_1.webp" class="d-block w-100" alt="Manhinhchinhhang">
								</div>
								<div class="carousel-item">
									<img src="templates/images/carousel/slideshow_2.webp" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="templates/images/carousel/slideshow_3.webp" class="d-block w-100" alt="...">
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
					<div class="bottomhome">
						<img src="templates/images/bottom_carousel/bot_1.webp" alt=""> <img src="templates/images/bottom_carousel/bot_2.webp" alt="">
					</div>
				</div>
				<div class="col-lg-2 rightmenubanner" style="width: 19.66666667% !important;">
					<a href="#"><img src="templates/images/right_carousel/right_1.webp" alt=""></a> <a href="#"><img src="templates/images/right_carousel/right_2.webp" alt=""></a> <a href="#"><img src="templates/images/right_carousel/right_3.webp" alt=""></a>
				</div>
			</div>
		</div>
		<div class="col-lg-2" style="width: 11% !important;">
			<a href="#"><img class="img-right" src="templates/images/banner-right.png" alt=""></a>
		</div>
	</div>
	<!----------------------------------- Start product home ----------------------------------->

	<section class="py-2 mt-4" style="background-color: aliceblue;">
		<div class="container px-4 ps-lg-5 mt-3">
			<h2 class="homeproduct-title">Best Sale Products</h2>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-4 pb-2">
							<div class="text-center pt-3">
								<!-- Product name-->
								<h6 class="fw-bolder">Fancy Product</h6>
								<!-- Product price-->
								<h5 class="productprice">27.990.000đ</h5>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">View product</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!----------------------------------- End product home ----------------------------------->
</body>
</html>