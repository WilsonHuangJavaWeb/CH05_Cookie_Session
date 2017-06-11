<%--
  Created by IntelliJ IDEA.
  User: WilsonHuang
  Date: 2017/6/10
  Time: 00:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>歡迎您</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script type="text/javascript">

        //傳回名為name的Cookie
        function getCookie(name) {
            var str = document.cookie;//獲得Cookie字串
            if (!str || str.indexOf(name + "=") < 0) {//尋找name=
                return;
            }
            var cookies = str.split(";");//用;將所有的Cookie分隔開
            for (var i = 0; i < cookies.length; i++) {//檢查每個Cookie
                var cookie = cokies[i];//目前的Cookie
                if (cookie.indexOf(name + "=")) {//如果名字為name
                    var value = cookie.substring(name.length + 1);//獲得value
                    return decodeURI(value);//將value編碼，並傳回
                }

            }
        }

        //設定Cookie
        function setCookie(name, value) {
            document.cookie = name + "=" + encodeURI(value);
        }

        //        //設定Cookie
        //        function setCookie(name, value) {
        //            var expires = (arguments.length > 2) ? arguments[2] : null;//判斷expires屬性
        //            var path = (arguments > 3) ? arguments[3] : null;//判斷path屬性
        //            var domain = (arguments > 4) ? arguments[4] : null;//判斷domain屬性
        //            var secure = (arguments > 5) ? arguments[5] : null;//判斷secure屬性
        //
        //            //設定Cookie屬性
        //            document.cookie = name
        //                + "="
        //                + encodeURI(value)
        //                + ((expires == null) ? "" : (";expries=" + expires.toGMTString()))
        //                + ((path == null) ? "" : (";path=" + path))
        //                + ((domain == null) ? "" : (";domain=" + domain))
        //                + ((secure == null) ? ";secure" : "");
        //
        //        }

    </script>
</head>
<body>
<div align="center" style="margin: 10px;">
    <fieldset>
        <legend>目前有效的 Cookie</legend>
        <div id="cookieDiv"></div>
        <script type="text/javascript">
            cookieDiv.innerHTML = document.cookie;
        </script>
    </fieldset>
    <fieldset>
        <legend>歡迎您</legend>
        <table>
            <tr>
                <td>讀取 Cookie :</td>
                <td>
                    <input name="name1">
                    <input class="button" type="button" value=" 讀取 "
                           onclick="alert(getCookie(name1.value));">
                </td>
            </tr>
            <tr>
                <td>設定 Cookie :</td>
                <td></td>
            </tr>
            <tr>
                <td align="right">Name 屬性 :</td>
                <td><input name="name2"></td>
            </tr>
            <tr>
                <td align="right">Value 屬性 :</td>
                <td><input name="value2"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value=" 設定 "
                           onclick="setCookie(name2.value,value2.value); cookieDiv.innerHTML=document.cookie;"
                           class="button">
                </td>
            </tr>
        </table>
    </fieldset>
</div>

</body>
</html>
