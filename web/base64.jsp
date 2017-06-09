<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="sun.misc.BASE64Encoder" %>

<%@ page pageEncoding="UTF-8" language="java" %>
<%

//    File file = new File(this.getServletConfig().getServletContext().getRealPath("cookie.gif"));
//
//    byte[] binary = new byte[(int) file.length()];
//    InputStream ins = this.getServletConfig().getServletContext().getResourceAsStream(file.getName());
//    ins.read(binary);
//    ins.close();
//
//    String content = BASE64Encoder.class.newInstance().encode(binary);

    String content=this.getClass().getName();
    Cookie cookie = new Cookie("file", content);

    response.addCookie(cookie);
%>
<html>
<head>
    <title>base64.jsp</title>
</head>
<body>
從Cookie中獲得到的二進位圖片：<<img src="base64_decode.jsp"/><br/>
<textarea id="cookieArea" style="width: 100%;height: 200px;"></textarea>
<script type="text/javascript">cookieArea.value = document.cookie</script>
</body>
</html>
