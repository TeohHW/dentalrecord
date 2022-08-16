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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dentist List</title>
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
<link rel="stylesheet" type="text/css" href="css/table.css">

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<style>
body {
	background: linear-gradient(0deg, rgba(115, 245, 158, 0.2502043053549545)
		0%, rgba(171, 227, 255, 0.8608485630580357) 100%);
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}


</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a href="mainMenuAdmin.jsp" class="navbar-brand"> <img
			src="img/dentalrecordsicon-small.png" height="40" width="40"
			alt="DentalRecordManagementSystem">
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
					href="mainMenuAdmin.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> DENTIST </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addDentist.jsp">Add Dentist</a> <a
							class="dropdown-item" href="dentistList.jsp">Dentist List</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<div class="serchbar">
		<form action="" method="post">
			<input class="search" type="text" name="search"
				placeholder="Search Here..." />
		</form>
	</div>
	<br>

	<section>
		<div class="container">
			<div id="pagination-container">
				<%
				try {
					Statement stat = null;
					ResultSet rs = null;
					int customerid = 1;
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection(
					"jdbc:mysql://be411b9b7c9b30:cf5f4f3e@us-cdbr-east-06.cleardb.net/heroku_b9c43cd0bc4ec95?reconnect=true");
					stat = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					String query = request.getParameter("search");
					String data;
					
					if (query != null) 
					{
						data = "select * from dentist where name like '%" + query + "%' AND clinicId like '%" + (int)session.getAttribute("clinicId") + 
									"%' OR address like '%" + query + "%' AND clinicId like '%" + (int)session.getAttribute("clinicId") + 
									"%' OR email like '%" + query + "%' AND clinicId like '%" + (int)session.getAttribute("clinicId") + "%'";
					} 
					else
						data = "select * from dentist where clinicId like '%" + (int)session.getAttribute("clinicId") + "%' ORDER BY iddentist ASC";
					rs = stat.executeQuery(data);
					if (rs.next() != true) 
					{
						data = "select * from dentist where clinicId like '%" + (int)session.getAttribute("clinicId") + "%' ORDER BY iddentist ASC";
						rs = stat.executeQuery(data);
						%>
							<input type="hidden" id="status" value="error">
						<%
					}
					
				rs.beforeFirst();
				while (rs.next()) {
				%>
				<table border="1" class="table" id="patient-table">
					<tr>
						<th style="width: 10%;">IC Number</th>
						<th style="width: 20%;">Name</th>
						<th style="width: 15%;">Date Of Birth (YYYY-MM-DD)</th>
						<th style="width: 20%;">Address</th>
						<th style="width: 10%;">Contact Number</th>
						<th style="width: 10%;">Email Address</th>
						<th style="width: 10%;">Action(s)</th>
					</tr>
					<%
					do {
					%>

					<tr class="patient-row">
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(7)%></td>
						<td><a class="btn" href=./vieweditdentist.jsp?id=<%=rs.getInt(1)%>> View/Edit </a></td>
					</tr>

					<%
					} while (rs.next());
					}
					con.close();
					} catch (Exception e) {
					System.out.println(e.getMessage());
					e.getStackTrace();
					}
					%>
				</table>
			</div>
		</div>
	</section>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; FYP-22-S2-20 2022</small>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- jquery CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$("document").ready(function(){
			$("#pagination-container").after('<div id="pages"></div>');
			var rowsShown = 5;
			var rowsTotal = $("#patient-table tbody tr.patient-row").length;
			var numPages = rowsTotal/rowsShown;
			
			for(let i = 0; i < numPages; i++){
				pageNo = i + 1;
				$("#pages").append('<a href="#" rel="' + i + '">' + pageNo + '</a>');
			}
			
			$("#patient-table tbody tr.patient-row").hide();
			$("#patient-table tbody tr.patient-row").slice(0, rowsShown).show();
			$("#pages a:first").addClass("active");
			$("#pages a").bind('click', function(){
				$("#pages a").removeClass("active");
				$(this).addClass("active");
				let currPage = $(this).attr("rel");
				let startItem = currPage * rowsShown;
				let endItem = startItem + rowsShown;
				
				$("#patient-table tbody tr.patient-row").css("opacity", "0.0").hide().slice(startItem, endItem).css("display", "table-row").animate({opacity:1}, 300);
				
			});
		});
	</script>
	<!-- JS -->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var status = document.getElementById("status").value;
		if(status == "error")
		{
			swal("Sorry","No record(s) found!","error");
		}
	</script>
</body>
</html>
