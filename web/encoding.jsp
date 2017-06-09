<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: WilsonHuang
  Date: 2017/6/9
  Time: 09:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie cookie = new Cookie(
            URLEncoder.encode("姓名", "utf-8"),
            URLEncoder.encode("路人甲", "utf-8")
    );

    response.addCookie(cookie);
%>
<html>
<head>
    <title>Cookie Encoding</title>
</head>
<body>
<%
    if (request.getCookies() != null) {
        for (Cookie cc : request.getCookies()) {
            String cookieName = URLDecoder.decode(cc.getName(), "utf-8");
            String cookieValue = URLDecoder.decode(cc.getValue(), "utf-8");

            out.println(cookieName + "=" + cookieValue + ";<br/>");
        }

    } else {
        out.println("Cookie 已經寫入用戶端，請更新頁面。");
    }
%>
</body>
</html>
