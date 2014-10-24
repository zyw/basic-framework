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
                    <button id="editUser" class="btn btn-success v5-panel-header-tool" type="button"
                            data-toggle="tooltip" data-placement="top" title="添加用户">
                        <i class="fa fa-plus"></i>
                        添&nbsp;加
                    </button>
                    <button id="batchUserDelete" class="btn btn-warning v5-panel-header-tool" type="button"
                            data-toggle="tooltip" data-placement="top" title="批量删除">
                        <i class="fa fa-times-circle"></i>
                        批量删除
                    </button>
                </span>
            </header>
            <div class="panel-body">
                <div class="col-lg-5 col-lg-offset-7">
                    <form id="roleSearchForm" class="form-horizontal" method="post" action="<c:url value="/role/list/1"/>" role="form">
                        <div class="form-group">
                            <label for="roleSearch" class="col-lg-2 col-sm-6 control-label" style="text-align: right;padding-right: 0px;">查询：</label>
                            <div class="col-lg-10 col-sm-6" style="padding-right: 0;">
                                <div class="iconic-input right">
                                    <i class="fa fa-times" style="color:#000;font-size: 18px;display: none;" id="deleteSearchTxt"></i>
                                    <input type="text" class="form-control" id="roleSearch" name="name" placeholder="查询" value="${searchTxt}">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <table class="table table-striped table-bordered table-advance table-hover">
                    <colgroup>
                        <col class="col-xs-1 v5-col-xs-1">
                        <col class="col-xs-2">
                        <col class="col-xs-3">
                        <col class="col-xs-1">
                        <col class="col-xs-1">
                        <col class="col-xs-2">
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="v5-td-center">
                            <input type="checkbox" id="batchChecked"/>
                        </th>
                        <th><i class="fa fa-bullhorn"></i> 名称</th>
                        <th class="hidden-phone"><i class="fa fa-question-circle"></i> 描述</th>
                        <th><i class="fa fa-bookmark"></i> 排序</th>
                        <th><i class="fa fa-edit"></i> 状态</th>
                        <th><i class="fa fa-gear"></i> 操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--<c:forEach items="${roles}" var="role">--%>
                        <%--<tr>--%>
                            <%--<td class="v5-td-center">--%>
                                <%--<input type="checkbox" class="batch-checked-item" value="${role.id}"/>--%>
                            <%--</td>--%>
                            <%--<td>${role.name}</td>--%>
                            <%--<td>${role.des}</td>--%>
                            <%--<td>${role.sortNum}</td>--%>
                            <%--<td>--%>
                                <%--<c:if test="${role.available eq 1}">--%>
                                    <%--<span class="badge bg-success">可用</span>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${role.available eq 0}">--%>
                                    <%--<span class="badge bg-important">禁用</span>--%>
                                <%--</c:if>--%>
                            <%--</td>--%>
                            <%--<td>--%>
                                    <%--&lt;%&ndash;<button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>&ndash;%&gt;--%>
                                <%--<a href="<c:url value="/role/edit/${role.id}"/>" data-toggle="tooltip" data-placement="top"--%>
                                   <%--title="修改" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>--%>
                                <%--<a href="javascript:;" data-roleid="${role.id}" data-toggle="tooltip" data-placement="top"--%>
                                   <%--title="删除" class="btn btn-danger btn-xs delete-role"><i class="fa fa-trash-o "></i></a>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                    </tbody>
                </table>
                <%--${pagination}--%>
            </div>
        </section>
    </div>
</div>
<div class="modal fade" id="deleteRoleModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                您确定要删除角色数据吗？
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                <button class="btn btn-success" id="enterDeleteRole" type="button">确定</button>
            </div>
        </div>
    </div>
</div>
<c:import url="../fragment/footer.jsp"/>
<script type="text/javascript">
    $(function(){
        <%--function deleteRoleFun(roleIds){--%>
            <%--$.ajax({--%>
                <%--url:"<c:url value="/role/delete"/>",--%>
                <%--type:"POST",--%>
                <%--data:{roleIds:roleIds},--%>
                <%--dataType:'json',--%>
                <%--success:function(data,textStatus,jqXHR){--%>
                    <%--if(data.status){--%>
                        <%--toastr.success(data.message);--%>
                        <%--setTimeout(function(){--%>
                            <%--location.reload();--%>
                        <%--},1000);--%>
                        <%--return;--%>
                    <%--}--%>
                    <%--toastr.error(data.message);--%>
                <%--},--%>
                <%--error:function(jqXHR,textStatus,errorThrown){--%>
                    <%--toastr.error("出错了："+errorThrown+" : "+textStatus);--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
        <%--v5Util.activeNav("systemManager","角色管理");--%>

        $("#editUser").click(function(){
            location.href="<c:url value="/user/edit/0"/>";
        });
        <%--$("#deleteSearchTxt").click(function(){--%>
            <%--$("#roleSearch").val("");--%>
            <%--$("#roleSearchForm").submit();--%>
            <%--$("#deleteSearchTxt").css("display","none");--%>
        <%--});--%>
        <%--$("#roleSearch").keyup(function(e){--%>
            <%--if(13 === e.keyCode){--%>
                <%--$("#roleSearchForm").submit();--%>
            <%--}else{--%>
                <%--if($.trim($(this).val()) === "")--%>
                    <%--$("#deleteSearchTxt").css("display","none");--%>
                <%--else--%>
                    <%--$("#deleteSearchTxt").css("display","block");--%>
            <%--}--%>
        <%--});--%>

        <%--if($.trim($("#roleSearch").val()) !== "")--%>
            <%--$("#deleteSearchTxt").css("display","block");--%>

        <%--//待删除的角色ID--%>
        <%--var roleIds = "";--%>
        <%--$(".delete-role").click(function(){--%>
            <%--roleIds = $(this).data("roleid");--%>
            <%--$('#deleteRoleModel').modal('show');--%>
        <%--});--%>
        <%--$("#enterDeleteRole").click(function(){--%>
            <%--$('#deleteRoleModel').modal('hide');--%>
            <%--if(roleIds !== ""){--%>
                <%--deleteRoleFun(roleIds);--%>
            <%--}--%>
            <%--roleIds = "";--%>
        <%--});--%>
        <%--$("#batchRoleDelete").click(function(){--%>
            <%--var $chs = $(".batch-checked-item:checked");--%>
            <%--if($chs.length == 0){--%>
                <%--toastr.warning("您没有选中要删除的数据！");--%>
                <%--return;--%>
            <%--}--%>
            <%--var advIds = [];--%>
            <%--for(var i=0;i<$chs.length;i++){--%>
                <%--var v = $($chs[i]).val();--%>
                <%--if(v == "on") continue;--%>
                <%--advIds.push(v);--%>
            <%--}--%>
            <%--roleIds = advIds.join(",");--%>
            <%--$('#deleteRoleModel').modal('show');--%>
        <%--});--%>
    })
</script>