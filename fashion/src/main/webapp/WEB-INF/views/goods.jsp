<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<meta charset='utf-8'>

<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- Bootstrap Core CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js">
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Core JavaScript -->

<!-- jQuery Validation  -->
<script src="js/jquery.validate.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="js/sb-admin-2.js"></script>
<!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
#title h4 {
	padding: 5px;
	background-color: lavender;
	border: 1px solid darkcyan;
}

#scrollContainer {
	padding: 30px;
	margin-left: 0px;
	margin-right: 0px;
	background-color: #c7e0ff;
	max-height: 242;
	overflow: auto;
}

#inputBox {
	max-height: 167px;
}

.tooltip>.tooltip-inner {
	max-width: 100%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#update").click(function() {
			var id = $(this).parent().parent().children("#idUser").text();
			console.log("sadas" + id);
			$.ajax({
				type : "POST",
				url : "aCus",
				data : "id=" + id,
				success : function(data) {
					$("#id").val() = data.id;
					$("#firstName").val() = data.firstName;
					$("#email").val() = data.email;
					$("#phone").val() = data.phone;
					$("#address").val() = data.address;
					$("#dateOfBirth").val() = data.dateOfBirth;
					$("#sex").val() = data.sex;
					$("#rank").val() = data.rank;
					$("#point").val() = data.point;
				},
				error : function(e) {
					alert('Error: ' + e.responseText);
				}
			});

		});

	});
</script>
<c:if test="${employee.id !=null}">
	<script type="text/javascript">
		$(document).ready(function() {
			$('#myModal').modal('show');
		});
	</script>
</c:if>
</head>
<body>
	<div id="wrapper">
	<!-- Navigation -->
				<nav class="navbar navbar-default navbar-static-top"
					role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Shop ABC</a>
				</div>
				<!-- /.navbar-header -->

				<ul class="nav  navbar-right top-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> ${username}
							</a>
						<ul class="dropdown-menu">
							<li><a href="profile"><i class="fa fa-fw fa-user"></i>
									Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-envelope"></i>
									Inbox</a></li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>
									Settings</a></li>
							<li class="divider"></li>
							<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
									Log Out</a></li>
						</ul></li>
					<!-- /.dropdown -->
				</ul>
				</nav>
				<!-- /.navbar-top-links -->
		<div class="row">
			<div class="col-2">
				<nav>


				<div class="navbar-default sidebar" role="navigation">
					<div class="sidebar-nav navbar-collapse">
						<ul class="nav" id="side-menu">
							<li><a href="homepage"><i class="fa fa-dashboard fa-fw"></i>
									Home</a></li>
							<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
									Khách hàng<span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a href="customer">Danh sách khách hàng</a></li>
									<li><a href="insertCustomer">Thêm khách hàng</a></li>
								</ul> <!-- /.nav-second-level --></li>
							<li><a href="#"><i class="glyphicon glyphicon-user"></i>
									Nhân viên<span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a href="employee">Danh sách nhân viên</a></li>
									<li><a href="addEmployee">Thêm nhân viên</a></li>
								</ul> <!-- /.nav-second-level --></li>
							<li><a href="goods"><i class="glyphicon glyphicon-user"></i>
									Quản lý kho<span class="fa arrow"></span></a> <!-- /.nav-second-level --></li>
							<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
									Thống kê<span class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li><a href="report">Theo tháng</a></li>
									<li><a href="report">Theo ngày</a></li>
								</ul> <!-- /.nav-second-level --></li>

						</ul>
					</div>
					<!-- /.sidebar-collapse -->
				</div>
				<!-- /.navbar-static-side --> </nav>
			</div>
			<div class="col-10">
				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<h1 class="page-header">Hàng trong kho:</h1>
							</div>
							<!-- /.col-lg-12  -->
						</div>
						<table class="table table-bordered">
							<thead>
								<tr class="info">
									<th>No</th>
									<th>Mã hàng hóa</th>
									<th>Tên hàng hóa</th>
									<th>Số lượng</th>
									<th>Size</th>
									<th>Đơn giá</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="goods" items="${listGoods}" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${goods.id}</td>
										<td>${goods.name}</td>
										<td>${goods.quantity}</td>
										<td>${goods.size}</td>
										<td>${goods.price}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="timkiem" style="margin-left: 200px">

						<form action="search" method="GET">
							<table style="margin-left: 75px;">
								<tbody>
									<tr>
										<td><input type="submit" value="Tìm kiếm"></td>
										<td></td>
										<td><input style="margin-left: 40px" type="text"
											name="searchString" /></td>
									</tr>
								</tbody>
							</table>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>