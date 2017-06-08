<%--
  Created by IntelliJ IDEA.
  User: WilsonHuang
  Date: 2017/6/8
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="login.jsp" %>
<%
    String username = "";
    String password = "";
    int visitTimes = 0;

    Cookie[] cookies = request.getCookies();

    for (int i = 0; cookies != null && i < cookies.length; i++) {
        Cookie cookie = cookies[i];
        if ("username".equals(cookie.getName())) {
            username = cookie.getValue();
        } else if ("visitTimes".equals(cookie.getName())) {
            visitTimes = Integer.parseInt(cookie.getValue());
        } else if ("password".equals(cookie.getName())) {
            password = cookie.getValue();
        }
    }
    if (username == null || username.trim().equals("")) {
        throw new Exception("還有沒有登入，請先登入。");
    }

    Cookie visitTimesCookie = new Cookie("visitTimes", Integer.toString(++visitTimes));
    response.addCookie(visitTimesCookie);

%>
<html>
<head>
    <title>cookie</title>
    <meta http-equiv="pargma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>登入資訊</legend>
        <form action="login.jsp" method="post">
            <table>
                <tr>
                    <td>帳號：
                    </td>
                    <td>
                        <%=username%>
                    </td>
                </tr>
                <tr>
                    <td>密碼：</td>
                    <td><%=password%>
                    </td>
                </tr>
                <tr>
                    <td>登入次數：</td>
                    <td><%=visitTimes%>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="刷新"
                               onclick="location='<%=request.getRequestURL()%>?ts='+new Date().getTime();"
                               class="button">
                    </td>
                </tr>
            </table>

        </form>
    </fieldset>
</div>
</body>
</html>
