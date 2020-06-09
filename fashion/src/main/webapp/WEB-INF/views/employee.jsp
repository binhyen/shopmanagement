<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<meta charset='utf-8'>

<title>Danh sách nhân viên</title>
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
				</nav>
			</div>
			<div class="col">
				<!-- Page Content -->
				<div id="page-wrapper">
					<div class="container-fluid">
						<!-- <div class="col-xs-12"
							style="padding-top: 20px; border: 1px solid;"> -->
							<h3 style="color: red">DANH SÁCH NHÂN VIÊN</h3>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr class="success">
										<th><div align="center">No</div></th>
										<th><div align="center">Mã nhân viên</div></th>
										<th><div align="center">Họ tên</div></th>
										<th><div align="center">Ngày sinh</div></th>
										<th><div align="center">Địa chỉ</div></th>
										<th><div align="center">Giới tính</div></th>
										<th><div align="center">Số ĐT</div></th>
										<th><div align="center">Email</div></th>
										<th><div align="center">Phân quyền</div></th>
										<!-- <th>Password</th> -->
										<th><div align="center">Chức năng</div></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="employee" items="${listEmployee}" varStatus="status">
										<tr>
											
											<td class="success">${status.index+1+(page-1)*numberUsersInOnePage}</td>
											<td>${employee.id}</td>
											<td>${employee.firstName}${employee.lastName}</td>
											<td>${employee.dateOfBirth}</td>
											<td>${employee.address}</td>
											<td>${employee.sex}</td>
											<td>${employee.phone}</td>
											<td>${employee.email}</td>
											<td>${employee.getGroupId().getId()}</td>
											<%-- <td>${employee.password}</td> --%>
											<td>
												<div align="center">
													<a href="customer?edit?id=${employee.id}"
														class="btn btn-link"> <span
														class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													</a> <a href="deleteEmployee?id=${employee.id}"
														class="btn btn-link"> <span
														class="glyphicon glyphicon-remove" style="color: red"
														aria-hidden="true"></span>
													</a>
												</div>
											</td>
											<%-- <th class="danger"><a href="edit?id=${employee.id}"><button
														type="button" class="btn btn-warning">
														<span class="glyphicon glyphicon-pencil">Sửa</span>
													</button></a></th> --%>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<nav aria-label="Page navigation" class="text-center">
							<ul class="pagination">
								<c:if test="${page>1}">
									<li><a href="employee?page=1" aria-label="First"> <span
											aria-hidden="true">&lt;&lt;</span>
									</a></li>
									<li><a href="employee?page=${page-1}"
										aria-label="Previous"> <span aria-hidden="true">&lt;</span>
									</a></li>
								</c:if>
								<c:if test="${page<=1}">
									<li class="active"><span aria-hidden="true">&lt;&lt;</span>
									</li>
									<li class="active"><span aria-hidden="true">&lt;</span></li>
								</c:if>
								<c:if test="${page-2>=1}">
									<c:set var="begin" value="${page-2}"></c:set>
								</c:if>
								<c:if test="${page-2<1}">
									<c:set var="begin" value="1"></c:set>
								</c:if>
								<c:if test="${begin+4<=pageCount}">
									<c:set var="end" value="${begin+4}"></c:set>
								</c:if>
								<c:if test="${begin+4>pageCount}">
									<c:set var="end" value="${pageCount}"></c:set>
									<c:if test="${end-4>=1}">
										<c:set var="begin" value="${end-4}"></c:set>
									</c:if>
								</c:if>
								<c:forEach var="i" begin="${begin}" end="${end}">
									<c:if test="${i==page}">
										<li class="active"><a>${i}</a></li>
									</c:if>
									<c:if test="${i!=page}">
										<li><a href="employee?page=${i}">${i}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${page<pageCount}">
									<li><a href="employee?page=${page+1}" aria-label="Next">
											<span aria-hidden="true">&gt;</span>
									</a></li>
									<li><a href="employee?page=${pageCount}" aria-label="Last">
											<span aria-hidden="true">&gt;&gt;</span>
									</a></li>
								</c:if>
								<c:if test="${page>=pageCount}">
									<li class="active"><span aria-hidden="true">&gt;</span></li>
									<li class="active"><span aria-hidden="true">&gt;&gt;</span>
									</li>
								</c:if>
							</ul>
							</nav>

							<a href="addEmployee"><button type="button"
									class="btn btn-success" style="margin-bottom: 10px">
									<span class="glyphicon glyphicon-plus">Thêm</span>
								</button></a> <br>
							<button type="button" class="btn btn-info"
								style="margin-bottom: 10px">
								<span class="glyphicon glyphicon-search">Tìmkiếm</span>
							</button>
							<input type="text" name="timKiem" placeholder="Nhập tìm kiếm" />
						<!-- </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>