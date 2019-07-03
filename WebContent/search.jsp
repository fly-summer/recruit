<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>搜索结果</title>
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
						<div class="panel-heading">搜索</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12 col-xs-12 text-center">
									<form role="form" id="selectSelective" method="GET" onsubmit="return a()">
										<div class="row">
											<div class="form-group">
												<div class="input-group col-md-6 col-md-offset-3">
													<!--  <input type="text" class="form-control" placeholder="Search for...">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="submit">Go!</button>
                                                    </span>-->
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-horizontal">
												<div class="form-group">
													<label for="posi" class="control-label col-md-1 col-xs-4">职位：</label>
													<div class="col-md-2 col-xs-7">
														<select class="form-control " id="posi" name="position">
															<option>不限</option>
															<option>java工程师</option>
															<option>前端UI</option>
														</select>
													</div>
													<label for="number" class="control-label col-md-2 col-xs-4">招聘人数：</label>
													<div class="col-md-2 col-xs-7">
														<select class="form-control" id="number" name="number">
															<option value="0">不限</option>
															<option value="1">1~10人</option>
															<option value="10">10~20人</option>
															<option value="20">20~30人</option>
															<option value="30">30~40人</option>
															<option value="40">40~50人</option>
															<option value="50">50~60人</option>
															<option value="60">60~70人</option>
															<option value="70">70~80人</option>
															<option value="80">80~90人</option>
															<option value="90">90~100人</option>
															<option value="100">100人以上</option>
														</select>
													</div>
													<label for="graduate" class="control-label col-md-1 col-xs-4">学历：</label>
													<div class="col-md-2 col-xs-7">
														<select class="form-control" id="graduate" name="degree">
															<option value="不限">不限</option>
															<option value="大专">大专</option>
															<option value="本科">本科</option>
															<option value="硕士">硕士</option>
															<option value="博士">博士</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 col-xs-12">
												<div class="form-inline">
													<div class="form-group">
														<label for="star" class="control-label">最低薪资:</label> <select class="form-control" id="star" name="start">
															<option>50</option>
															<option>1000</option>
															<option>2000</option>
															<option>3000</option>
															<option>4000</option>
															<option>5000</option>
															<option>6000</option>
															<option>7000</option>
															<option>8000</option>
															<option>9000</option>
															<option>10000</option>
														</select>
													</div>
													<div class="form-group">
														<label for="end" class="control-label">最高薪资:</label> <select class="form-control" id="end" name="end">
															<option value="0">不限</option>
															<option>100000</option>
															<option>9000</option>
															<option>8000</option>
															<option>7000</option>
															<option>6000</option>
															<option>5000</option>
															<option>4000</option>
															<option>3000</option>
															<option>2000</option>
															<option>1000</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6 col-xs-12">
												<div class="form-inline">
													<div class="form-group">
														<label for="city" class="control-label">城市:</label> <input type="text" class="form-control" id="city"
														 name="" address>
													</div>
													<div class="form-group">
														<button type="reset" class="btn btn-default">重置</button>
														<button type="submit" class="btn btn-default">提交</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<table id="table"></table>
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
	<script src="${pageContext.request.contextPath}/static/js/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap-table-zh-CN.min.js"></script>

	<script type="text/javascript">
		//初始化bootstrap-table的内容
		var $table = $('#table');
		//记录页面bootstrap-table全局变量$table，方便应用
		$(function () {
			var queryUrl = '/recruit/selectiveRecruit.do'
			$table.bootstrapTable({
				url: queryUrl, //请求后台的URL（*）
				method: 'POST', //请求方式（*）
				contentType : "application/x-www-form-urlencoded",
				// toolbar: '#toolbar', //工具按钮用哪个容器
				striped: true, //是否显示行间隔色
				cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination: true, //是否显示分页（*）
				sortable: true, //是否启用排序
				sortOrder: "asc", //排序方式
				sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
				pageNumber: 1, //初始化加载第一页，默认第一页,并记录
				pageSize: 8, //每页的记录行数（*）
				pageList: [10, 25, 50], //可供选择的每页的行数（*）
				search: false, //是否显示表格搜索
				strictSearch: true, //是否开启模糊搜索
				showColumns: true, //是否显示所有的列（选择显示的列）
				showRefresh: true, //是否显示刷新按钮
				minimumCountColumns: 2, //最少允许的列数
				clickToSelect: true, //是否启用点击选中行
				//height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
				uniqueId: "ID", //每一行的唯一标识，一般为主键列
				showToggle: true, //是否显示详细视图和列表视图的切换按钮
				cardView: false, //是否显示详细视图
				detailView: false, //是否显示父子表
				//得到查询的参数
				queryParams: function (params) {
					//这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
					var temp = {
						pageNumber: 1,
						pageSize: 8,
						//searchText:		,
						//sortName : params.sort, //排序列名  
						//sortOrder : params.order, //排位命令（desc，asc） 

						position: $("#posi").val(),
						number: $("#number").val(),
						degree: $("#graduate").val(),
						start: $("#star").val(),
						end: $("#end").val(),
						address: $("#city").val()
					};
					return temp;
				},
				columns: [{
					checkbox: true,
					visible: true
					//是否显示复选框  
				}, {
					field: 'id',
					title: 'ID',
					sortable: true
				}, {
					field: 'cname',
					title: '公司名称',
					sortable: true
				}, {
					field: 'position',
					title: '所需职位',
					sortable: true
				}, {
					field: 'salsry',
					title: '就业薪资',
					sortable: true,
					//formatter: emailFormatter
				}, {
					field: 'number',
					title: '招聘人数',
					sortable: true
					//formatter: linkFormatter
				}, {
					field: 'degree',
					title: '学历要求'
				}, {
					field: 'address',
					title: '工作地点'
				}, {
					field: 'recruittime',
					title: '发布时间',
					sortable: true
					//formatter: dateFormatter
				}, {
					field: 'ID',
					title: '操作',
					width: 120,
					align: 'center',
					valign: 'middle',
					formatter: actionFormatter
				}],
				onLoadSuccess: function () {
				},
				onLoadError: function () {
					showTips("数据加载失败！");
				},
				onDblClickRow: function (row, $element) {
					var id = row.ID;
					EditViewById(id, 'view');
				}
			});
		}
		);

		//刷新table
		function a() {
			$("#table").bootstrapTable('refresh', { url: '/recruit/selectiveRecruit.do' });
			return false;
		};
		//操作栏的格式化
		function actionFormatter(value, row, index) {
			var id = value;
			var result = "";
			result += "<a href='goRecruitDetail?rid=" + row.id + "'class='btn btn-xs green'  view='view')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
			result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditViewById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
			result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteByIds()\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
			return result;
		}

		//实现删除数据的方法
		function DeleteByIds() {
			var ids = '';
			var rows = $table.bootstrapTable('getSelections');
			if (rows.length == 0) {
				alert('请选择行');
				return;
			}
			for (var i = 0; i < rows.length; i++) {
				ids += rows[i].id + ',';
			}
			$.ajax({
				url: '/recruit/deleteManyRecruit.do',
				dataType: 'text',
				type: 'post',
				data: {
					arr: ids
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("删除失败");
				},
				success: function (msg) {
					if (msg == 'success') {
						alert("删除成功");
						$("#table").bootstrapTable('refresh', { url: '/recruit/selectiveRecruit.do' });
					} else {
						alert("删除失败");
					}
				}
			});
		}
	</script>
</body>

</html>