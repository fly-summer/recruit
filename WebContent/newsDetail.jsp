<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>>${ title }</title>
    <%@include file="/publicLink.jsp"%>
</head>

<body>
    <div class="container-fluid">
        <%@include file="/template.jsp"%>
        <div class="container">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        资讯
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <h3>${ title }</h3>&nbsp;&nbsp;<span class="text-muted">${ newstime }</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <p>${ content }</p>
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