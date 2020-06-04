<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Thêm khách hàng</h1>
					</div>
					<!-- /.col-lg-12  -->
				</div>

				<div class="container" style="margin-top: 20px">
					<form class="form-horizontal" action="saveCustomer" method="post"
						modelAttribute="customerForm">
						<div class="row">
							<div class="col-xs-5">
								<div class="form-group">
									<label class="control-label col-sm-2" for="id">Mã khách
										hàng:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="id"
											placeholder="Nhập mã khách hàng" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="name">Họ
										tên:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="name"
											placeholder="Nhập họ tên" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="dateOfBirth">Ngày
										sinh:</label>
									<div class="col-sm-10">
										<input type="date" min="1970-01-01" class="form-control"
											name="dateOfBirth" placeholder="Nhập ngày sinh"
											required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="address">Địa
										chỉ:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="address"
											placeholder="Nhập địa chỉ" required="required">
									</div>
								</div>
							</div>
							<div class="col-xs-5">
								<div class="form-group">
									<label class="control-label col-sm-2" for="sex">Giới
										tính:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="sex"
											placeholder="Nhập giới tính" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="phone">Số
										ĐT:</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="phone"
											placeholder="Nhập số điện thoại" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2" for="email">Email:</label>
									<div class="col-sm-10">
										<input type="email" class="form-control" name="email"
											placeholder="Nhập email" required="required">
									</div>
								</div>

							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-5 "
								style="text-align: auto; margin-top: 10px">
								<button type="submit" name="them" class="btn btn-success">Thêm</button>
								&nbsp;&nbsp;&nbsp; <a href="customer"><button type="button"
										class="btn btn-danger">Hủy</button></a>
							</div>
						</div>
					</form>
				</div>

			</div>

		</div>

	</div>



</body>
</html>