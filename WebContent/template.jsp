<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.recruit.model.User"%>
<div class="row">
	<div class="col-md-12 text-center">
		<a href="index.jsp" class=""> <img src="${pageContext.request.contextPath}/static/img/title.jpg">
		</a>
	</div>
</div>
<div class="row">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">主页</a>
			</div>
			<div class="collapse navbar-collapse" id="menu-navbar-collapse">
				<!--向左对齐-->

				<!-- null -->
				<c:if test="${ empty sessionScope.user }">
					<ul class="nav navbar-nav">
						<li><a href="newsList.jsp">资讯</a></li>
						<li><a href="search.jsp">搜索</a></li>
					</ul>
					<!-- <p class="navbar-text navbar-left">向左对齐-文本</p> -->
					<ul class="nav navbar-nav navbar-right">
						<li><a href="register.jsp"> <span class="glyphicon glyphicon-user"></span>&nbsp;注册
							</a></li>
						<li><a href="login.jsp"> <span class="glyphicon glyphicon-log-in"></span>&nbsp;登录
							</a></li>
					</ul>
				</c:if>

				<!-- graduate -->
				<c:if test="${ not empty sessionScope.user and sessionScope.user.type == 1}">
					<ul class="nav navbar-nav">
						<li><a href="newsList.jsp">资讯</a></li>
						<li><a href="search.jsp">工作检索</a></li>
						<li><a href="graduateRequest.jsp">已申请</a></li>
					</ul>
					<!-- <p class="navbar-text navbar-left">向左对齐-文本</p> -->
					<ul class="nav navbar-nav navbar-right">
						<li><a href="stuPersonalInfo"><span class="glyphicon glyphicon-user"> </span>&nbsp;${ sessionScope.user.username }</a></li>
						<li><a href="doLogout.do"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
					</ul>
				</c:if>

				<!-- company -->
				<c:if test="${ not empty sessionScope.user and sessionScope.user.type == 2}">
					<ul class="nav navbar-nav">
						<li><a href="newsList.jsp">资讯</a></li>
						<li><a href="companyPublish.jsp">发布招聘</a></li>
						<li><a href="requestList.jsp">查看投递</a></li>
					</ul>
					<!-- <p class="navbar-text navbar-left">向左对齐-文本</p> -->
					<ul class="nav navbar-nav navbar-right">
						<li><a href="companyInfo"><span class="glyphicon glyphicon-user"> </span>&nbsp;${sessionScope.user.username }</a></li>
						<li><a href="doLogout.do"><span class="glyphicon glyphicon-log-in"></span>&nbsp;退出</a></li>
					</ul>

				</c:if>

				<!-- administrator -->
				<c:if test="${ not empty sessionScope.user and sessionScope.user.type == 3}">
					<ul class="nav navbar-nav">
						<li><a href="addNews">资讯发布</a></li>
						<li><a href="userList">用户管理</a></li>
						<li><a href="#">XXXX</a></li>
					</ul>
					<p class="navbar-text navbar-left">向左对齐-文本</p>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;注册</a></li>
						<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
					</ul>
				</c:if>

			</div>
		</div>
	</nav>
</div>