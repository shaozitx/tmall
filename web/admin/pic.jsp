<%--
  Created by IntelliJ IDEA.
  User: shaoqi
  Date: 18/4/13
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../admin/adminHeader.jsp"%>
<%@include file="../admin/adminNavigator.jsp"%>


<title>图片管理</title>


<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_category_list">${p.name}</a></li>
        <li class="active">编辑产品</li>
    </ol>
    <table class="addPictureTable" align="center">
        <tr>
            <td class="addPictureTableTD">

                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">新增产品单个图片</div>
                        <div class="panel-body">
                            <form method="post" id="editForm" action="admin_product_picadd"  enctype="multipart/form-data">
                                <table class="editTable">

                                    <tr>
                                        <td>请选择本地图片,尺寸400*400为佳</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="categoryPic" accept="image/*" type="file" name="filepath" />
                                        </td>
                                    </tr>

                                    <tr class="submitTR">
                                        <td colspan="2" align="center">
                                            <input type="hidden" name="pid" value="${p.id}">
                                            <input type="hidden" name="type" value="single">

                                            <button type="submit" class="btn btn-success">提 交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">
                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>单个图片</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${thecs1}" var="c">

                            <tr>
                                <td>${c.id}</td>
                                <td><img height="40px" src="img/product/${c.id}.jpg"></td>
                                <td><a deleteLink="true" href="admin_product_delpic?id=${c.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </td>


            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">新增产品详情图片</div>
                        <div class="panel-body">
                            <form method="post" id="ditailpicForm" action="admin_product_picadd"  enctype="multipart/form-data">
                                <table class="editTable">

                                    <tr>
                                        <td>请选择本地图片,尺寸750为佳</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="detailPic" accept="image/*" type="file" name="filepath" />
                                        </td>
                                    </tr>

                                    <tr class="submitTR">
                                        <td colspan="2" align="center">
                                            <input type="hidden" name="pid" value="${p.id}">
                                            <input type="hidden" name="type" value="detail">
                                            <button type="submit" class="btn btn-success">提 交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">
                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>详情图片</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${thecs2}" var="c">

                            <tr>
                                <td>${c.id}</td>
                                <td><img height="40px" src="img/product/${c.id}.jpg"></td>
                                <td><a deleteLink="true" href="admin_product_delpic?id=${c.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
    </table>


</div>