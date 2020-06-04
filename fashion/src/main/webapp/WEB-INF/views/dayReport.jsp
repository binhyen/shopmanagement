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
							<li><a href="#"><i class="fa fa-dashboard fa-fw"></i>
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
									<li><a href="empoyee">Danh sách nhân viên</a></li>
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
								<h1 class="page-header">Báo cáo ngày</h1>
							</div>
							<!-- /.col-lg-12  -->
						</div>
						<form action="report" class="form-horizontal" method="post">
							<label class="control-label col-md-2">Chọn ngày</label>
							<div class="col-md-6">
								<input name="dateSearch" type="date" class="form-control" />
							</div>
							<button type="submit" class="col-md-1 btn btn-success">Search</button>
						</form>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-dsSanPham">
							<thead>
								<tr>
								<tr class="info">
									<th><div align="center">No</div></th>
									<th><div align="center">Mã hàng</div></th>
									<th><div align="center">Tên hàng</div></th>
									<th><div align="center">Size</div></th>
									<th><div align="center">Số lượng</div></th>
									<th><div align="center">Tổng thu</div></th>
									<th><div align="center">Ngày lập</div></th>
								</tr>


								</tr>
							</thead>

							<tbody id="tbl-body">

								<c:forEach var="report" items="${listReport}" varStatus="status">
									<tr>
										<td>${status.index+1+(page-1)*numberUsersInOnePage}</td>
										<td id="idUser">${report.maHang}</td>
										<td>${report.tenHang}</td>
										<td>${report.size}</td>
										<td>${report.soLuong}</td>
										<td>${report.tongThu}</td>
										<td>${report.ngayLap}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>

				</div>

			</div>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Thông tin khách
								hàng</h4>
						</div>
						<div class="modal-body">
							<form:form modelAttribute="employee" method="POST"
								action="customer" cssClass="form-horizontal">
								<div id="scrollContainer" class="form-group" style="">
									<div id="inputBox">
										<div class=" row form-group">
											<div class="form-group" align="left">
												<label class="control-label col-md-2">Mã KH</label>
												<div class="col-md-4">
													<c:if test="${employee.id != null}">
														<form:input path="id" class="form-control"
															placeholder="Mã khách hàng" readonly="true"
															required="true" />
													</c:if>
													<c:if test="${employee.id == null}">
														<form:input path="id" class="form-control" id="id"
															placeholder="Mã Khách hàng" required="true" />
													</c:if>
												</div>
												<label class="control-label col-md-2">Giới tính</label>
												<div class="col-md-4">
													<form:input id="sex" path="sex" class="form-control"
														placeholder="Giới tính" />
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-md-2">Họ tên</label>
												<div class="col-md-4">
													<form:input id="name" path="name" class="form-control"
														placeholder="Họ tên" required="true" />
												</div>
												<label class="control-label col-md-2">Số ĐT</label>
												<div class="col-md-4">
													<form:input id="phone" path="phone" type="text"
														placeholder="Số điện thoại" class="form-control" />
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Ngày Sinh</label>
												<div class="col-md-4">
													<form:input id="dateOfBirth" path="dateOfBirth"
														class="form-control" type="date" placeholder="Ngày sinh" />
												</div>
												<label class="control-label col-md-2">Email</label>
												<div class="col-md-4">
													<form:input id="email" path="email" class="form-control"
														type="text" placeholder="Email" />
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Địa chỉ</label>
												<div class="col-md-4">
													<form:input id="address" path="address"
														class="form-control" type="text" placeholder="Địa chỉ" />
												</div>
												<label class="control-label col-md-2">Điểm</label>
												<div class="col-md-4">
													<form:input id="point" path="point" class="form-control"
														type="number" placeholder="Điểm" />
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2">Cấp bậc</label>
												<div class="col-md-4">
													<form:input id="rank" path="rank" class="form-control"
														type="text" placeholder="Cấp bậc" />
												</div>
											</div>

										</div>
									</div>
								</div>
								<div class="form-group" align="center">
									<form:button class="btn btn-link" type="submit">
										<u>Commit (Add or Update)</u>

									</form:button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>