<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>发布招聘信息</title>
	<%@include file="/publicLink.jsp"%>
</head>

<body>
	<div class="container-fluid">
		<%@include file="/template.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">招聘信息</div>
						<div class="panel-body">

							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<h3>${name}</h3>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<label for="position">&nbsp;&nbsp;&nbsp;职&nbsp;&nbsp;&nbsp;位&nbsp;：</label> <span id="position">${position}</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<label for="salary">&nbsp;&nbsp;&nbsp;薪&nbsp;&nbsp;&nbsp;水&nbsp;：</label> <span id="salary">${salsry}</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<label for="number">招聘人数：</label> <span id="number">${number}</span>
								</div>
							</div>

							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<label for="degree">要求学历：</label> <span id="degree">${degree}</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<label for="address">工作地址：</label>
									<span id="address">${address}</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<label>详细信息：</label>
									<!-- <span id="detail">${recruit.inf}</span> -->
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<textarea class="form-control" id="inf" rows="8">${inf}</textarea>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-10 col-md-offset-1">
									<form role="form" onsubmit="return addRequest()">
										<div class="form-group">
											<button class="btn btn-default" type="submit">&nbsp;申请&nbsp;</button>
										</div>
									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1 small">
									<label>发布时间：</label>
									<span id="detail">${recruittime}</span>
								</div>
							</div>
							<br>
							<!-- <form class="" id="form" role="form" method="POST" onSubmit="return checkForm()">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="position" class="control-label col-md-3 col-xs-3">职位：</label>
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="position">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="salary" class="control-label col-md-3 col-xs-3">薪水：</label>
                                                <div class=" col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="salary">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="number" class="control-label col-md-3 col-xs-3">招聘人数：</label>
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="number">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="address" class="control-label col-md-3 col-xs-3">地址：</label>
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="address">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="degree" class="control-label col-md-3 col-xs-3">学历：</label>
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="degree">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inf" class="control-label col-xs-3" style="width:12.5%">其他信息：</label>
                                                <div class="col-md-10">
                                                        <textarea class="form-control" id="inf" rows="8"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <div class="col-md-4 col-md-offset-3">
                                                    <button type="reset" class="btn btn-default">重置</button>
                                                    <button type="submit" class="btn btn-default">提交</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form> -->
						</div>
					</div>
				</div>
			</div>
			<%@include file="/foot.jsp"%>
		</div>
	</div>

	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="/recruit/static/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="/recruit/static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function addRequest() {
			alert('rid=${rid }&cname=${cname}');
			$.ajax({
				url: '/recruit/addRequest',
				dataType: 'text',
				type: 'post',
				data: 'rid=${rid }&cname=${cname}',
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("申请失败");
				},
				success: function (msg) {
					if (msg == 'success') {
						alert("申请成功");
					} else {
						alert("申请失败");
					}
				}
			});
			return false;
		}
	</script>
</body>

</html>