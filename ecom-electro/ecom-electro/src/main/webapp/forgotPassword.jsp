<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Forgot Password</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Forgot Password</h3>
					<ul class="breadcrumb-tree">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">Forgot Password</li>
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
					<!-- forgot password Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Forgot Password</h3>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: red; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="UserController" name="forgotpassword" method="post">


							<div class="form-group">
								<input class="input" type="email" name="email"
									placeholder="Email Address" required="required">
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Send OTP">
							</div>
						</form>
					</div>
					<!-- /forgot password Details -->
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