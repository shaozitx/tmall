<%--
  Created by IntelliJ IDEA.
  User: shaoqi
  Date: 18/4/11
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../admin/adminHeader.jsp"%>
<%@include file="../admin/adminNavigator.jsp"%>

<div class="workingArea">
    <h1 class="label label-info" >用户管理</h1>
    <br>
    <br>


<div class="listDataTableDiv">
    <table class="table table-striped table-bordered table-hover  table-condensed">
        <thead>
        <tr class="success">
            <th>ID</th>
            <th>用户名称</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${thecs}" var="c">

            <tr>
                <td>${c.id}</td>
                <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                <td>${c.name}</td>

                <%--<td><a href="admin_user_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>--%>
                <%--<td><a deleteLink="true" href="admin_user_delete?id=${c.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>--%>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="pageDiv">
    <%@include file="../admin/adminPage.jsp" %>
</div>


</div>
<%@include file="../admin/adminFooter.jsp"%>
