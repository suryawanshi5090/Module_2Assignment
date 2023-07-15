<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Verify OTP</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Verify OTP</h3>
					<ul class="breadcrumb-tree">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">Verify OTP</li>
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
					<!-- Verify OTP  Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Verify OTP</h3>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: red; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="UserController" name="VerifyOTP" method="post">

							<input type="hidden" name="email"
								value="<%=request.getAttribute("email")%>"> <input
								type="hidden" name="otp"
								value="<%= request.getAttribute("otp")%>">
							<div class="form-group">
								<input class="input" type="text" name="uotp"
									placeholder="Enter 4 Digit OTP" required="required">
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Verify OTP">
							</div>
						</form>
					</div>
					<!-- /Verify OTP  Details -->
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