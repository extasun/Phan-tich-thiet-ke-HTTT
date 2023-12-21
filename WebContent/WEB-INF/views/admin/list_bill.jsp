<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Danh sách đơn hàng</title>

<link href="<c:url value = "/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value = "/resources/css/datepicker3.css"/>" rel="stylesheet">
<link href="<c:url value = "/resources/css/styles.css"/>" rel="stylesheet">

<script src="<c:url value="/resources/js/lumino.glyphs.js"/>"></script>
</head>

<body>
	
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.servletContext.contextPath}/admin/index.htm"><span>BOOKSTORE</span>Admin</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> ${fullname} <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="${pageContext.servletContext.contextPath}/admin/profile.htm"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Profile</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/admin/editprofile.htm"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Settings</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/dangxuat.htm"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li><a href="${pageContext.servletContext.contextPath}/admin/index.htm"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>Trang chủ</a></li>
			<li class="active"><a href="${pageContext.servletContext.contextPath}/admin/listbill.htm"><svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>Đơn Hàng</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/listuser.htm"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>Danh sách tài khoản</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/listproduct.htm"><svg class="glyph stroked mobile device"><use xlink:href="#stroked-mobile-device"/></svg>Danh sách sản phẩm</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/newproduct.htm"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>Thêm sản phẩm</a></li>
			<li><a href="${pageContext.servletContext.contextPath}/admin/newaccount.htm"><svg class="glyph stroked app-window"><use xlink:href="#stroked-app-window"></use></svg>Thêm tài khoản</a></li>
			<li class="parent ">
				<a href="${pageContext.servletContext.contextPath}/admin/profile.htm">
					<span data-toggle="collapse" href="#sub-item-1"><svg class="glyph stroked chevron-down"><use xlink:href="#stroked-chevron-down"></use></svg></span> ${fullname } 
				</a>
				<ul class="children collapse" id="sub-item-1">
					
					<li>
						<a class="" href="${pageContext.servletContext.contextPath}/admin/editprofile.htm">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Setting
						</a>
					</li>
					<li>
						<a class="" href="${pageContext.servletContext.contextPath}/dangxuat.htm">
							<svg class="glyph stroked chevron-right"><use xlink:href="#stroked-chevron-right"></use></svg> Logout
						</a>
					</li>
				</ul>
			</li>
			<li role="presentation" class="divider"></li>
			<li><a href="${pageContext.servletContext.contextPath}/dangxuat.htm"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Đăng Xuất</a></li>
		</ul>
		<div class="attribution">Template by <a href="http://www.medialoot.com/item/lumino-admin-bootstrap-template/">Medialoot</a><br/><a href="http://www.glyphs.co" style="color: #333;">Icons by Glyphs</a></div>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="${pageContext.servletContext.contextPath}/admin/index.htm"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
				<li class="active">Order List</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Danh Sách Đơn Hàng</div>
					<div class="panel-body">
						<div class="panel panel-info " style="margin-bottom: 15px">
						  <div class="panel-body">
						  	<table class="table table-hover">
								<thead>
									<th>STT</th>
									<th>Mã Đơn Hàng</th>
									<th>Thời Gian</th>
									<th>Phương thức thanh toán</th>
									<th>Thành tiền</th>
									<th>Chi tiết đơn hàng</th>
								</thead>
								<tbody>
								<%! int j = 1;%>
								<c:forEach var="bill" items="${listBill }">
								
									<tr>
										<td><% out.print(j++); %></td>
										<td>${bill.billId}</td>
										<td>${bill.date }</td>
										<td>${bill.payment_Methods.paymentName }</td>
										<td>${bill.sumMoneyToString() } VNĐ</td>
										<td><a href="${pageContext.servletContext.contextPath}/admin/bill/${bill.billId }.htm"><span class="glyphicon glyphicon-inbox" aria-hidden="true"></span></a></td>
									</tr>
								</c:forEach>
									<% j=1; %>
								</tbody>
							</table>
						</div>
				</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
	</div>	<!--/.main-->
	
		

	<script src="<c:url value = "/resources/js/jquery-1.11.1.min.js"/>"></script>
	<script src="<c:url value = "/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value = "/resources/js/chart.min.js"/>"></script>
	<script src="<c:url value = "/resources/js/chart-data.js"/>"></script>
	<script src="<c:url value = "/resources/js/easypiechart.js"/>"></script>
	<script src="<c:url value = "/resources/js/easypiechart-data.js"/>"></script>
	<script src="<c:url value = "/resources/js/bootstrap-datepicker.js"/>"></script>
	<script>
		$('#calendar').datepicker({
		});

		!function ($) {
		    $(document).on("click","ul.nav li.parent > a > span.icon", function(){          
		        $(this).find('em:first').toggleClass("glyphicon-minus");      
		    }); 
		    $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
