<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Seller MyProfile</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">MyProfile</h3>
					<ul class="breadcrumb-tree">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">MyProfile</li>
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
							<h3 class="title">MyProfile</h3>

							<a href="s_myProfile.jsp"><b
								style="color: red; padding-left: 40%">My Profile</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="s_changePassword.jsp"><b>Change Password</b></a>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: green; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="UserController" name="myProfile" method="post">
							<div class="form-group">
								<label><b>User Type :</b></label>&nbsp;&nbsp;
								<%
							if(u.getUsertype().equals("user")){
								%>
								<input type="radio" name="usertype" value="user"
									checked="checked">&nbsp;User&nbsp;&nbsp; <input
									type="radio" name="usertype" value="seller">&nbsp;Seller
								<%
							}else if(u.getUsertype().equals("seller")){
							%>
								<input type="radio" name="usertype" value="user">&nbsp;User&nbsp;&nbsp;
								<input type="radio" name="usertype" value="seller"
									checked="checked">&nbsp;Seller
								<%	
							}else{
								%>
								<input type="radio" name="usertype" value="user">&nbsp;User&nbsp;&nbsp;
								<input type="radio" name="usertype" value="seller">&nbsp;Seller
								<%
							}
							%>

							</div>
							<div class="form-group">
								<input class="input" type="text" name="fname"
									placeholder="First Name" required="required"
									value="<%=u.getFname()%>">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="lname"
									placeholder="Last Name" required="required"
									value="<%=u.getLname()%>">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email"
									placeholder="Email Address" required="required"
									value="<%=u.getEmail() %>" readonly="readonly">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address"
									placeholder="Address" required="required"
									value="<%=u.getAddress()%>">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="City"
									required="required" value="<%=u.getCity()%>">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country"
									placeholder="Country" required="required"
									value="<%=u.getCountry()%>">
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Update Profile">
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