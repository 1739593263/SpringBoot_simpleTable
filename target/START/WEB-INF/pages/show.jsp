<%--
  Created by IntelliJ IDEA.
  User: 17395
  Date: 9/13/2019
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOW IT</title>

<%--    "${pageContext.request.contextPath}--%>
<%--    <link rel="stylesheet" href="/css/bootstrap.min.css">--%>
<%--    <script src="/jQuery/jquery-3.1.1.min.js"/>--%>
<%--    <script src="/JS/bootstrap.min.js"/>--%>
</head>
<script>
    function De(id){
        console.log("id="+id);
        window.open("../start/delete?id="+id,"_self");
    }
</script>
<body>
    <table cellspacing="0px" border="1px" bordercolor="#C0C0C0" width="600px">
        <span class="glyphicon glyphicon-search" aria-hidden="true"/>
        <tr><th>ID</th><th>NAME</th><th>AGE</th><th>X</th></tr>
        <c:forEach items="${userlist}" var="user">
            <tr>
                <th>${user.id}</th><th>${user.name}</th><th>${user.age}</th><th><button value="DELETE" onclick="De(${user.id})"/></th>
                <br>
            </tr>
        </c:forEach>
    </table>

    <a href="">add</a>
</body>
</html>
