<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>首页</title>
    <%@include file="/publicLink.jsp"%>
</head>

<body>
    <div class="container-fluid">
        <%@include file="/template.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">资讯<a href="newsList.jsp" style="float: right;">查看更多</a></div>
                        <ul class="list-group" id="newslist"></ul>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">招聘信息<a href="requestList.jsp" style="float: right;">查看更多</a></div>
                        <ul class="list-group" id="requestlist"></ul>
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
    <script type="text/javascript">
        $.ajax({
            url: 'getIndexNewsList.do',
            dataType: 'json',
            type: 'GET',
            success: function (data, textStatus) {
                if (data.length == 0) {
                    $list.append('<li class="list-group-item">暂无数据</li>');
                    return;
                }
                $list = $('#newslist');
                for (var i = 0; i < data.length; i++) {
                    var news = data[i];
                    $list.append('<li class="list-group-item"><a style="color: #000000;" href="getNewsById.do?rowId=' + news.id + '">' + news.title + '</a>&nbsp;&nbsp;<span class="small text-muted">' + news.newstime + '</span></li>');
                }
            }
        });
        $.ajax({
            url: 'recruitIndexList.do',
            dataType: 'json',
            type: 'GET',
            success: function (data, textStatus) {
                if (data.length == 0) {
                    $list.append('<li class="list-group-item">暂无数据</li>');
                    return;
                }
                $list = $('#requestlist');
                var i = 0;
                for (var i = 0; i < data.length; i++) {
                    var rec = data[i];
                    var row = '';
                    if (i < 3) {
                        row = '<li class="list-group-item"><span class="label label-danger small">New</span>&nbsp;&nbsp;<a style="color: #000000;" href="goRecruitDetail.do?rid=' + rec.id + '">' + rec.name + '</a>&nbsp;&nbsp;<span class="small text-muted">' + rec.recruitTime + '</span></li>';
                    }
                    else {
                        row = '<li class="list-group-item"><a style="color: #000000;" href="goRecruitDetail.do?rid=' + rec.id + '">' + rec.name + '</a>&nbsp;&nbsp;<span class="small text-muted">' + rec.recruitTime + '</span></li>';
                    }
                    $list.append(row);
                }
            }
        });
    </script>
</body>

</html>