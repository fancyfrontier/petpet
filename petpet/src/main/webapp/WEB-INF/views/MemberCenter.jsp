<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>會員中心</title>
	<!--stylesheet-->
    <link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />	
    <!--jQuery-------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
    <!--fav-icon------------------->
    <link rel="shortcut icon" href="${basePath}/EEIT3101/images/Member/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <style>
        .block {
            width: 1300px;
            height: 400px;
            margin: auto;
            margin-top: 50px;
            display: flex;
            flex-wrap: wrap;
            border-radius: 10px;
            padding-top: 50px;
            padding-left: 50px;
            border: solid 1px rgba(0, 0, 0, 0.3);
        }
        .block:hover {
            box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
        }
        .photoBlock {
            width: 200px;
            height: 250px;
            border: gray 2px solid;
            margin-top: 25px;
        }
        .textBlock {
            width: 900px;
            height: 300px;
            margin-left: 50px;
        }
        .welcome {
            width: 400px;
            height: 60px;
            font-size: 40px;
        }
        .btnBlock {
            border-collapse: collapse;
            margin-left: 100px;
            height: 250px;
            width: 800px;
        }
        td {
            border: solid 1px rgba(0, 0, 0, 0.3);
            margin-top: 300px;
            width: 500px;
            font-size: x-large;
            text-align: center;
            font-weight: bold;
            transition: 1s;
        }
        td a {
            color: #467e14;
        }
        td:hover {
            background-color: #73b43a;
        }
        .picview{
     		height:246px; 
    		width:196px;
		}
    </style>
    <script>
        function dataToWhite() {
            var data = document.getElementById("data");
            data.style.color = "white";
        }
        function dataBackColor() {
            var data = document.getElementById("data");
            data.style.color = "#467e14";
        }

        function pwdToWhite() {
            var pwd = document.getElementById("pwd");
            pwd.style.color = "white";
        }
        function pwdBackColor() {
            var pwd = document.getElementById("pwd");
            pwd.style.color = "#467e14";
        }


        function orderToWhite() {
            var order = document.getElementById("order");
            order.style.color = "white";
        }
        function orderBackColor() {
            var order = document.getElementById("order");
            order.style.color = "#467e14";
        }

        function wishToWhite() {
            var wish = document.getElementById("wish");
            wish.style.color = "white";
        }
        function wishBackColor() {
            var wish = document.getElementById("wish");
            wish.style.color = "#467e14";
        }

        function historyToWhite() {
            var history = document.getElementById("history");
            history.style.color = "white";
        }
        function historyBackColor() {
            var history = document.getElementById("history");
            history.style.color = "#467e14";
        }

        function sendToWhite() {
            var send = document.getElementById("send");
            send.style.color = "white";
        }
        function sendBackColor() {
            var send = document.getElementById("send");
            send.style.color = "#467e14";
        }
    </script>
</head>
<body background="<c:url value='/images/petBackground.jpg' />" style="background-repeat:no-repeat;">
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

        <!--menu-bar-------------------------------------->
        <div class="navigation">
            <!--logo---------->
            <a href="#" class="logo">
                <img src="<c:url value='/images/PetPetLogo.png' />" />
            </a>
            <!--menu-icon---------------------->
            <div class="toggle"></div>

            <!--menu----------->
            <ul class="menu">
                <li><a href="#">最新消息</a></li>

                <li><a href="#">商品總覽</a>
                    <!--sale-label-->
                    <span class="sale-lable">Sale</span>
                </li>

                <li><a href="#">寵愛認養</a></li>
                <li><a href="#">毛寵大小事</a></li>
                <li><a href="#">會員中心</a></li>
            </ul>
            <!--right-menu------->
            <div class="right-menu">
                <!--search-->
                <a href="javascript:void(0);" class="search">
                    <i class="fas fa-search"></i>
                </a>
                <!--user-->
                <a href="javascript:void(0);" class="user">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
                <!--cart-icon-->
                <a href="#">
                    <i class="fas fa-shopping-cart">
                        <!--number-of-product-in-cart-->
                        <span class="num-cart-product">0</span>
                    </i>
                </a>
            </div>
        </div>
    </nav>
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

    <!--------------------Center-List------------------------>

    <div class="block">

        <div class="photoBlock">
            <img class="picview" src="${pageContext.request.contextPath}/showPhoto/display/${member.memberid}" />
        </div>
        <div class="textBlock">
            <div class="welcome">
                <span>歡迎回來</span>
            </div>
            <table class="btnBlock" frame=void>
                <tr>
                    <td onmousemove="dataToWhite()" onmouseout="dataBackColor()"><a id="data" href="<c:url value='/member/MemberEdit'/>">修改會員資料</a></td>
                    <td onmousemove="pwdToWhite()" onmouseout="pwdBackColor()"><a id="pwd" href="<c:url value='/member/MemberPwdEdit'/>">變更密碼</a></td>
                    <td onmousemove="orderToWhite()" onmouseout="orderBackColor()"><a id="order" href="/jQuery/jQueryLabsrcEEIT(20210606)/TeamWork/MemberOrder.html">訂單查詢</a></td>
                </tr>
                <tr>
                    <td onmousemove="wishToWhite()" onmouseout="wishBackColor()"><a id="wish" href="/jQuery/jQueryLabsrcEEIT(20210606)/TeamWork/MemberWish.html">我的收藏</a></td>
                    <td onmousemove="historyToWhite()" onmouseout="historyBackColor()"><a id="history" href="/jQuery/jQueryLabsrcEEIT(20210606)/TeamWork/MemberHistory.html">消費紀錄</a></td>
                    <td onmousemove="sendToWhite()" onmouseout="sendBackColor()"><a id="send" href="<c:url value='/member/MemberAdress'/>">常用配送</a></td>
                </tr>
            </table>
        </div>
    </div>
    
    <!--script-------->
    <script type="text/javascript">

        /*----For Search bar---------------------*/
        $(document).on('click', '.search', function () {
            $('.search-bar').addClass('search-bar-active')
        });

        $(document).on('click', '.search-cancel', function () {
            $('.search-bar').removeClass('search-bar-active')
        });

        /*--login-sign-up-form-----------------*/
        $(document).on('click', '.user,.already-acount', function () {
            $('.form').addClass('login-active').removeClass('sign-up-active')
        });

        $(document).on('click', '.sign-up-btn', function () {
            $('.form').addClass('sign-up-active').removeClass('login-active')
        });

        $(document).on('click', '.form-cancel', function () {
            $('.form').removeClass('login-active').removeClass('sign-up-active')
        });

        /*---full-slider-script--------------*/
        $(document).ready(function () {
            $('#adaptive').lightSlider({
                adaptiveHeight: true,
                auto: true,
                item: 1,
                slideMargin: 0,
                loop: true
            });
        });
        /*--Feature-slider--------------------*/
        $(document).ready(function () {
            $('#autoWidth').lightSlider({
                autoWidth: true,
                loop: true,
                onSliderLoad: function () {
                    $('#autoWidth').removeClass('cS-hidden');
                }
            });
        });

        /*----for-fix-menu-when-scroll----------------------*/
        $(window).scroll(function () {
            if ($(document).scrollTop() > 50) {
                $('.navigation').addClass('fix-nav');
            }
            else {
                $('.navigation').removeClass('fix-nav');
            }
        })
        /*--for-responsive-menu-----------------*/
        $(document).ready(function () {
            $('.toggle').click(function () {
                $('.toggle').toggleClass('active')
                $('.navigation').toggleClass('active')
            })
        })

    </script>
</body>
</html>