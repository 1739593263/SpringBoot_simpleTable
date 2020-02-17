<%--
  Created by IntelliJ IDEA.
  User: 17395
  Date: 8/31/2019
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%
    pageContext.setAttribute("ContextPath",request.getContextPath());
%>
<head>
    <title>OPEN</title>

    <script type="text/javascript" src="${ContextPath}/jQuery/jquery-3.1.1.min.js"></script>
    <script src="${ContextPath}/JS/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ContextPath}/css/bootstrap.min.css"/>
</head>

<body>
<%--    ${requestScope.pageInfo}--%>
    <div class="container">

        <div class="jumbotron text-center">
            <h1>My First Bootstrap Page</h1>
            <p>Resize this responsive page to see the effect!</p>
        </div>

        <div class="row">
            <div class="col-lg-12"><h1>Employee Table</h1></div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-8">
                <button class="btn btn-info">ADD</button>
                <button class="btn btn-danger">DELETE</button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr class="success">
                        <th>${emp.id}</th>
                        <th>${emp.name}</th>
                        <th>${emp.gender}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.depName}</th>
                        <th>
                            <button class="btn btn-primary" value="UPDATE"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/>&nbsp;UPDATE</button>
                            <button class="btn btn-danger" value="DELETE"><span class="glyphicon glyphicon-trash" aria-hidden="true"/>&nbsp;DELETE</button>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-lg-4">
                <b>rowCount=${pageInfo.total}</b>
            </div>
            <div class="col-lg-offset-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${ContextPath}/employee/findAll?PN=1" style="cursor: pointer">FIRST</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li><a href="${ContextPath}/employee/findAll?PN=${pageInfo.pageNum-1}" style="cursor: pointer"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"/></a></li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageNum==pageInfo.pageNum}">
                                <li class="disabled"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageNum!=pageInfo.pageNum}">
                                <li class="active"><a href="${ContextPath}/employee/findAll?PN=${pageNum}" style="cursor: pointer">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li><a href="${ContextPath}/employee/findAll?PN=${pageInfo.pageNum+1}" style="cursor: pointer"><span class="glyphicon glyphicon-menu-right" aria-hidden="true"/></a></li>
                        </c:if>
                        <%-- pageInfo.pages = pageCounts --%>
                        <li><a href="${ContextPath}/employee/findAll?PN=${pageInfo.pages}" style="cursor: pointer">LAST</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
