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
    <title>常用配送修改</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
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
        .choose{
            height: 50px;
            font-size: larger;
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
                <h1>常用配送</h1>
                <form method="post" action="<c:url value='/UpdateMemberAdress'/>">
                    <div>
                        <h4 class="MemberNum">
                            <input class="MemberNum MemberNumInput" readonly type="Hidden" id="memberid" name="memberid"
                                value="${member.memberid}">
                        </h4>
                    </div>
                    <div class="input-group input-group-lg div">
                        <span class="input-group-text ">收件人姓名</span>
                        <input type="text" class="form-control" placeholder="收件人姓名" name="postname" value="${member.postname}">
                    </div>
                    
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">收件聯絡號碼</span>
                        <input type="text" class="form-control" placeholder="收件聯絡號碼" name="postmobile" value="${member.postmobile}">
                    </div>
                    
                    <div id="twzipcode" class="input-group flex-nowrap input-group-lg">
                        <span class="input-group-text">收件地址</span>
                        <div data-role="county" data-style="form-control choose" id="city" data-name="city" data-value="${member.city}"></div>
                        <div data-role="district" data-style="form-control choose" id="region" data-name="region"  data-value="${member.region}"></div>
                        <div data-role="zipcode" data-style="form-control choose" id="postalcode" data-name="postalcode" data-value="${member.postalcode}"></div>
                    </div>
                    <div class="form-group div">
                        <input type="text" class="choose form-control" id="address" name="address" placeholder="詳細地址" value="${member.address}">
                    </div>
                    <div class="btnBlock gap-2 col-6 mx-auto container">
                            <input class="button btn btn-success" type="submit"
                                style="width:200px;height:40px;" value="修改">
                            <input class="button btn btn-success" type="button"
                                style="width:200px;height:40px;" value="返回"  onclick="backBtn()">
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

            /*------Adress-Code------*/
            $("#twzipcode").twzipcode({   
            });

            function backBtn(){
    			window.location.assign("<c:url value='/member/MemberCenter'/>");
    		}

        </script>
</body>
</html>