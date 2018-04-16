%--
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
        <li class="active">编辑产品</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑产品</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_product_update"  >
                <table class="editTable">


                    <tr>
                        <td>产品名称</td>
                        <td><input  id="name" name="name" type="text" value="${c.name}" class="form-control"></td>
                        <td ><input name = "cid" type="hidden" value="${cid} "></td>

                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input  id="subTitle" name="subTitle" type="text" value="${c.subTitle}"  class="form-control"></td>

                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input  id="orignalPrice" name="orignalPrice" type="text"  value= "${c.orignalPrice}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input  id="promotePrice" name="promotePrice" type="text" value="${c.promotePrice}" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input  id="stock" name="stock" type="text" value="${c.stock}" class="form-control"></td>
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