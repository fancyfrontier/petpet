<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員資料更改</title>
    <!--stylesheet-->
    <link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />
    <!--jQuery-------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!--fav-icon------------------->
    <link rel="shortcut icon" href="images/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <!--BookStrap-------------------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
    crossorigin="anonymous"></script>
	<!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
	
    
    
    <style>
        .block {
            width: 1300px;
            height: 800px;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 100px;
            display: flex;
            flex-wrap: wrap;
            border-radius: 10px;
            border: solid 1px rgba(0, 0, 0, 0.3);
            box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
        }
        .btnBlock {
            width: auto;
            display: flex;
            justify-content: center;
        }

        .dataBlock {
            margin: auto;
        }

        .welcome {
            font-size: 40px;
        }

        .div {
            margin: 60px auto;
            width: 600px;
        }

        .button {
            margin: 0 auto;
            border: none;
        }
    </style>
</head>
<body>
	<!--navigation-------------------------------->
    <nav>
        <!--social-link-and-phont-number-->
        <div class="social-call">
            <!--social-links-->
            <div class="social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
            <!--phone-number-->
            <div class="phone">
                <span>Call +123456789</span>
            </div>
        </div>

        <!--search-bar------------------------------->
        <div class="search-bar">
            <!--search-input-------->
            <div class="search-input">
                <!--input----->
                <input type="text" placeholder="Search For Product" />
                <!--cancel-btn-->
                <a href="javascript:void(0);" class="search-cancel">
                    <i class="fas fa-times"></i>
                </a>
            </div>
        </div>

        <!----------------------------------------------NEW!!Strat!!-------------------------------------------->

        <div class="block">
            <div class="dataBlock">
                <h1>帳戶資料修改</h1>
                <form method="post" action="<c:url value='/UpdateMemberEdit'/>">
                    <div>
                        <h4 class="MemberNum">
                            <input class="MemberNum MemberNumInput" readonly type="Hidden" id="memberid" name="memberid"
                                value="${member.memberid}">
                        </h4>
                    </div>
                    <div class="input-group input-group-lg div">
                        <span class="input-group-text ">姓名</span>
                        <input type="text" class="form-control" placeholder="姓名" name="fullname" value="${member.fullname}">
                    </div>
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">性別</span>
                        <div class="btn-group">
                            <input type="hidden" id="genderInput" name="gender" value="${member.gender}">
                            <c:set var="gd" value="${member.gender}" />
                		<select id="gender">
                	<c:choose>
                		<c:when test="${member.gender==null}">
                			<option selected>請選擇</option>
                		</c:when>
                		<c:otherwise>
                			<option>請選擇</option>
                		</c:otherwise>
                	</c:choose>          		
                	<c:choose>
                		<c:when test="${member.gender=='男'}">
                			<option selected>男</option>
                		</c:when>
                		<c:otherwise>
                			<option>男</option>
                		</c:otherwise>
                	</c:choose>
                    <c:choose>
                    	<c:when test="${member.gender=='女'}">
                    		<option selected>女</option>
                    	</c:when>
                    	<c:otherwise>
                    		<option>女</option>
                    	</c:otherwise>
                    </c:choose>  
                    	</select>                   
                        </div>
                    </div>
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">生日</span>
                        <input type="date" name="birthday" value="${member.birthday}">
                    </div>
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">手機號碼</span>
                        <input type="text" class="form-control" placeholder="手機號碼" name="mobile" value="${member.mobile}">
                    </div>
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">大頭照</span>
                        <input type="file" class="form-control" placeholder="" name="mobile" value="${member.memberid}">
                    </div>
                    <div class="btnBlock gap-2 col-6 mx-auto container">
                            <input class="button btn btn-success" type="submit"
                                style="width:200px;height:40px;" value="修改">
                            <input class="button btn btn-success" type="button"
                                style="width:200px;height:40px;" value="返回" href="#">
                    </div>
                </form>
                <div class="last"></div>
            </div>
        </div>

        <!--footer--------------------------------------->
        <footer>
            <!--copyright----------------->
            <span class="copyright">
                Copyright 2021 - EEIT31全端工程師課程第7組
            </span>
            <!--subscribe--->
            <div class="subscribe">
                <form>
                    <input type="email" placeholder="Example@gmail.com" required />
                    <input type="submit" value="Subscribe">
                </form>
            </div>
        </footer>


        <!--script-------->
        <script type="text/javascript">

        const choose = document.getElementById('gender');

        choose.addEventListener("input", getOption)

        function getOption() {
            var x = document.getElementById("gender")
            document.getElementById("genderInput").value = x.options[x.selectedIndex].text;
            console.log(document.getElementById("genderInput").value);
        }


        </script>
</body>
</html>