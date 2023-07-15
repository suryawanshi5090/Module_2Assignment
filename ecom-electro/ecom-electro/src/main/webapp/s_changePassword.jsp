<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Change Password</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Change Password</h3>
					<ul class="breadcrumb-tree">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">Change Password</li>
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
					<!-- Change Password Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Change Password</h3>

							<a href="myProfile.jsp"><b style="padding-left: 20%">My
									Profile</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="changePassword.jsp"><b style="color: red;">Change
									Password</b></a>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: red; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="UserController" name="ChangePassword" method="post">

							<div class="form-group">
								<input class="input" type="password" name="oldPassword"
									placeholder="Enter Old Password">
							</div>
							<div class="form-group">
								<input class="input" type="password" name="newPassword"
									placeholder="Enter New Password">
							</div>
							<div class="form-group">
								<input class="input" type="password" name="cNewPassword"
									placeholder="Confirm New Password">
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Change Password">
							</div>
						</form>
					</div>
					<!-- /Change  password Details -->
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