<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/13
  Time: 14:05
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
            <li class="active">资源管理</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                资源列表
                <span class="tools pull-right">
                    <shiro:hasPermission name="res:create">
                        <button id="editRes" class="btn btn-success v5-panel-header-tool" type="button"
                                data-toggle="tooltip" data-placement="top" title="添加一级资源">
                            <i class="fa fa-plus"></i>
                            添&nbsp;加
                        </button>
                    </shiro:hasPermission>
                </span>
            </header>
            <div class="panel-body">
                <table id="example-basic" class="table-striped table-advance table-hover">
                    <thead>
                    <tr>
                        <th>名称</th>
                        <th>类型</th>
                        <th>URL</th>
                        <th>权限字符串</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${reses}" var="res">
                            <tr data-tt-id="${res.id }" <c:if test="${res.pid ne 0 }">data-tt-parent-id="${res.pid }"</c:if>>
                                <td>${res.name}</td>
                                <td>${res.type==1?"菜单":"按钮"}</td>
                                <td>${res.url}</td>
                                <td>${res.permission}</td>
                                <td>
                                    <c:if test="${res.available eq 1}">
                                        <span class="badge bg-success">可用</span>
                                    </c:if>
                                    <c:if test="${res.available eq 0}">
                                        <span class="badge bg-important">禁用</span>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${res.type ne 2}">
                                        <shiro:hasPermission name="res:create">
                                            <a href="<c:url value="/res/edit/"/>${res.id}" data-toggle="tooltip"
                                               data-placement="top" title="添加子资源" class="btn btn-success btn-xs">
                                                <i class="fa fa-check"></i>
                                            </a>
                                        </shiro:hasPermission>
                                    </c:if>
                                    <shiro:hasPermission name="res:update">
                                        <a href="<c:url value="/res/edit/${res.id}/update"/>" class="btn btn-primary btn-xs"
                                           data-toggle="tooltip" data-placement="top" title="修改资源">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </shiro:hasPermission>
                                    <shiro:hasPermission name="res:delete">
                                        <a href="javascript:;" data-resid="${res.id}" class="btn btn-danger btn-xs delete-res"
                                           data-toggle="tooltip" data-placement="top" title="删除资源">
                                            <i class="fa fa-trash-o "></i>
                                        </a>
                                    </shiro:hasPermission>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>
<div class="modal fade" id="deleteResModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                您确定要删除资源数据吗？
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                <button class="btn btn-success" id="enterDeleteRes" type="button">确定</button>
            </div>
        </div>
    </div>
</div>
<c:import url="../fragment/footer.jsp"/>
<script type="text/javascript">
    $(function(){

        v5Util.activeNav("systemManager","资源管理");

        $("#example-basic").treetable({ expandable: true,initialState:'expanded' });
        $("#editRes").click(function(){
            location.href="<c:url value="/res/edit/0"/>";
        });
        var resId = "";
        $(".delete-res").click(function(){
            resId = $(this).data("resid");
            $('#deleteResModel').modal('show');
        });
        $("#enterDeleteRes").click(function(){
            $('#deleteResModel').modal('hide');
            if(resId !== ""){
                $.ajax({
                    url:"<c:url value="/res/delete"/>",
                    type:"POST",
                    data:{resId:resId},
                    dataType:'json',
                    success:function(data,textStatus,jqXHR){
                        if(data.status){
                            toastr.success(data.message);
                            setTimeout(function(){
                                location.reload();
                            },1000);
                            return;
                        }
                        toastr.error(data.message)
                    },
                    error:function(jqXHR,textStatus,errorThrown){
                        toastr.error("出错了："+errorThrown+" : "+textStatus);
                    }
                });
            }
        });
    })
</script>
