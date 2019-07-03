<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>企业信息</title>
    <%@include file="/publicLink.jsp"%>
</head>

<body>
    <div class="container-fluid">
        <%@include file="/template.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            企业信息
                        </div>
                        <div class="panel-body">
                            <form action="updateCompanyInfo" class="form-horizontal" id="form" role="form" method="POST"  onsubmit="return checkForm()" > <!-- -->
                                <div class="form-group">
                                    <label for="userName" class="control-label col-md-2">账户：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="text" class="form-control" id="userName" name="cname"  value="${sessionScope.user.username } "readonly="readonly">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                         <span class="help-block small"><!--4到16位字母，数字，下划线，减号--></span> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password1" class="control-label col-md-2">原密码：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="password" class="form-control" id="password1" name="password1" placeholder="请输入密码"
                                            onchange="checkPasswd1()">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                        <span class="help-block small">最少6位，必须包含字母和数字</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="control-label col-md-2">密码：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"
                                            onchange="checkPasswd()" onblur="checkPasswd()">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                        <span class="help-block small">最少6位，必须包含字母和数字</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password2" class="control-label col-md-2">重复密码：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="password" class="form-control" id="password2" placeholder="请再次输入密码"
                                            onchange="checkpwd2()" onblur="checkpwd2()">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                        <span class="help-block small">再次输入密码</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="control-label col-md-2">公司名称：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="text" class="form-control" id="name" name="name" value="${company.name }" placeholder="请输入公司名称"
                                            onchange="checkName()" onblur="checkName()">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                        <span class="help-block small">只能由汉字、英文构成</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="tel" class="control-label col-md-2">手机：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="text" class="form-control" id="tel"  name="tel" value="${company.tel }"   placeholder="请输入手机或电话号码"
                                            onchange="checkTel()" onblur="checkTel()">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                        <span class="help-block small">仅限于国内手机、电话号码</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="address" class="control-label col-md-2">地址：</label>
                                    <div class="col-md-4 has-feedback">
                                        <input type="text" class="form-control" id="address" name="address" value="${company.address }"  placeholder="请输入公司地址">
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-5">
                                        <span class="help-block small"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="detailInfo" class="control-label col-md-2">详细信息：</label>
                                    <div class="col-md-8">
                                        <textarea class="form-control" id="detailInfo" name="detail" value="${company.detail }"  rows="6"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label col-md-2"></label>
                                    <div class="col-md-4">
                                        <button type="reset" class="btn btn-default">重置</button>
                                        <button type="submit" class="btn btn-default">修改</button>
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
		var detail='${company.detail}';
		var ta = document.getElementById("detailInfo");
		ta.value = detail;
	</script>
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <!-- 包括所有已编译的插件 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
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

        function checkForm() {
            var flag = confirm("确认修改信息？");
            if (flag == true) {
                return checkPasswd() &&checkPasswd1()&& checkpwd2() && checkName() && checkTel();
            }
            else {
                return false;
            }

        }
        
        function checkPasswd1(){
        	var $passwd = $('#password1');
            var $parent = $passwd.parent();
            $parent.removeClass('has-success has-error');
            $passwd.next().removeClass('glyphicon-ok glyphicon-remove');
            var passwd = $passwd.val();
            $.ajax({
            	url : '/recruit/checkCompanyPasswd',
				dataType : 'text',
				type : 'POST',
				data : $("form").serialize(),
				error : function(XMLHttpRequest, textStatus, errorThrown) {
				},
				success : function(msg){
					msg = msg.replace(/rn/g, '');
			
					if(msg == "1"){
						$parent.addClass('has-error');
		                $parent.find('span').addClass('glyphicon-remove');
		                return false;
					}else if(msg == "0"){
						$parent.addClass('has-success');
		                $parent.find('span').addClass('glyphicon-ok');
		                return true;
					}
				}
            });
        }
    </script>
</body>

</html>