<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../admin/adminHeader.jsp"%>
<%@include file="../admin/adminNavigator.jsp"%>

<script>


</script>

<title>产品管理</title>


<div class="workingArea">
	<ol class="breadcrumb">
		<li><a href="#">全部分类</a></li>
		<li><a href="#">${ca.name} </a></li>
		<li class="active">产品管理 </li>
	</ol>	<br>
	<br>
	
	<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>ID</th>
					<th>图片</th>
 					<th>产品名称</th>
					<th>产品小标题</th>
					<th>原价格</th>
					<th>优惠价格</th>
					<th>库存数量</th>
					<th>图片管理</th>
					<th>设置属性</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${thecs}" var="c">
				
				<tr>
					<td>${c.id}</td>
					<td><img height="40px" src="img/product/${c.id}.jpg"></td>
					<td>${c.name}</td>
					<td>${c.subTitle}</td>
					<td>${c.orignalPrice}</td>
					<td>${c.promotePrice}</td>
					<td>${c.stock}</td>
					<td><a href="admin_product_pic?id=${c.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
					<td><a href="admin_product_set?id=${c.id}"><span class="glyphicon glyphicon-list"></span></a></td>
					<td><a href="admin_product_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
					<td><a deleteLink="true" href="admin_product_delete?id=${c.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>
	
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="pageDiv">
		<%@include file="../admin/adminPage.jsp" %>
	</div>
	<div class="panel panel-warning addDiv">
		<div class="panel-heading">新增产品</div>
		<div class="panel-body">
			<form method="post" id="addForm" action="admin_product_add" >
				<table class="addTable">
					<tr>
						<td>产品名称</td>
						<td><input  id="name" name="name" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>产品小标题</td>
						<td><input  id="subTitle" name="subTitle" type="text" value="10" class="form-control"></td>

					</tr>
					<tr>
						<td>原价格</td>
						<td><input  id="orignalPrice" name="orignalPrice" type="text" value="10" class="form-control"></td>
					</tr>
					<tr>
						<td>优惠价格</td>
						<td><input  id="promotePrice" name="promotePrice" type="text" value="10" class="form-control"></td>
					</tr>
					<tr>
						<td>库存</td>
						<td><input  id="stock" name="stock" type="text" value="10" class="form-control"></td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input   name="cid" type="hidden" value=${ca.id} >
							<button type="submit" class="btn btn-success">提 交</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	
</div>

<%@include file="../admin/adminFooter.jsp"%>