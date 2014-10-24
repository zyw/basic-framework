<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/24
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../fragment/header.jsp"/>
<div class="row">
    <div class="col-lg-12">
        <!--breadcrumbs start -->
        <ul class="breadcrumb">
            <li><a href="<c:url value="/"/>"><i class="fa fa-home"></i> 首页</a></li>
            <li>系统管理</li>
            <li><a href="<c:url value="/user/list"/>">用户管理</a></li>
            <li class="active">用户编辑</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                用户编辑
            </header>
            <div class="panel-body">
                <div class="form">
                    <form action="<c:url value="/user/edit"/>" method="post" id="userForm" class="cmxform form-horizontal tasi-form" enctype="multipart/form-data">
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="uname">用户名</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="id" id="id" value="">
                                <input type="text" name="name" id="uname" value="" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="loginname">登录名</label>
                            <div class="col-lg-10">
                                <input type="text" name="loginname" id="loginname" class="form-control" placeholder="登录名" value="" required>
                                <span class="help-block">请使用英文字母、数字和特殊符合。</span>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="password">密码</label>
                            <div class="col-lg-10">
                                <input type="password" name="password" id="password" class="form-control" placeholder='密码' value="" required>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="email">Email</label>
                            <div class="col-lg-10">
                                <input type="email" name="email" id="email" class="form-control" placeholder="邮箱" value="" required>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2">性别</label>
                            <div class="col-lg-10">
                                <label class="checkbox-inline" style="padding-left:0;">
                                    <input type="radio" name="sex" value="1" id="sex1" checked>
                                    <label for="available1">男</label>
                                    <input type="radio" name="sex" value="0" id="sex0">
                                    <label for="available0">女</label>
                                </label>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="mobilephone">手机</label>
                            <div class="col-lg-10">
                                <input type="text" name="mobilephone" id="mobilephone" class="form-control" placeholder="手机" value="">
                                <span class="help-block">对资源进行排序，越小越靠前。</span>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2">状态</label>
                            <div class="col-lg-10">
                                <label class="checkbox-inline" style="padding-left:0;">
                                    <input type="radio" name="available" value="1" id="available1" checked>
                                    <label for="available1">可用</label>
                                    <input type="radio" name="available" value="0" id="available0">
                                    <label for="available0">禁用</label>
                                </label>

                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2">头像</label>
                            <div class="col-lg-10">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                        <img data-src="holder.js/100%x100%/vine/text:选择图片" alt="选择图片"/>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                                    <div>
                                        <span class="btn btn-white btn-file">
                                            <span class="fileinput-new">选择图片</span>
                                            <span class="fileinput-exists">重新选择</span>
                                            <input type="file" name="file">
                                        </span>
                                        <a href="javascript:;" class="btn btn-white fileinput-exists" data-dismiss="fileinput">删除</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="addRole">授权</label>
                            <div class="col-lg-10">
                                <select id='addRole' name="roleIds" multiple='multiple'>
                                    <c:forEach var="role" items="${roles}">
                                        <option value='${role.id}' <c:if test="${role.isSelected eq '1'}">selected</c:if>>${role.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-check-circle"></i>
                                    保&nbsp;存
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<c:import url="../fragment/footer.jsp"/>
<script type="text/javascript">
    $(function(){
        v5Util.activeNav("systemManager","用户管理");
        $('#addRole').multiSelect();
        $("#userForm").validate({
            rules: {
                sortNum: {
                    number: true
                }
            },
            submitHandler:function(form){
                $(form).ajaxSubmit({
                    dataType:'json',
                    type:"POST",
                    success:function(responseText,statusText,xhr,element){
                        if(responseText.status === '1'){
                            toastr.success(responseText.message);
                            setTimeout(function(){
                                location.href="<c:url value="/user/list"/>";
                            },1000);
                            return;
                        }else if(responseText.status === '-1'){
                            toastr.warning(responseText.message);
                            return;
                        }
                        toastr.error(responseText.message);
                    },
                    error:function(xhr, status, error){
                        toastr.error("错误代码："+status+" 错误消息："+error);
                    }
                })
            }
        });
    })
</script>
