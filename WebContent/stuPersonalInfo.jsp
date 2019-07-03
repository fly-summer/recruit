<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>用户注册</title>
	<%@include file="/publicLink.jsp"%>
	<link href="/recruit/static/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
</head>

<body>
	<div class="container-fluid">
			<%@include file="/template.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">用户注册</div>
						<div class="panel-body">
							<form class="form-horizontal" action="updateStudentInfo" id="form"  role="form" method="POST" onSubmit="return checkForm()">
								<div class="form-group">
									<label for="userName" class="control-label col-md-2">账户：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="userName" name="sname" value="${sessionScope.user.username } " readonly="readonly">
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">4到16位字母，数字，下划线，减号</span>
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="control-label col-md-2">密码：</label>
									<div class="col-md-4 has-feedback">
										<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" onChange="checkPasswd()" onBlur="checkPasswd()">
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">最少6位，必须包含字母和数字</span>
									</div>
								</div>
								<div class="form-group">
									<label for="password2" class="control-label col-md-2">重复密码：</label>
									<div class="col-md-4 has-feedback">
										<input type="password" class="form-control" id="password2" placeholder="请再次输入密码" onChange="checkpwd2()"
										 onBlur="checkpwd2()"> <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">再次输入密码</span>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="control-label col-md-2">姓名：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="name" placeholder="请输入姓名" name="name" value="${student.name }" onChange="checkName()" onBlur="checkName()">
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">姓名只能由汉字、英文构成</span>
									</div>
								</div>

								<div class="form-group">
									<label for="birth" class="control-label col-md-2">出生日期：</label>
									<div class="col-md-4">
										<div class="input-group date">
											<input type="text" class="form-control" id="birth" name="birth" value="${student.birth }" placeholder="请输入出生日期" onChange="checkBirth()" onBlur="checkBirth()">
											<span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
										</div>
									</div>
									<div class="col-md-5">
										<span class="help-block small">日期格式：yyyy-mm-dd</span>
									</div>
								</div>
								<div class="form-group">
									<label for="sex" class="control-label col-md-2">性别：</label>
									<div class="col-md-4">
										<div class="input-group">
											<select class="form-control" id="sex" name="sex" value="${student.sex }">
												<option>男</option>
												<option>女</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="tel" class="control-label col-md-2">手机：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="tel" name="tel" value="${student.tel }" placeholder="请输入手机或电话号码" onChange="checkTel()" onBlur="checkTel()">
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">仅限于国内手机、电话号码</span>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="control-label col-md-2">电子邮箱：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="email" name="email" value="${student.email }" onChange="checkEmail()" placeholder="请输入邮箱地址" onBlur="checkEmail()">
										<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">邮箱格式：example@example.com</span>
									</div>
								</div>
								<div class="form-group">
									<label for="degree" class="control-label col-md-2">学历：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="degree" name="degree" value="${student.degree }" placeholder="请输入填写最高学历"> <span class="glyphicon form-control-feedback"
										 aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="position" class="control-label col-md-2">求职意向：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="position" name="position" value="${student.position }" placeholder="请输入求职意向"> <span class="glyphicon form-control-feedback"
										 aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small">填写具体的职位</span>
									</div>
								</div>
								<div class="form-group">
									<label for="status" class="control-label col-md-2">任职状况：</label>
									<div class="col-md-4 has-feedback">
										<input type="text" class="form-control" id="status" name="status" value="${student.status }" placeholder="请输入填写具体职位"> <span class="glyphicon form-control-feedback"
										 aria-hidden="true"></span>
									</div>
									<div class="col-md-5">
										<span class="help-block small"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="experience" class="control-label col-md-2">简历：</label>
									<div class="col-md-8">
										<textarea class="form-control" id="experience" name="experience"  rows="6"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="control-label col-md-2"></label>
									<div class="col-md-4">
										<button type="reset" class="btn btn-default">重置</button>
										<button type="submit" class="btn btn-default">提交</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<%@include file="/foot.jsp"%>
		</div>
	</div>
	<script type="text/javascript">
		var detail='${student.experience}';
		var ta = document.getElementById("experience");
		ta.value = detail;
	</script>
	<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
	<script src="/recruit/static/js/jquery.min.js"></script>
	<!-- 包括所有已编译的插件 -->
	<script src="/recruit/static/js/bootstrap.min.js"></script>
	<script src="/recruit/static/js/bootstrap-datepicker.min.js"></script>
	<script src="/recruit/static/js/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript">
		$('.input-group.date').datepicker({
			format: "yyyy-mm-dd",
			startDate: "1900-01-01",
			endDate: "2900-01-01",
			language: "zh-CN",
			autoclose: true
		});

		function checkPasswd() {
			var $passwd = $('#password');
			var $parent = $passwd.parent();
			$parent.removeClass('has-success has-error');
			$passwd.next().removeClass('glyphicon-ok glyphicon-remove');
			var passwd = $passwd.val();
			if (passwd == "" || (passwd != "" && !/^.*(?=.{6,})(?=.*\d)(?=.*[A-Za-z]).*$/.test(passwd))) {
				$parent.addClass('has-error');
				$parent.find('span').addClass('glyphicon-remove');
				return false;
			}
			else {
				$parent.addClass('has-success');
				$parent.find('span').addClass('glyphicon-ok');
				return true;
			}
		}

		function checkpwd2() {
			var $pwd = $('#password2');
			var $parent = $pwd.parent();
			var pwd = $pwd.val();
			var passwd = $('#password').val();
			$parent.removeClass('has-success has-error');
			$pwd.next().removeClass('glyphicon-ok glyphicon-remove');

			if (pwd == "" || (pwd != "" && pwd != passwd)) {
				$parent.addClass('has-error');
				$parent.find('span').addClass('glyphicon-remove');
				return false;
			}
			else {
				$parent.addClass('has-success');
				$parent.find('span').addClass('glyphicon-ok');
				return true;
			}
		}

		function checkName() {
			var $name = $('#name');
			var name = $name.val();
			var $parent = $name.parent();
			$parent.removeClass('has-success has-error');
			$name.next().removeClass('glyphicon-ok glyphicon-remove');
			if (name == "" || (name != "" && !/^[a-zA-Z\u4e00-\u9fa5·\s ]{2,20}$/.test(name))) {
				$parent.addClass('has-error');
				$parent.find('span').addClass('glyphicon-remove');
				return false;
			}
			else {
				$parent.addClass('has-success');
				$parent.find('span').addClass('glyphicon-ok');
				return true;
			}
		}

		function checkBirth() {
			var $birth = $('#birth');
			var birth = $birth.val();
			var $parent = $birth.parent();
			$parent.removeClass('has-success has-error');
			// $birth.next().removeClass('glyphicon-ok glyphicon-remove');
			if (birth == "" || (birth != "" && !/(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/.test(birth))) {
				$parent.addClass('has-error');
				return false;
			}
			else {
				$parent.addClass('has-success');
				return true;
			}
		}

		function checkTel() {
			var $tel = $('#tel');
			var tel = $tel.val();
			var $parent = $tel.parent();
			$parent.removeClass('has-success has-error');
			$tel.next().removeClass('glyphicon-ok glyphicon-remove');
			if (tel == "" || (tel != "" && !/(13\d|14[579]|15[^4\D]|17[^49\D]|18\d)\d{8}/.test(tel))) {
				$parent.addClass('has-error');
				$parent.find('span').addClass('glyphicon-remove');
				return false;
			}
			else {

				$parent.addClass('has-success');
				$parent.find('span').addClass('glyphicon-ok');
				return true;
			}
		}

		function checkEmail() {
			var $email = $('#email');
			var email = $email.val();
			var $parent = $email.parent();
			$parent.removeClass('has-success has-error');
			$email.next().removeClass('glyphicon-ok glyphicon-remove');
			if (email == "" || (email != "" && !/\w+[@]{1}\w+[.]\w+/.test(email))) {
				$parent.addClass('has-error');
				$parent.find('span').addClass('glyphicon-remove');
				return false;
			}
			else {
				$parent.addClass('has-success');
				$parent.find('span').addClass('glyphicon-ok');
				return true;
			}
		}

		function checkForm() {
            var flag = confirm("确认修改信息？");
            if (flag == true) {
			    return checkName() && checkPasswd() && checkpwd2() && checkTel() && checkEmail();
            }
            else{
                return false;
            }
		}


	</script>
</body>

</html>