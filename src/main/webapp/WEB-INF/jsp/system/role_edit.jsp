<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/16
  Time: 17:05
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
            <li><a href="<c:url value="/role/list"/>">角色管理</a></li>
            <li class="active">角色编辑</li>
        </ul>
        <!--breadcrumbs end -->
    </div>
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                资源编辑
            </header>
            <div class="panel-body">
                <div class="form">
                    <form action="<c:url value="/role/edit"/>" method="post" id="roleForm" class="cmxform form-horizontal tasi-form">
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="rname">名&nbsp;&nbsp;称</label>
                            <div class="col-lg-10">
                                <input type="hidden" value="${role.id}" name="id">
                                <input type="text" name="name" id="rname" class="form-control" placeholder="名称" value="${role.name}" required>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="sortNum">序号</label>
                            <div class="col-lg-10">
                                <input type="text" name="sortNum" id="sortNum" class="form-control" placeholder="序号" value="${role.sortNum}">
                                <span class="help-block">对资源进行排序，越小越靠前。</span>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2">状态</label>
                            <div class="col-lg-10">
                                <label class="checkbox-inline" style="padding-left:0;">
                                    <input type="radio" name="available" value="1" id="available1" <c:if test="${role.available eq 1 or empty role.available}">checked</c:if>>
                                    <label for="available1">可用</label>
                                    <input type="radio" name="available" value="0" id="available0" <c:if test="${role.available eq 0}">checked</c:if>>
                                    <label for="available0">禁用</label>
                                </label>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2">授权</label>
                            <div class="col-lg-10">
                                <input id="resIds" name="resIds" type="hidden">
                                <div class="v5-div-scroll">
                                    <ul id="resTree" class="ztree"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="control-label col-lg-2" for="des">描述</label>
                            <div class="col-lg-10">
                                <textarea name="des" id="des" class="form-control">${role.des}</textarea>
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
        function onCheck(event, treeId, treeNode){
            var zTree = $.fn.zTree.getZTreeObj("resTree"),
                    nodes = zTree.getCheckedNodes(true),
                    id = [];
            nodes.sort(function compare(a,b){return a.id-b.id;});
            for (var i=0, l=nodes.length; i < l; i++) {
                id.push(nodes[i].id);
            }
            if (id.length > 0 ) $("#resIds").val(id.join(','));
        }
        var setting = {
            check: {
                enable: true,
                chkStyle: "checkbox",
                chkboxType: { "Y": "ps", "N": "ps" }
            },
            view: {
                dblClickExpand: false
            },
            async:{
                enable: true,
                dataType: "text",
                url:'<c:url value="/res/tree"/>',
                autoParam: ["id"]
            },
            callback:{
                onCheck:onCheck
            }
        };

        $.fn.zTree.init($("#resTree"), setting);

        v5Util.activeNav("systemManager","角色管理");
        $(":radio").iCheck({
            checkboxClass: 'icheckbox_flat-red',
            radioClass: 'iradio_flat-red'
        });
//        $("#rtype").chosen({disable_search_threshold: 10});
        $("#roleForm").validate({
            rules: {
                sortNum: {
                    number: true
                }
            },
            submitHandler:function(form){
                $(form).ajaxSubmit({
                    dataType:'json',
                    success:function(responseText,statusText,xhr,element){
                        if(responseText.status){
                            toastr.success(responseText.message);
                            setTimeout(function(){
                                location.href="<c:url value="/role/list"/>";
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
    })
</script>
