<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/13
  Time: 16:17
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
            <li><a href="<c:url value="/res/list"/>">资源管理</a></li>
            <li class="active">资源编辑</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                资源编辑
<%--                <span class="tools pull-right">
                    <button class="btn btn-success v5-panel-header-tool" type="button">
                        <i class="fa fa-plus"></i>
                        添&nbsp;加
                    </button>
                </span>--%>
            </header>
            <div class="panel-body">
                <div class="form">
                    <form action="<c:url value="/res/edit"/>" method="post" id="resForm" class="cmxform form-horizontal tasi-form">
                        <div class="form-group ">
                            <label class="control-label col-lg-2">父资源</label>
                            <div class="col-lg-10">
                                <input type="hidden" name="pid" id="pid" value="${res.pid}">
                                <label class="control-label">${res.name}</label>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="rname">名&nbsp;&nbsp;称</label>
                            <div class="col-lg-10">
                                <input type="text" name="name" id="rname" class="form-control" placeholder="名称" required>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="rurl">URL</label>
                            <div class="col-lg-10">
                                <input type="text" name="url" id="rurl" class="form-control" placeholder='请以"/"开头'>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="permission">权限字符串</label>
                            <div class="col-lg-10">
                                <input type="text" name="permission" id="permission" class="form-control" placeholder="例如：res:*">
                                <span class="help-block">以资源为例 res:* 全部权限 res:view，res:create，res:update，res:delete</span>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="sortNum">序号</label>
                            <div class="col-lg-10">
                                <input type="text" name="sortNum" id="sortNum" class="form-control" placeholder="序号">
                                <span class="help-block">对资源进行排序，越小越靠前。</span>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="rtype">类型</label>
                            <div class="col-lg-10">
                                <select class="form-control m-bot15" name="type" id="rtype">
                                    <option value="1">菜单</option>
                                    <option value="2">按钮</option>
                                </select>
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
                            <label class="control-label col-lg-2" for="des">描述</label>
                            <div class="col-lg-10">
                                <textarea name="des" id="des" class="form-control"></textarea>
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
        $(":radio").iCheck({
            checkboxClass: 'icheckbox_flat-red',
            radioClass: 'iradio_flat-red'
        });
        $("#rtype").chosen({disable_search_threshold: 10});
        $("#resForm").validate({
            submitHandler:function(form){
                $(form).ajaxSubmit({
                    dataType:'json',
                    success:function(responseText,statusText,xhr,element){
                        if(responseText.status){
                            toastr.success(responseText.message);
                            setTimeout(function(){
                                location.href="<c:url value="/res/list"/>";
                            },1000);
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
/*        $("#resForm").ajaxForm({

        });*/
    })
</script>
