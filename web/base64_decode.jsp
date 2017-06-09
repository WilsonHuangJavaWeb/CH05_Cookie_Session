<%@ page import="sun.plugin2.message.CookieReplyMessage" %>
<%@ page import="sun.misc.BASE64Decoder" %><%--
  Created by IntelliJ IDEA.
  User: WilsonHuang
  Date: 2017/6/9
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    out.clear();

    for (Cookie cookie : request.getCookies()) {
        if (cookie.getName().equals("file")) {
            byte[] binary = BASE64Decoder.class.newInstance().decodeBuffer(cookie.getValue().replace(" ", ""));

            response.setHeader("Content-Type", "image/gif");
            response.setHeader("Content-Disposition", "inline;filename=cookie.gif");
            response.setHeader("Connection", "close");

            response.setContentLength(binary.length);

            response.getOutputStream().write(binary);
            response.getOutputStream().flush();
            response.getOutputStream().close();

            return;

        }
    }
%>
<html>
<head>
    <title>base64_decode.jsp</title>
</head>
<body>

</body>
</html>
