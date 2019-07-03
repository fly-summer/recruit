<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>申请列表</title>
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
						<div class="panel-heading">Candidate</div>
						<div class="panel-body">
							<div class="row">
								<table class="table" id="table"></table>
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
	<script src="${pageContext.request.contextPath}/static/js/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript">
		/*
		◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◆◆◆◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◆◆◆◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◆◆◆◇◇◇◇◇◇◆◆◆◇◆◆◆◆◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◆◆◆◇◇◇◇◇◇◆◆◆◇◆◆◆◆◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◆◆◆◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◆◆◆◇◇◇◇◇◇◆◆◆◆◆◆◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◆◇◇◆◆◆◆◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◆◆◆◆◆◆◆◇◇◇◇◇◇◇◇◇◇◇◆◆◆◇◇◆◆◆◇◇◇◇◇◇◇◆◆◆◇◆◆◆◇◇◇◇◇◇◇◇◇◆◆◆◇◇◇◇◇◇◇
		◇◇◇◆◆◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◆◆◆◆◆◇◇◇◇◇◇◇◆◆◆◇◆◆◆◆◇◇◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇
		◇◇◇◇◆◆◆◇◇◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◆◆◆◇◇◇◇◇◇◇◇◆◆◆◇◆◆◆◆◇◇◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇
		◇◇◇◇◇◆◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◆◆◆◆◇◇◇◇◇◇◇◇◇◆◆◆◇◇◆◆◆◇◇◇◇◇◇◇◇◆◆◆◆◆◆◆◇◇◇
		◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇◇
		 */
		var url = 'selectRequestByStudent';

		$('#table').bootstrapTable({
			url : url, //请求后台的URL（*）
			method : 'get', //请求方式（*）
			toolbar : '#toolbar', //工具按钮用哪个容器
			striped : false, //是否显示行间隔色
			cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, //是否显示分页（*）
			sortable : false, //是否启用排序
			sortOrder : "asc", //排序方式
			// queryParams: queryParams,//传递参数（*）
			sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, //初始化加载第一页，默认第一页
			pageSize : 10, //每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
			search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			contentType : "application/x-www-form-urlencoded",
			strictSearch : false, //设置为 true启用全匹配搜索，否则为模糊搜索。
			showColumns : false, //是否显示所有的列
			showRefresh : true, //是否显示刷新按钮
			minimumCountColumns : 2, //最少允许的列数
			clickToSelect : true, //是否启用点击选中行
			// height: 700,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "no", //每一行的唯一标识，一般为主键列
			showToggle : false, //是否显示详细视图和列表视图的切换按钮
			cardView : false, //是否显示详细视图
			detailView : false, //是否显示父子表
			columns : [ {
				field : 'id',
				title : 'ID',
				visible : false
			}, {
				field : 'name',
				title : '公司'
			}, {
				field : 'num',
				title : '招收人数'
			}, {
				field : 'salary',
				title : '薪水'
			}, {
				field : 'position',
				title : '申请职位'
			}, {
				field : 'degree',
				title : '学位要求'
			}, {
				field : 'address',
				title : '工作地点'
			}, {
				field : 'options',
				title : '操作',
				formatter : viewDetail
			} ]
		});
		function viewDetail(value, row, index) {
			return [
                '<button type="button" class="btn btn-primary" id="btn-view" onClick="recruit('+row.id+')">点击查看</button>'
            ].join('');
		}
		function recruit(id) {
			window.open('goRecruitDetail?rid='+id);
		}
	</script>
</body>

</html>