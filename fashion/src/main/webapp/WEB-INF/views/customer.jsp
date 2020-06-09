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

<title>Danh sách khách hàng</title>
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
<c:if test="${customer.id !=null}">
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
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand" href="homepage">Shop ABC</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav  navbar-right top-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="fa fa-user"></i> ${username} <!-- <b class="caret"></b> --></a>
				<ul class="dropdown-menu">
					<li><a href="homepage"><i class="fa fa-fw fa-user"></i>
							Profile</a></li>
					<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a></li>
					<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="logout"><i class="fa fa-fw fa-power-off"></i>
							Log Out</a></li>
				</ul></li>
			<!-- /.dropdown -->
		</ul>
		</nav>
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
			</div>
			<div class="col">
				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<h1 class="page-header">Danh sách khách hàng</h1>
							</div>
							<!-- /.col-lg-12  -->
						</div>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-dsSanPham">
							<thead>
								
								<tr class="success">
									<th><div align="center">No</div></th>
									<th><div align="center">Mã KH</div></th>
									<th><div align="center">Tên KH</div></th>
									<th><div align="center">Giới tính</div></th>
									<th><div align="center">Điểm</div></th>
									<th><div align="center">Bậc</div></th>
									<th><div align="center">Action</div></th>
								</tr>
							</thead>

							<tbody id="tbl-body">

								<c:forEach var="customer" items="${listCustomers}"
									varStatus="status">
									<tr>
										<td>${status.index+1+(page-1)*numberUsersInOnePage}</td>
										<td id="idUser">${customer.id}</td>
										<td>${customer.name}</td>
										<td>${customer.sex}</td>
										<td>${customer.point}</td>
										<td>${customer.rank}</td>
										<td>
											<div align="center">
												<a href="customer?id=${customer.id}" class="btn btn-link">
													<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
												</a> <a href="deleteCustomer?id=${customer.id}"
													class="btn btn-link"> <span
													class="glyphicon glyphicon-remove" style="color: red"
													aria-hidden="true"></span>
												</a>
											</div> <!-- <button id="update" type="button"
												class="btn btn-link btn-lg hidden" data-toggle="modal"
												data-target="#myModal">
												<span class="glyphicon glyphicon-pencil"></span>
											</button>  -->

										</td>
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
							<h4 class="modal-title" id="myModalLabel">Thông tin khách
								hàng</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form:form modelAttribute="customer" method="POST"
								action="customer" cssClass="form-horizontal">
								<div id="scrollContainer" class="form-group" style="">
									<div id="inputBox">
										<div class=" row form-group">
											<div class="form-group" align="left">
												<label class="control-label col-md-2">Mã KH</label>
												<div class="col-md-4">
													<c:if test="${customer.id != null}">
														<form:input path="id" class="form-control"
															placeholder="Mã khách hàng" readonly="true"
															required="true" />
													</c:if>
													<c:if test="${customer.id == null}">
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