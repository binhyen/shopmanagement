<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation"
		style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand" href="homepage">Shop ABC</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav  navbar-right top-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user"></i> ${username} </a>
				<ul class="dropdown-menu">
					<li><a href="homepage"><i class="fa fa-fw fa-user"></i>
							Profile</a></li>
					<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
					</li>
					<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
					</li>
					<li class="divider"></li>
					<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
							Log Out</a></li>
				</ul></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

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
</body>
</html>