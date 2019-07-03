<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>资讯</title>
    <%@include file="/publicLink.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-table.min.css">
</head>

<body>
    <div class="container-fluid">
        <%@include file="/template.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">News</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 col-xs-12">
                                    <form action="#" role="search" id="form">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search for...">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button">&nbsp;&nbsp;Go!&nbsp;&nbsp;</button>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row"><table id="table"></table></div>
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
    <script src="${pageContext.request.contextPath}/static/js/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
        var $table = $('#table');
        var URL = 'getNewsList.do';
        $table.bootstrapTable({
            url: URL, //请求后台的URL（*）
            method: 'POST', //请求方式（*）
            striped: false, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1, //初始化加载第一页，默认第一页,并记录
            pageSize: 10, //每页的记录行数（*）
            pageList: [10, 25, 50], //可供选择的每页的行数（*）
            search: false, //是否显示表格搜索
            strictSearch: true,
            showColumns: false, //是否显示所有的列（选择显示的列）
            showRefresh: true, //是否显示刷新按钮
            minimumCountColumns: 1, //最少允许的列数
            clickToSelect: true, //是否启用点击选中行
            uniqueId: "id", //每一行的唯一标识，一般为主键列
            showToggle: false, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            columns: [{
                field: 'id',
                title: '新闻列表',
                visible: false
            }, {
                field: 'title',
                title: '新闻列表',
                sortable: true,
                formatter: function (value, row, index) {
                    return '<a href="getNewsById.do?rowId=' + row.id + '" style="color: #000000;">' + row.title + '</a>&nbsp;&nbsp;<span class="small text-muted">' + row.newstime + '</span>';
                }
            }]
        });
    </script>
</body>

</html>