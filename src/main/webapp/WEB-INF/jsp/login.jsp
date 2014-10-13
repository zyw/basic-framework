<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/11
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from thevectorlab.net/flatlab/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Oct 2014 05:26:50 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <%--<link rel="shortcut icon" href="img/favicon.html">--%>

    <title>登录</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/r/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/r/css/bootstrap-reset.css"/>" rel="stylesheet">
    <!--external css-->
    <link href="<c:url value="/r/css/font-awesome/css/font-awesome.css"/>" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="<c:url value="/r/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/r/css/style-responsive.css"/>" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="<c:url value='/r/js/html5shiv.js'/>"></script>
    <script src="<c:url value='/r/js/respond.min.js'/>"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" method="post" action="<c:url value="/login"/>">
        <h2 class="form-signin-heading">用户登录</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" name="loginname" value="<shiro:principal/>" placeholder="用户名" autofocus>
            <input type="password" class="form-control" name="password" placeholder="密码">
            <label class="checkbox">
                <input type="checkbox" value="remember-me" name="rememberMe"> 记住密码
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> 忘记密码？</a>

                </span>
            </label>
            <button class="btn btn-lg btn-login btn-block" type="submit">登&nbsp;&nbsp;录</button>
            <p style="color:#ff0000">${error}</p>
            <%--<div class="login-social-link">
                <a href="index.html" class="facebook">
                    <i class="fa fa-facebook"></i>
                    Facebook
                </a>
                <a href="index.html" class="twitter">
                    <i class="fa fa-twitter"></i>
                    Twitter
                </a>
            </div>
            <div class="registration">
                Don't have an account yet?
                <a class="" href="registration.html">
                    Create an account
                </a>
            </div>--%>

        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">忘记密码？</h4>
                    </div>
                    <div class="modal-body">
                        <p>下面输入您的电子邮件地址重新设置您的密码。</p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                        <button class="btn btn-success" type="button">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>



<!-- js placed at the end of the document so the pages load faster -->
<script src="<c:url value='/r/js/jquery.js'/>"></script>
<script src="<c:url value='/r/js/bootstrap.min.js'/>"></script>


</body>

<!-- Mirrored from thevectorlab.net/flatlab/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Oct 2014 05:26:51 GMT -->
</html>

