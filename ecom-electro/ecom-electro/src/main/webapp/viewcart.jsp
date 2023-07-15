<%@page import="com.Dao.cartDao"%>
<%@page import="com.bean.MyCartBean"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.Dao.WishListDao"%>
<%@page import="com.bean.WishListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--  Include File -->
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Cart</title>
</head>
<body>

	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li><a href="index.jsp" style="color: red"><b>Home</b></a></li>
					<li><a href="filter.jsp?category=laptop">Laptops</a></li>
					<li><a href="filter.jsp?category=smartphone">Smartphones</a></li>
					<li><a href="filter.jsp?category=camera">Cameras</a></li>
					<li><a href="filter.jsp?category=accessories">Accessories</a></li>
				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">My Cart</h3>
					<ul class="breadcrumb-tree">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">Checkout</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-7">
					<!-- Billing Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Product List</h3>
						</div>
						<!--  product table -->
						<table class="table table-hover">
							<!-- <thead>
								<tr>
									<th scope="col">Product</th>
									<th scope="col">Name & Brand</th>
									<th scope="col">incriment</th>
									<th scope="col">Total</th>
									<th scope="col">Remove</th>
								</tr>
							</thead> -->
							<tbody>
								<%
								int G_total=0;
								List<MyCartBean> list = cartDao.userCart(u.getUid());
								for (MyCartBean c : list) {
									ProductBean p = ProductDao.getProductById(c.getPid());
									G_total +=c.getTprice();
								%>
								<tr>
									<th scope="row"><a href="product.jsp?pid=<%=p.getPid()%>"><img
											alt="image" src="Product_Images/<%=p.getImage()%>"
											style="width: 60px"></a></th>
									<td><a href="product.jsp?pid=<%=p.getPid()%>"><b><span
												style="color: red"><%=p.getCategory()%></span><br><%=p.getPname()%></b>
									</a></td>

									<td style="text-align: center;">
										<form action="cartController" name="cartqut" method="post">
											<input type="hidden" name="cid" value="<%=c.getCid() %>">
											<h5>
												<input type="number" value="<%=c.getQnt()%>" min="1"
													max="10" style="padding: 5px" name="qnt"
													onchange="this.form.submit();">
											</h5>
										</form>
									</td>
									<td style="text-align: center;"><b><%=c.getTprice()%>/-</b></td>
									<td style="text-align: center;"><a
										href="removeToCart.jsp?cid=<%=c.getCid()%>&uid=<%=u.getUid()%>"><i
											class="fa fa-remove" style="font-size: 20px"></i></a></td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
						<!-- /Product Table -->

					</div>
				</div>

				<!-- Order Details -->
				<div class="col-md-5 order-details">
					<div class="section-title text-center">
						<h3 class="title">Your Order</h3>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div>
								<strong>PRODUCT</strong>
							</div>
							<div>
								<strong>TOTAL</strong>
							</div>
						</div>
						<div class="order-products">
							<%
						for(MyCartBean c:list){
							ProductBean p=ProductDao.getProductById(c.getPid());
							%>
							<div class="order-col">
								<div><%=c.getQnt()%>x
									<%=p.getPname() %></div>
								<div>
									<a>Rs.</a><%=c.getTprice() %>.00
								</div>
							</div>
							<%
						}
						%>
						</div>
						<div class="order-col">
							<div>Shiping</div>
							<div>
								<strong>FREE</strong>
							</div>
						</div>
						<div class="order-col">
							<div>
								<strong>TOTAL</strong>
							</div>
							<div>
								<strong class="order-total">Rs.<%=G_total %>.00/-
								</strong>
							</div>
						</div>
					</div>
					<div class="payment-method">
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-1"> <label
								for="payment-1"> <span></span> Direct Bank Transfer
							</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-2"> <label
								for="payment-2"> <span></span> Cheque Payment
							</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-3"> <label
								for="payment-3"> <span></span> Paypal System
							</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms"> <label for="terms">
							<span></span> I've read and accept the <a href="#">terms &
								conditions</a>
						</label>
					</div>
					<a href="#" class="primary-btn order-submit">Place order</a>
				</div>
				<!-- /Order Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- Footer File include -->
	<%@include file="footer.jsp"%>
</body>
</html>