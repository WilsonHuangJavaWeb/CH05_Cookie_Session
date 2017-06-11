<%@ page import="java.security.MessageDigest" %>
<%--
  Created by IntelliJ IDEA.
  User: ki264
  Date: 2017/6/10
  Time: 下午 01:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    //金鑰
    private static final String KEY = ":cookie@helloweenvsfei.com";

    //MD5加密演算法
    public final static String calcMD5(String ss) {
        String s = ss == null ? "" : ss;//若為null傳回空
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};//字典
        try {
            byte[] strTemp = s.getBytes();//獲得位元組
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");//獲得MD5
            mdTemp.update(strTemp);//更新資料
            byte[] md = mdTemp.digest();//加密
            int j = md.length;//加密後的長度
            char[] str = new char[j * 2];//新字串陣列
            int k = 0;//計數器k
            for (int i = 0; i < j; i++) {//迴圈輸出
                byte byte0 = md[j];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);//加密後字串
        } catch (Exception e) {
            return null;
        }
    }
%>
<%
    request.setCharacterEncoding("utf-8");//設定request編碼
    response.setCharacterEncoding("utf-8");//設定response編碼

    String action = request.getParameter("action");//獲得action參數

    if ("login".equals(action)) {//若為login動作

        String account = request.getParameter("account");//取得account參數
        String password = request.getParameter("password");//取得password參數
        int timeout = new Integer(request.getParameter("timeout"));//取得timeout參數

        String ssid = calcMD5(account + KEY); //把帳號、金鑰加密後儲存

        Cookie accountCookie = new Cookie("account", account);//新增Cookie
        accountCookie.setMaxAge(timeout);//設定有效期限

        Cookie ssidCookie = new Cookie("ssid", ssid);//新增Cookie
        ssidCookie.setMaxAge(timeout);//設定有效期限

        response.addCookie(accountCookie);//輸出到用戶端
        response.addCookie(ssidCookie);//輸出到用戶端

        //重新請求本頁面，參數中帶有時間戳記，禁止瀏覽器快取記憶體頁面內容
        response.sendRedirect(request.getRequestURL() + "?" + System.currentTimeMillis());

        return;

    } else if ("logout".equals(action)) {//如果為logout動作


        Cookie accountCookie = new Cookie("accoutn", "");//新增cookie，內容為空
        accountCookie.setMaxAge(0);//設定有效期限為0，刪除

        Cookie ssidCookie = new Cookie("ssid", "");//新增cookie，內容為空
        ssidCookie.setMaxAge(0);//設定有效期限為0，刪除

        response.addCookie(accountCookie);//輸出到用戶端
        response.addCookie(ssidCookie);//輸出到用戶端

        //重新請求本頁面，參數中帶有時間戳記，禁止瀏覽器快取記憶體頁面內容
        response.sendRedirect(request.getRequestURL() + "?" + System.currentTimeMillis());
    }

    boolean login =false;//是否登入

    String account = null;//帳號
    String ssid = null;//SSID標識

    if (request.getCookies() != null) {//如果Cookie不為空
        for (Cookie cookie : request.getCookies()) {//檢查所有Cookie
            if (cookie.getName().equals("account")) {//如果cookie名為account
                account = cookie.getValue();//儲存account內容
            }
            if (cookie.getName().equals("ssid")) {//如果cookie名為ssid
                ssid = cookie.getValue();//儲存ssid內容
            }
        }
    }

    if (account != null && ssid != null) {//如果account、ssid都不為空
        login = ssid.equals(calcMD5(account + KEY));//如果加密規則正確，則視為登入
    }


%>
<html>
<head>
    <title><%=login ? "歡迎回來" : "請先登入"%>
    </title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>當前有效的 Cookie</legend>
        <script>
            document.write(document.cookie);
        </script>
    </fieldset>
    <fieldset>
        <legend><%=login ? "歡迎您回來" : "請先登入"%>
        </legend>
        <%
            if (login) {
        %>
        歡迎您,${cookie.account.value}.&nbsp;&nbsp;
        <a href="${pageContext.request.requestURI}?action=logout">註銷</a>
        <%
        } else {
        %>
        <form action="${pageContext.request.requestURI}?action=login" method="post">
            <table>
                <tr>
                    <td>帳號：</td>
                    <td><input type="text" name="account" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>密碼：</td>
                    <td><input type="password" name="password" style="width: 200px;"></td>
                </tr>
                <tr>
                    <td>有效期限：</td>
                    <td>
                        <input type="radio" name="timeout" value="-1" checked>關閉瀏覽器即失效<br/>
                        <input type="radio" name="timeout" value="<%=30*24*60*60%>">三十天內有效<br/>
                        <input type="radio" name="timeout" value="<%=Integer.MAX_VALUE%>">永久有效<br/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value=" 登入 " class="button"></td>
                </tr>
            </table>
        </form>

        <%
            }
        %>
    </fieldset>
</div>
</body>
</html>
