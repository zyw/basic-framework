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
                <table class="table table-striped table-bordered table-advance table-hover">
                    <thead>
                    <tr>
                        <th><i class="fa fa-bullhorn"></i> Company</th>
                        <th class="hidden-phone"><i class="fa fa-question-circle"></i> Descrition</th>
                        <th><i class="fa fa-bookmark"></i> Profit</th>
                        <th><i class=" fa fa-edit"></i> Status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">Vector Ltd</a></td>
                        <td class="hidden-phone">Lorem Ipsum dorolo imit</td>
                        <td>12120.00$ </td>
                        <td><span class="label label-info label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                Adimin co
                            </a>
                        </td>
                        <td class="hidden-phone">Lorem Ipsum dorolo</td>
                        <td>56456.00$ </td>
                        <td><span class="label label-warning label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                boka soka
                            </a>
                        </td>
                        <td class="hidden-phone">Lorem Ipsum dorolo</td>
                        <td>14400.00$ </td>
                        <td><span class="label label-success label-mini">Paid</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                salbal llb
                            </a>
                        </td>
                        <td class="hidden-phone">Lorem Ipsum dorolo</td>
                        <td>2323.50$ </td>
                        <td><span class="label label-danger label-mini">Paid</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#">Vector Ltd</a></td>
                        <td class="hidden-phone">Lorem Ipsum dorolo imit</td>
                        <td>12120.00$ </td>
                        <td><span class="label label-primary label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                Adimin co
                            </a>
                        </td>
                        <td class="hidden-phone">Lorem Ipsum dorolo</td>
                        <td>56456.00$ </td>
                        <td><span class="label label-warning label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#">Vector Ltd</a></td>
                        <td class="hidden-phone">Lorem Ipsum dorolo imit</td>
                        <td>12120.00$ </td>
                        <td><span class="label label-success label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                Adimin co
                            </a>
                        </td>
                        <td class="hidden-phone">Lorem Ipsum dorolo</td>
                        <td>56456.00$ </td>
                        <td><span class="label label-warning label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td><a href="#">Vector Ltd</a></td>
                        <td class="hidden-phone">Lorem Ipsum dorolo imit</td>
                        <td>12120.00$ </td>
                        <td><span class="label label-info label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">
                                Adimin co
                            </a>
                        </td>
                        <td class="hidden-phone">Lorem Ipsum dorolo</td>
                        <td>56456.00$ </td>
                        <td><span class="label label-warning label-mini">Due</span></td>
                        <td>
                            <button class="btn btn-success btn-xs"><i class="fa fa-check"></i></button>
                            <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></button>
                            <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                        </td>
                    </tr>
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
        v5Util.activeNav("systemManager","角色管理");

        $("#editRole").click(function(){
            location.href="<c:url value="/role/edit"/>";
        });
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
