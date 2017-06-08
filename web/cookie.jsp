<%--
  Created by IntelliJ IDEA.
  User: ki264
  Date: 2017/6/8
  Time: 下午 05:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" errorPage="login.jsp" pageEncoding="utf-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String userName = "";//使用者名稱
    int visitTimes = 0;//存取次數
    Cookie[] cookies = request.getCookies();//取得所有Cookie

    //檢查所有Cookie，尋找帳號與登入次數
    for (int i = 0; cookies != null && i < cookies.length; i++) {
        Cookie cookie = cookies[i];//第i個Cookie
        if ("userName".equals(cookie.getName())) {
            userName = cookie.getValue();
        } else if ("visitTime".equals(cookie.getName())) {
            visitTimes = Integer.parseInt(cookie.getValue());
        }
    }

    if (userName == null || userName.trim().equals("")) {
        throw new Exception("尚未登入，請先登入。");
    }
    Cookie visitTimesCookie = new Cookie("visitTimes", Integer.toString(++visitTimes));
    response.addCookie(visitTimesCookie);
%>
<html>
<head>
    <title>登入資訊</title>
</head>
<body>

</body>
</html>
