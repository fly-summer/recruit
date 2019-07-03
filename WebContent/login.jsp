<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("session:"+request.getSession().getAttribute("user"));
%>
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<%@include file="/publicLink.jsp"%>
	<script type="text/javascript">
		var tip='${tips}';
		if(tip==''||tip==null){			
		}else{
			alert(tip);
		}
	</script>
</head>
<body>
	<div class="container-fluid">
		 <%@include file="/template.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-7 col-xs-12">
					<div class="">
						<img src="${pageContext.request.contextPath}/static/img/pexels-photo-316465.jpeg"
							class="img-responsive center-block">
					</div>
				</div>
				<div class="col-md-5 col-xs-12">
					<div class="panel panel-default">
<%-- 						<c:if test="${not empty tips } "> --%>
<%-- 							<h4>text="${tips }"</h4> --%>
<%-- 						</c:if> --%>
					<div class="panel-heading">用户登录</div>
						<div class="panel-body">
							<form action="doLogin.do" role="form" method="POST">
								<div class="form-group">
									<label for="username">用户名：</label> 
									<input type="text" class="form-control" id="username" name="username" placeholder="请输入名称">
								</div>
								<div class="form-group">
									<label for="password">密码：</label> <input type="password"
										class="form-control" id="password" name="password" placeholder="请输入名称">
								</div>
								<div class="form-group">
									<label for="type" class="center-block">用户类型：</label> <label
										class="radio-inline"> <input type="radio" value="1"
										name="type" checked>学生
									</label> <label class="radio-inline"> <input type="radio"
										value="2" name="type">企业
									</label> <label class="radio-inline"> <input type="radio"
										value="3" name="type">管理员
									</label>
								</div>
								<button type="submit" class="btn btn-default">提交</button>
							</form>
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