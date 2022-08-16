<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
try {
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    if (session.getAttribute("name")==null) {
        response.sendRedirect("login.jsp");
    }
    else {}
}
catch(Exception ex) {
    out.println(ex);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>View/Edit Applicant</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/adddataform.css">
<link rel="stylesheet" type="text/css" href="css/adddatafrm1.css">
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<style>
body {
	background:linear-gradient(0deg, rgba(115,245,204,0.2726132689403886) 0%, rgba(64,163,172,0.4490838571756828) 100%);
	background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}
.form-title{
	width:100%;
	position:relative;
	right:50px;
	color:#91a5b7;
	font-family:Poppins-Regular;
	margin: 10px 0;
}

#reject-form {
	padding:0;
	position:absolute;
	bottom:0.6%;
	left:55%;
}

</style>
</head>
<body onload="hideFunction()">
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a href="mainMenuSAdmin.jsp" class="navbar-brand"> <img src="img/dentalrecordsicon-small.png"
			height="40" width="40" alt="DentalRecordManagementSystem">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="mainMenuSAdmin.jsp">Home <span class="sr-only">(current)</span></a></li>
				
			</ul>
		</div>
	</nav>

	<%
	Connection con;
	Statement stmt;
	Statement stmt2;
	ResultSet rs;
	ResultSet rs2;
	String id = request.getParameter("id");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://be411b9b7c9b30:cf5f4f3e@us-cdbr-east-06.cleardb.net/heroku_b9c43cd0bc4ec95?reconnect=true");
		stmt = con.createStatement();
		stmt2 = con.createStatement();
		String sql = "select * from adminapproval where idapproval=" + id;
		String sql2 = "select * from clinics";
		rs = stmt.executeQuery(sql);
		rs2 = stmt2.executeQuery(sql2);
		while (rs.next()) {
	%>
	
	<section>
		<div class="main">
			<div class="container-contact100">
				<div class="wrap-contact100">
					<div class="contact100-form-title"
						style="background-image: url(img/bg-01.jpg);">
						<span class="contact100-form-title-1"> Applicant Details </span>
					</div>

					<form class="contact100-form validate-form" action="adminApprove"
						method="post" id="register-form">

						<div class="hiddeninfo">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="id" id="id" value=<%=rs.getString(1)%> />
						</div>
						<div class="hiddeninfo">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="password" id="password" value=<%=rs.getString(4)%> />
						</div>
						<p><b>Name:</b></p>
						<div class="wrap-input100 validate-input"
							data-validate="Name is required">
							<span class="label-input100"><i
								class="zmdi zmdi-account material-icons-name"></i></span> <input
								class="input100" type="text" name="name" id="name"
								value="<%=rs.getString(2)%>" > <span
								class="focus-input100"></span>
						</div>
						
						<p><b>Email:</b></p>
						<div class="wrap-input100 validate-input">
							<span class="label-input100"><i class="zmdi zmdi-email"></i></span>
							<input class="input100" type="email" name="email" id="email"
								value="<%=rs.getString(5)%>" > <span
								class="focus-input100"></span>
						</div>
						
						<p><b>Phone Number:</b></p>
						<div class="wrap-input100 validate-input">
							<span class="label-input100"><i class="zmdi zmdi-phone"></i></span>
							<input class="input100" type="text" name="mobileNo" id="mobileNo"
								value="<%=rs.getString(3)%>" > <span
								class="focus-input100"></span>
						</div>
						
						<span class="form-title">Clinic Details</span>
						
						<p><b>Clinic Name:</b></p>
						<div class="wrap-input100 validate-input">
							<span class="label-input100"><i class="zmdi zmdi-account material-icons-name"></i></span>
							<input class="input100" type="text" name="clinicName" id="clinicName"
								value="<%=rs.getString(6)%>"> <span
								class="focus-input100"></span>
						</div>
						
						<p><b>Clinic Address:</b></p>
						<div class="wrap-input100 validate-input">
							<span class="label-input100"><i class="zmdi zmdi-gps-dot"></i></span>
							<input class="input100" type="text" name="clinicAddress" id="clinicAddress"
								value="<%=rs.getString(7)%>" > <span
								class="focus-input100"></span>
						</div>
						
						<p><b>Clinic Number:</b></p>
						<div class="wrap-input100 validate-input">
							<span class="label-input100"><i class="zmdi zmdi-phone"></i></span>
							<input class="input100" type="text" name="clinicContact" id="clinicContact"
								value="<%=rs.getString(8)%>"> <span
								class="focus-input100"></span>
						</div>
						<select name="clinicChoice">
						<% while(rs2.next()) {%>		
							<option><%= rs2.getString(2)%></option>
						<% }%>
						</select>
						
						<a href="createClinicData.jsp">Clinic not found? Create clinic data here</a>
						<div class="container-contact100-form-btn">
							<button id="approveBtn"class="contact100-form-btn btn-update">
								<span> Approve </span>
							</button>
						</div>
					</form>
					<form method="post" action="adminReject"
						class="contact100-form validate-form small-form" id="reject-form">
						<div class="hiddeninfo">
							 <input type="text" name="id" id="id" value=<%=rs.getString(1)%> />
						</div>
						<div class="hiddeninfo">
							 <input type="text" name="password" id="password" value=<%=rs.getString(4)%> />
						</div>
						<div class="hiddeninfo">
							 <input class="input100" type="text" name="name" id="name"
								value="<%=rs.getString(2)%>" >
						</div>
						<div class="hiddeninfo">
							<input class="input100" type="text" name="mobileNo" id="mobileNo"
								value="<%=rs.getString(3)%>" > 
						</div>
						<div class="hiddeninfo">
							<input class="input100" type="email" name="email" id="email"
								value="<%=rs.getString(5)%>" >
						</div>
						<div class="hiddeninfo">
							<input class="input100" type="text" name="clinicName" id="clinicName"
								value="<%=rs.getString(6)%>"> 
						</div>
						<div class="hiddeninfo">	
							<input class="input100" type="text" name="clinicAddress" id="clinicAddress"
								value="<%=rs.getString(7)%>" >
						</div>
						<div class="hiddeninfo">
							<input class="input100" type="text" name="clinicContact" id="clinicContact"
								value="<%=rs.getString(8)%>"> 
						</div>
						<div class="container-contact100-form-btn">
							<button id="rejectBtn" class="btn-danger">
								<span> Reject </span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%
	} ;
	con.close();
	} catch (Exception e) {
	System.out.println(e.getMessage());
	e.getStackTrace();
	}
	%>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Approved", 
				"Application for administrator access has been approved.", 
				"success"
				).then((placeholder) => {
					window.location.href = "mainMenuSAdmin.jsp";
				});
		}
		else if (status == "failed") {
			swal("Rejected", 
					"Application administrator access has been rejected.", 
					"error"
			).then((placeholder) => {
				window.location.href = "mainMenuSAdmin.jsp";
			});
		}
		
		function hideFunction() {
			var hiddenInformation = document
					.getElementsByClassName("hiddeninfo");
			for (var i = 0; i < hiddenInformation.length; i++) {
				hiddenInformation[i].style.display = 'none';
			}
		}
	</script>

</body>
</html>
