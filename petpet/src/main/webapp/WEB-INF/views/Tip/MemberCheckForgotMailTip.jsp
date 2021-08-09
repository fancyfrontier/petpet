<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>密碼重置信已送出</title>
    <style>
        .mid {
            text-align: center;
            margin-top: 100px;
        }
        .clickBolck{
            text-align: center;
            margin-top: 50px;
            font-size: x-large;
        }
    </style>
    <script>
        var s = 3;

        function reciprocal() {
            if(s == 0){
			location.href="<c:url value='/index'/>";
		    }
            document.getElementById("showtime").innerHTML = s;
            setTimeout(reciprocal, 1000);
            s -= 1;
        }
    </script>
</head>
<body onload="reciprocal()">
	<div class="mid">
    <h1>密碼重置信已發送到您的信箱，請透過驗證修改您的密碼</h1></br>
    <span id="showtime"></span> 秒後刷新頁面…
    </div>
    <div class="clickBolck">如未自動跳轉，請點選<a href="<c:url value='/index'/>">此處</a></div>
    <div style="text-align:center;">
        <img src="<c:url value='/images/Loading.GIF' />">
    </div>
</body>
</html>