<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../admin/adminHeader.jsp"%>
<%@include file="../admin/adminNavigator.jsp"%>

<script>
$(function(){
	
	$("#addForm").submit(function(){
		if(!checkEmpty("name","分类名称"))
			return false;
		if(!checkEmpty("categoryPic","分类图片"))
			return false;
		return true;
	});


});


</script>

<title>属性管理</title>


<div class="workingArea">
	<ol class="breadcrumb">
		<li><a href="#">全部分类</a></li>
		<li><a href="#">${ca.name} </a></li>
		<li class="active">属性管理 </li>
	</ol>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
 					<th>属性名称</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${thecs}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td>${c.name}</td>
					<td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>
	
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../admin/adminPage.jsp" %>
	</div>
	
	<div class="panel panel-warning addDiv">
	  <div class="panel-heading">新增属性</div>
	  <div class="panel-body">
	    	<form method="post" id="addForm" action="admin_property_add" >
	    		<table class="addTable">
	    			<tr>
	    				<td>属性名称</td>
	    				<td><input  id="name" name="name" type="text" class="form-control"></td>
						<td ><input id = "cid" name = "cid" type = "hidden"  value="${ca.id}"></td>

					</tr>

	    			<tr class="submitTR">
	    				<td colspan="2" align="center">
	    					<button type="submit" class="btn btn-success">提 交</button>
	    				</td>
	    			</tr>
	    		</table>
	    	</form>
	  </div>
	</div>
	
</div>

<%@include file="../admin/adminFooter.jsp"%>

































