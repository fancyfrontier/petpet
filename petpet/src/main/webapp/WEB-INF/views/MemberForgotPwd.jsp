<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>忘記密碼</title>
    <!--stylesheet-->
    <link rel="stylesheet" type="text/css" href="css/style.css">
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
        .text{
            margin-left: 195px;
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
                <h1 class="div" style="text-align:center; color=red;">忘記密碼</h1>
                <form method="post" action="<c:url value='/ForgotPassWordSend'/>">
                    <div class="input-group input-group-lg">
                        <span class="input-group-text ">電子信箱</span>
                        <input type="email" class="form-control" placeholder="請輸入電子信箱" name="email" value="">
                    </div>
                    <div style="text-align:center;color:red">
               			<c:if test="${error != null}">
                   			<p><c:out value="${error}"/><p>
               			</c:if>
            		</div>
                    <br><span class="text">您將收到重新設定密碼的連結</span>
                    <div class="btnBlock gap-2 col-6 mx-auto container div">
                            <input class="button btn btn-success" type="submit"
                                style="width:200px;height:40px;" value="寄送">
                            <input class="button btn btn-success" type="button"
                                style="width:200px;height:40px;" value="返回" onclick="backBtn()">
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
        
        	function backBtn(){
				window.location.assign("<c:url value='/index'/>");
			}
			
        </script>
</body>
</html>