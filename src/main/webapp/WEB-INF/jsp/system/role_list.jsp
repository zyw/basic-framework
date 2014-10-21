<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/16
  Time: 15:40
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
            <li class="active">角色管理</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                角色列表
                <span class="tools pull-right">
                    <button id="editRole" class="btn btn-success v5-panel-header-tool" type="button"
                            data-toggle="tooltip" data-placement="top" title="添加角色">
                        <i class="fa fa-plus"></i>
                        添&nbsp;加
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
                    <thead>
                    <tr>
                        <th><i class="fa fa-bullhorn"></i> 名称</th>
                        <th class="hidden-phone"><i class="fa fa-question-circle"></i> 描述</th>
                        <th><i class="fa fa-bookmark"></i> 排序</th>
                        <th><i class="fa fa-edit"></i> 状态</th>
                        <th><i class="fa fa-gear"></i> 操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${roles}" var="role">
                        <tr>
                            <td>${role.name}</td>
                            <td>${role.des}</td>
                            <td>${role.sortNum}</td>
                            <td>
                                <c:if test="${role.available eq 1}">
                                    <span class="badge bg-success">可用</span>
                                </c:if>
                                <c:if test="${role.available eq 0}">
                                    <span class="badge bg-important">禁用</span>
                                </c:if>
                            </td>
                            <td>
                                <%--<button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>--%>
                                <a href="<c:url value="/role/edit/${role.id}"/>" data-toggle="tooltip" data-placement="top"
                                   title="修改" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                <a href="#" data-toggle="tooltip" data-placement="top"
                                   title="删除" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a>
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
        v5Util.activeNav("systemManager","角色管理");

        $("#editRole").click(function(){
            location.href="<c:url value="/role/edit/0"/>";
        });
        $("#deleteSearchTxt").click(function(){
            $("#roleSearch").val("");
            $("#roleSearchForm").submit();
            $("#deleteSearchTxt").css("display","none");
        });
        $("#roleSearch").keyup(function(e){
            if(13 === e.keyCode){
                $("#roleSearchForm").submit();
            }else{
                if($.trim($(this).val()) === "")
                    $("#deleteSearchTxt").css("display","none");
                else
                    $("#deleteSearchTxt").css("display","block");
            }
        });

        if($.trim($("#roleSearch").val()) !== "")
            $("#deleteSearchTxt").css("display","block");

        /*$("#example-basic").treetable({ expandable: true });
        var resId = "";
        $(".delete-res").click(function(){
            resId = $(this).data("resid");
            $('#deleteResModel').modal('show');
        });
        $("#enterDeleteRes").click(function(){
            $('#deleteResModel').modal('hide');
            if(resId !== ""){
                $.ajax({
                    <%--url:"<c:url value="/res/delete"/>",--%>
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
        });*/
    })
</script>
