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
                        <div class="panel-heading">招聘发布</div>
                        <div class="panel-body">
                            <form class="" id="form" role="form" action="addRecruit"method="POST">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="position" class="control-label col-md-3 col-xs-3">职位：</label>
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="position" name="position">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="salary" class="control-label col-md-3 col-xs-3">薪水：</label>
                                                <div class=" col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="salary" name="salsry">
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
                                                    <input type="text" class="form-control" id="number" name="number">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="address" class="control-label col-md-3 col-xs-3">地址：</label>
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" class="form-control" id="address" name="address">
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
                                                    <input type="text" class="form-control" id="degree" name="degree">
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
                                                        <textarea class="form-control" id="inf" rows="8" name="inf"></textarea>
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
                            </form>
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

</body>

</html>