<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Registration</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Registration</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li class="active">Registration</li>
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
					<!-- Registration Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Registration</h3>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: red; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="UserController" name="registration" method="post">
							<div class="form-group">
								<label><b>User Type :</b></label>&nbsp;&nbsp; <input
									type="radio" name="usertype" value="user">&nbsp;User&nbsp;&nbsp;
								<input type="radio" name="usertype" value="seller">&nbsp;Seller
							</div>
							<div class="form-group">
								<input class="input" type="text" name="fname"
									placeholder="First Name" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="lname"
									placeholder="Last Name" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email"
									placeholder="Email Address" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address"
									placeholder="Address" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="City"
									required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country"
									placeholder="Country" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="password" name="password"
									placeholder="Enter Password" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="password" name="cpassword"
									placeholder="Enter Confirm Password" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="number" name="mobile"
									placeholder="Mobile">
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Registration">
							</div>
						</form>
					</div>
					<!-- /Registration Details -->
				</div>


			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- include file footer -->
	<%@include file="footer.jsp"%>


</body>
</html>