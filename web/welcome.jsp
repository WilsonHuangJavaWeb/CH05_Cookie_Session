<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.bean.Person" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
%>
<%
    Person person = (Person) session.getAttribute("person");
    Date loginTime = (Date) session.getAttribute("loginTime");
%>
<html>
<head>
    <title>歡迎您，<%=person.getName()%>
    </title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>歡迎您，<%=person.getName()%>
        </legend>
        <table>
            <tr>
                <td>您的姓名：</td>
                <td><%=person.getName()%>
                </td>
            </tr>
            <tr>
                <td>登入時間：</td>
                <td><%=loginTime%>
                </td>
            </tr>
            <tr>
                <td>您的年齡：</td>
                <td><%=person.getAge()%>
                </td>
            </tr>
            <tr>
                <td>您的生日：</td>
                <td><%=dateFormat.format(person.getBirthday())%>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value="重新登入" onclick="location='session.jsp';"
                           class="button"></td>
            </tr>
        </table>
    </fieldset>
</div>
</body>
</html>
