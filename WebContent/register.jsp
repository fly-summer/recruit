<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>用户注册</title>
	<%@include file="/publicLink.jsp"%>
</head>

<body>
	<div class="container-fluid">
		<%@include file="/template.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-7 col-xs-12">
					<div class="">
						<img src="${pageContext.request.contextPath}/static/img/pexels-photo-316465.jpeg" class="img-responsive center-block">
					</div>
				</div>
				<div class="col-md-5 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">用户注册</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3 col-md-offset-2 text-muted col-xs-12">
									<a href="graduateReg.jsp"><img class="thumbnail" alt="学生注册" src="${pageContext.request.contextPath}/static/img/graduate.png">
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-md-offset-2 text-muted col-xs-12">
									<a href="companyReg.jsp" class=""><img class="thumbnail" alt="企业注册" src="${pageContext.request.contextPath}/static/img/companyReg.png">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="/foot.jsp"%>
		</div>
	</div>

	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</body>

</html>