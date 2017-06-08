<%@ page import="com.sun.xml.internal.bind.v2.model.core.ID" %><%--
  Created by IntelliJ IDEA.
  User: WilsonHuang
  Date: 2017/6/8
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    if ("POST".equals(request.getMethod())) {
        Cookie usernameCookie = new Cookie("username", request.getParameter("username"));
        Cookie visittimesCookie = new Cookie("visitTimes", "0");
        Cookie passwordCookie = new Cookie("password", request.getParameter("password"));
        response.addCookie(usernameCookie);
        response.addCookie(visittimesCookie);
        response.addCookie(passwordCookie);

        response.sendRedirect(request.getContextPath() + "/cookie.jsp");
        return;
    }
%>
<html>
<head>
    <title>login.jsp</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>登入頁面</legend>
        <form action="login.jsp" method="post">
            <table>
                <tr>
                    <td></td>
                    <td>
                        <span><img src="images/errorstate.gif"></span>
                        <span style="color: red;"><%=exception.getMessage()%></span>
                    </td>
                </tr>
                <tr>
                    <td>帳號：</td>
                    <td><input type="text" name="username" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>密碼：</td>
                    <td><input type="password" name="password" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="登入" class="button"></td>
                </tr>
            </table>
        </form>
    </fieldset>
</div>
</body>
</html>
