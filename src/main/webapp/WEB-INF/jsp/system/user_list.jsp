<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/23
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../fragment/header.jsp"/>
<div class="row">
    <div class="col-lg-12">
        <!--breadcrumbs start -->
        <ul class="breadcrumb">
            <li><a href="<c:url value="/"/>"><i class="fa fa-home"></i> 首页</a></li>
            <li>系统管理</li>
            <li class="active">用户管理</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                用户列表
                <span class="tools pull-right">
                    <shiro:hasPermission name="usr:create">
                        <button id="editUser" class="btn btn-success v5-panel-header-tool" type="button"
                                data-toggle="tooltip" data-placement="top" title="添加用户">
                            <i class="fa fa-plus"></i>
                            添&nbsp;加
                        </button>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="user:delete">
                        <button id="batchUserDelete" class="btn btn-warning v5-panel-header-tool" type="button"
                                data-toggle="tooltip" data-placement="top" title="批量删除">
                            <i class="fa fa-times-circle"></i>
                            批量删除
                        </button>
                    </shiro:hasPermission>
                </span>
            </header>
            <div class="panel-body">
                <div class="col-lg-5 col-lg-offset-7">
                    <form id="userSearchForm" class="form-horizontal" method="post" action="<c:url value="/user/list/1"/>" role="form">
                        <div class="form-group">
                            <label for="userSearch" class="col-lg-2 col-sm-6 control-label" style="text-align: right;padding-right: 0px;">查询：</label>
                            <div class="col-lg-10 col-sm-6" style="padding-right: 0;">
                                <div class="iconic-input right">
                                    <i class="fa fa-times" style="color:#000;font-size: 18px;display: none;" id="deleteSearchTxt"></i>
                                    <input type="text" class="form-control" id="userSearch" name="name" placeholder="查询" value="${searchTxt}">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <table class="table table-striped table-bordered table-advance table-hover">
                    <colgroup>
                        <col class="col-xs-1 v5-col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-2">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="v5-td-center">
                            <input type="checkbox" id="batchChecked"/>
                        </th>
                        <th><i class="fa fa-meh-o"></i> 头像</th>
                        <th><i class="fa fa-bullhorn"></i> 名称</th>
                        <th><i class="fa fa-rocket"></i> 登录名</th>
                        <th><i class="fa fa-envelope"></i> Email</th>
                        <th><i class="fa fa-female"></i> 性别</th>
                        <th><i class="fa fa-mobile-phone"></i> 电话</th>
                        <th><i class="fa fa-bookmark"></i> 登录次数</th>
                        <th><i class="fa fa-calendar"></i> 登录时间</th>
                        <th><i class="fa fa-edit"></i> 状态</th>
                        <th><i class="fa fa-gear"></i> 操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td class="v5-td-center">
                                <input type="checkbox" class="batch-checked-item" value="${user.id}"/>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty user.originalPic or user.originalPic eq 'avatar0.jpg' or user.originalPic eq 'avatar1.jpg'}">
                                        <img src="<c:url value="/r/images/avatar/${empty user.originalPic ? 'avatar1.jpg': user.originalPic}"/>"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img width="19" height="19" src="<c:url value="/r/avatar/${empty user.originalPic ? 'avatar1.jpg': user.originalPic}"/>"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.name}</td>
                            <td>${user.loginname}</td>
                            <td>${user.email}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.sex eq 1}">
                                        <span class="label label-primary">男</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="label label-info">女</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.mobilephone}</td>
                            <td>${user.loginCount}</td>
                            <td><fmt:formatDate value="${user.lastLoginTime}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.available eq 1}">
                                        <span class="badge bg-success">可用</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-important">禁用</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <shiro:hasPermission name="user:update">
                                    <a href="<c:url value="/user/edit/${user.id}"/>" data-toggle="tooltip" data-placement="top"
                                       title="修改" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="user:delete">
                                    <a href="javascript:;" data-userid="${user.id}" data-toggle="tooltip" data-placement="top"
                                       title="删除" class="btn btn-danger btn-xs delete-user"><i class="fa fa-trash-o "></i></a>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="user:pwd:update">
                                    <a href="javascript:;" data-userid="${user.id}" class="btn btn-success btn-xs update-pwd-user" data-toggle="tooltip" data-placement="top"
                                       title="修改密码"><i class="fa fa-edit"></i></a>
                                </shiro:hasPermission>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                ${pagination}
            </div>
        </section>
    </div>
</div>
<div class="modal fade" id="deleteUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                您确定要删除用户数据吗？
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                <button class="btn btn-success" id="enterDeleteUser" type="button">确定</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="updateUserPwdModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form action="<c:url value="/user/update/pwd"/>" method="post" id="updateUserPwdForm" class="cmxform form-horizontal tasi-form" enctype="multipart/form-data">
                    <div class="form-group ">
                        <label class="control-label col-lg-2" for="password">用户名</label>
                        <div class="col-lg-10">
                            <input type="password" name="password" id="password" class="form-control" placeholder="新密码" required>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label class="control-label col-lg-2" for="affirmPassword">登录名</label>
                        <div class="col-lg-10">
                            <input type="password" class="form-control" id="affirmPassword" name="affirmPassword" placeholder="确认密码" required>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                <button class="btn btn-success" id="enterUpdateUserPwd" type="button">保存</button>
            </div>
        </div>
    </div>
</div>
<c:import url="../fragment/footer.jsp"/>
<script type="text/javascript">
    $(function(){
        function deleteUserFun(userIds){
            $.ajax({
                url:"<c:url value="/user/delete"/>",
                type:"POST",
                data:{userIds:userIds},
                dataType:'json',
                success:function(data,textStatus,jqXHR){
                    if(data.status){
                        toastr.success(data.message);
                        setTimeout(function(){
                            location.reload();
                        },1000);
                        return;
                    }
                    toastr.error(data.message);
                },
                error:function(jqXHR,textStatus,errorThrown){
                    toastr.error("出错了："+errorThrown+" : "+textStatus);
                }
            });
        }
        v5Util.activeNav("systemManager","用户管理");

        $("#editUser").click(function(){
            location.href="<c:url value="/user/edit/0"/>";
        });
        v5Util.searchOpt('userSearchForm','userSearch','deleteSearchTxt');

        <%--//待删除的用户ID--%>
        var userIds = "";
        $(".delete-user").click(function(){
            userIds = $(this).data("userid");
            $('#deleteUserModel').modal('show');
        });
        $("#enterDeleteUser").click(function(){
            $('#deleteUserModel').modal('hide');
            if(userIds !== ""){
                deleteUserFun(userIds);
            }
            userIds = "";
        });
        $("#batchUserDelete").click(function(){
            var $chs = $(".batch-checked-item:checked");
            if($chs.length == 0){
                toastr.warning("您没有选中要删除的数据！");
                return;
            }
            var advIds = [];
            for(var i=0;i<$chs.length;i++){
                var v = $($chs[i]).val();
                if(v == "on") continue;
                advIds.push(v);
            }
            userIds = advIds.join(",");
            $('#deleteUserModel').modal('show');
        });
        var userId = "";
        $(".update-pwd-user").click(function(){
            userId = $(this).data('userid');
            $('#updateUserPwdModel').modal('show');
        });
        $("#enterUpdateUserPwd").click(function(){
            $("#updateUserPwdForm").submit();
        });
        $("#updateUserPwdForm").validate({
            submitHandler:function(form){
                $(form).ajaxSubmit({
                    dataType:'json',
                    data:{userId:userId},
                    type:"POST",
                    success:function(responseText,statusText,xhr,element){
                        $('#updateUserPwdModel').modal('hide');
                        if(responseText.status === '1'){
                            toastr.success(responseText.message);
                            setTimeout(function(){
                                location.href="<c:url value="/user/list/1"/>";
                            },1000);
                            return;
                        }else if(responseText.status === '-1'){
                            toastr.warning(responseText.message);
                            return;
                        }
                        toastr.error(responseText.message);
                    },
                    error:function(xhr, status, error){
                        $('#updateUserPwdModel').modal('hide');
                        toastr.error("错误代码："+status+" 错误消息："+error);
                    }
                })
            }
        });
    })
</script>