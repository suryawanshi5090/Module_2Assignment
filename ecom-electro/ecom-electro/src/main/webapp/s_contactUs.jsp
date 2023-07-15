<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Seller ContactUs</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">ContactUs</h3>
					<ul class="breadcrumb-tree">
						<li><a href="s_index.jsp">Home</a></li>
						<li class="active">ContactUs</li>
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
					<!-- ContactUs Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">ContactUs</h3>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: green; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="ContactUsController" name="ContactUs" method="post">

							<%
							if(session!=null){
								if(session.getAttribute("user")!=null){
									%>
							<div class="form-group">
								<input class="input" type="email" name="email"
									placeholder="Email Address" value="<%=u.getEmail() %>"
									readonly="readonly">
							</div>
							<%
								}else{
									%>
							<div class="form-group">
								<input class="input" type="email" name="email"
									placeholder="Email Address" required="required">
							</div>
							<%
								}
							}
							%>
							<div class="form-group">
								<textarea rows="4" cols="10" placeholder="Message"
									name="message" class="input"></textarea>
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="ContactUs">
							</div>
						</form>
					</div>
					<!-- /ContactUs Details -->
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