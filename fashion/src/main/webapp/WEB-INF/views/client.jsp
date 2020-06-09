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

<title>Thêm nhân viên</title>

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

#form:inputBox {
	max-height: 167px;
}

.tooltip>.tooltip-inner {
	max-width: 100%;
}
</style>
</head>
<body>
<body>
	<div id="wrapper">
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header" style="color: red" align="center">Thêm nhân viên</h3>
					</div>
					<!-- /.col-lg-12  -->
				</div>
				<div class="container">
					<br> <span
						style="color: red; font-size: 15px; margin-bottom: 10px;">${msg}</span>
					<form:form id="form" class="form-horizontal" action="add"
						method="post" modelAttribute="employee">
						<div class="row">
							<div class="col-md-5">
								<div class="form-group">
									<label class="control-label col-sm-2" for="id">Mã Nhân
										Viên:</label>
									<div class="col-sm-10">
										<form:input type="text" cssClass="form-control" path="id"
											placeholder="Nhập mã nhân viên" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="firstName">Tên:</label>
									<div class="col-sm-10">
										<form:input type="text" cssClass="form-control"
											path="firstName" placeholder="Nhập tên" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="lastName">Họ:</label>
									<div class="col-sm-10">
										<form:input type="text" cssClass="form-control"
											path="lastName" placeholder="Nhập họ" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="dateOfBirth">Ngày
										sinh:</label>
									<div class="col-sm-10">
										<form:input type="date" min="1970-01-01" class="form-control"
											path="dateOfBirth" placeholder="form:input here"
											required="required" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="address">Địa
										chỉ:</label>
									<div class="col-sm-10">
										<form:input type="text" class="form-control" path="address"
											placeholder="Nhập địa chỉ" required="required" />
									</div>
								</div>
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<label class="control-label col-sm-2" for="sex">Phân
										quyền:</label>
									<div class="col-sm-10">
										<form:select path="sex" cssClass="form-control">
											<form:options items="${dataForSexs}" cssClass="form-control" />
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="phone">Số
										điện thoại:</label>
									<div class="col-sm-10">
										<form:input type="text" class="form-control" path="phone"
											placeholder="Nhập SĐT" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="email">Email:</label>
									<div class="col-sm-10">
										<form:input type="text" class="form-control" path="email"
											placeholder="Nhập email" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="groupId.id">Phân
										quyền:</label>
									<div class="col-sm-10">
										<form:select path="groupId.id" cssClass="form-control">
											<form:options items="${listEmployee}" cssClass="form-control" />
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="password">
										Password:</label>
									<div class="col-sm-10">
										<form:input type="text" class="form-control" path="password"
											placeholder="Nhập password" required="required" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-5 col-sm-7"
								style="margin-left: 425px; margin-top: 10px">
								<button type="submit" name="add" class="btn btn-success">
									<span class="glyphicon glyphicon-plus">Thêm</span>
								</button>
								&nbsp;&nbsp;&nbsp; <a href="employee"><button type="button"
										class="btn btn-danger">Hủy</button></a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</body>
</html>
