<%@page import="com.code.fashion.entity.UserEntity"%>
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

<title>User</title>
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

</head>
<body>
	<div id="wrapper">
		<!-- Navigation -->
				<nav class="navbar navbar-default navbar-static-top"
					role="navigation" style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="navbar-brand" href="homepage">Shop ABC</a>
				</div>
				<!-- /.navbar-header -->

				<ul class="nav  navbar-right top-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> ${username}
							</a>
						<ul class="dropdown-menu">
							<li><a href="homepage"><i class="fa fa-fw fa-user"></i>
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
				<%-- <jsp:include page="menu.jsp"></jsp:include> --%>
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
				</nav>
			</div>


			<div class="col-10">
				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<h3 class="page-header" style="color: red">Thông tin nhân viên</h3>
							</div>
							<!-- /.col-lg-12  -->
						</div>

						<div class="container col-md-12" style="margin-top: 20px;">
							<form>
								<div style="max-height: 250px; overflow: auto;">
									<table class="table table-bordered">

										<tr class="info">
											<th>Tên nhân viên: ${user.firstName}</th>
										</tr>
										<tr class="info">
											<th>Mã nhân viên: ${user.id}</th>
										</tr>
										<tr class="info">
											<th>Ngày sinh: ${user.dateOfBirth}</th>
										</tr>
										<tr class="info">
											<th>Địa chỉ: ${user.address}</th>
										</tr>
										<tr class="info">
											<th>Số điện thoại: ${user.phone}</th>
										</tr>
									</table>
								</div>
							</form>
						</div>

						<div class="left" style="width: 1140">
							<form id="input_form" name="input_form" method="POST"
								action="updatepass">
								<div>
									<h4 style="color: red;">${Error}</h4>
								</div>
								<table class="table table-bordered" style="width: 1140">
									<tr>
										<th>Mật khẩu cũ</th>
										<th><input type="password" name="oldpass"
											class="form-control"></th>
									</tr>
									<tr>
										<th>Mật khẩu mới</th>
										<th><input type="password" name="newpass"
											class="form-control" id="newpass"></th>
									</tr>
									<tr>
										<th>Xác nhận</th>
										<th><input type="password" name="renewpass"
											class="form-control" id="renewpass"></th>
									</tr>
								</table>
								<input type="submit" value="Đổi mật khẩu"
									class="btn btn-success" style="margin-left: 510px" />
							</form>
						</div>
						<div style="margin-top: 20px; background: #f3eeee">

							<div class="container"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>