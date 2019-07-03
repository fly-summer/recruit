<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>用户登录</title>
    <%@include file="/publicLink.jsp"%>
</head>

<body>
    <div class="container-fluid">
        <%@include file="/template.jsp"%>
        <div class="container">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        资讯发布
                    </div>
                    <div class="panel-body">
                        <br />
                        <form action="" method="post" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="title" class="col-md-1 control-label">标题：</label>
                                <div class="col-md-10">
                                    <input type="text" id="title" name="title" class="form-control" placeholder="请编辑标题" />
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <label for="content" class="col-md-1 control-label">内容：</label>
                                <div class="col-md-10">
                                    <textarea class="form-control" id="content" name="content" rows="18"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-10 col-md-offset-1">
                                    <button type="reset" class="btn btn-default">重置</button>
                                    <button type="submit" class="btn btn-default">提交</button>
                                </div>
                            </div>
                        </form>
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