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
                    <button id="editRes" class="btn btn-success v5-panel-header-tool" type="button">
                        <i class="fa fa-plus"></i>
                        添&nbsp;加
                    </button>
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
                                <td>${res.available==1?"可用":"禁用"}</td>
                                <td>
                                    <c:if test="${res.type ne 2}">
                                        <a href="<c:url value="/res/edit/"/>${res.id}">添加资源</a>
                                    </c:if>
                                    <a href="#">修改</a>
                                    <a href="#">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>
<c:import url="../fragment/footer.jsp"/>
<script type="text/javascript">
    $(function(){
        $("#example-basic").treetable({ expandable: true });
        $("#editRes").click(function(){
            location.href="<c:url value="/res/edit/0"/>";
        })
    })
</script>
