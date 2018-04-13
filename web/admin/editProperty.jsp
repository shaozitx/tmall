<%--
  Created by IntelliJ IDEA.
  User: shaoqi
  Date: 18/4/12
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../admin/adminHeader.jsp"%>
<%@include file="../admin/adminNavigator.jsp"%>

<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_category_list">${cname}</a></li>
        <li class="active">编辑属性</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑属性</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_property_update"  >
                <table class="editTable">
                    <tr>
                        <td>属性名称</td>
                        <td><input  id="name" name="name" value="${c.name}" type="text" class="form-control"></td>
                        <td display = "none"><input id = "cid" value="${cid} "></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${c.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>