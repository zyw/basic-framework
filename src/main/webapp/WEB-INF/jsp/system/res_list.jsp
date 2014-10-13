<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/13
  Time: 14:05
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
                        <th>Tree column</th>
                        <th>Additional data</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr data-tt-id="1">
                        <td>Node 1: Click on the icon in front of me to expand this branch.</td>
                        <td>I live in the second column.</td>
                    </tr>
                    <tr data-tt-id="1.1" data-tt-parent-id="1">
                        <td>Node 1.1: Look, I am a table row <em>and</em> I am part of a tree!</td>
                        <td>Interesting.</td>
                    </tr>
                    <tr data-tt-id="1.1.1" data-tt-parent-id="1.1">
                        <td>Node 1.1.1: I am part of the tree too!</td>
                        <td>That's it!</td>
                    </tr>
                    <tr data-tt-id="2">
                        <td>Node 2: I am another root node, but without children</td>
                        <td>Hurray!</td>
                    </tr>
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
            location.href="<c:url value="/res/edit"/>";
        })
    })
</script>
