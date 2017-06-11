<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.bean.Person" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
%>
<%
    response.setCharacterEncoding("utf-8");
    Person[] persons = {
            new Person("AAA", "aaa", 10, dateFormat.parse("1982-01-01")),
            new Person("BBB", "bbb", 20, dateFormat.parse("1985-02-02")),
            new Person("CCC", "ccc", 30, dateFormat.parse("1990-03-03"))
    };

    String message = "";

    if (request.getMethod().equals("POST")) {
        for (Person person : persons) {
            if (person.getName().equalsIgnoreCase(request.getParameter("username"))
                    && person.getPassword().equals(request.getParameter("password"))) {
                session.setAttribute("person", person);
                session.setAttribute("loginTime", new Date());

                response.sendRedirect(request.getContextPath() + "/welcome.jsp");
                return;
            }
        }
        message = "使用者名稱或密碼錯誤，登入失敗。";
    }
%>
<html>
<head>
    <title>請先登入</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>登入</legend>
        <form action="session.jsp" method="post">
            <table>
                <%
                    if (!message.equals("")) {
                %>
                <tr>
                    <td></td>
                    <td>
                        <span><img src="images/errorstate.gif"> </span>
                        <span style="color: red;"><%=message%></span>
                    </td>
                </tr>
                <%
                    }
                %>
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
                    <td><input type="submit" value="登 入" class="button"></td>
                </tr>
            </table>
        </form>
    </fieldset>
</div>
</body>
</html>
