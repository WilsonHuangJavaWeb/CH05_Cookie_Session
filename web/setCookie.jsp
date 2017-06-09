<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.sun.xml.internal.bind.v2.model.core.ID" %><%--
  Created by IntelliJ IDEA.
  User: WilsonHuang
  Date: 2017/6/9
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    boolean isNull(String str) {
        return str == null || str.trim().length() == 0;
    }
%>
<%
    request.setCharacterEncoding("utf-8");

    if ("POST".equals(request.getMethod())) {
        String name = request.getParameter("name");
        String value = request.getParameter("value");
        String maxAge = request.getParameter("maxAge");
        String domain = request.getParameter("domain");
        String path = request.getParameter("path");
        String comment = request.getParameter("comment");
        String secure = request.getParameter("secure");

        if (!isNull(name)) {
            Cookie cookie = new Cookie(URLEncoder.encode(name, "utf-8"), URLEncoder.encode(value, "utf-8"));

            if (!isNull(maxAge)) {
                cookie.setMaxAge(Integer.parseInt(maxAge));
            }
            if (!isNull(domain)) {
                cookie.setDomain(domain);
            }
            if (!isNull(path)) {
                cookie.setPath(path);
            }
            if (!isNull(comment)) {
                cookie.setComment(comment);
            }
            if (!isNull(secure)) {
                cookie.setSecure("true".equalsIgnoreCase(secure));
            }

            response.addCookie(cookie);
        }
    }
%>
<html>
<head>
    <title>設定Cookie參數</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>目前有效的 Cookie</legend>
        <script type="text/javascript">
            document.write(document.cookie);
        </script>
    </fieldset>
    <fieldset>
        <legend>設定新 Cookie</legend>
        <form action="setCookie.jsp" method="post">
            <table>
                <tr>
                    <td>name :</td>
                    <td><input type="text" name="name" style="width: 200px"></td>
                </tr>
                <tr>
                    <td>value :</td>
                    <td><input type="text" name="value" style="width: 200px"></td>
                </tr>
                <tr>
                    <td>maxAge :</td>
                    <td><input type="text" name="maxAge" style="width: 200px"></td>
                </tr>
                <tr>
                    <td>domain :</td>
                    <td><input type="text" name="domain" style="width: 200px"></td>
                </tr>
                <tr>
                    <td>path :</td>
                    <td><input type="text" name="path" style="width: 200px"></td>
                </tr>
                <tr>
                    <td>comment :</td>
                    <td><input type="text" name="comment" style="width: 200px"></td>
                </tr>
                <tr>
                    <td>secure :</td>
                    <td><input type="text" name="secure" style="width: 200px"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value=" 送 出 " class="button">
                        <input type="button" value=" 更 新 " onclick="location='setCookie.jsp'">
                    </td>
                </tr>
            </table>

        </form>
    </fieldset>
</div>
</body>
</html>
