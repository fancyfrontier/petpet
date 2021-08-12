<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更改密碼</title>
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
        .span{
            width: 100%;
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: normal;
        }
        .tip {
            font-size: 3px;
            color: red;
            margin-top: 10px;
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
            <div class="dataBlock tab-pane">
                <h1>密碼修改</h1>
                <form method="post" action="<c:url value='/UpdateMemberPwdEdit'/>">
                    <div>
                        <h4 class="MemberNum">
                            <input class="MemberNum MemberNumInput" readonly type="Hidden" id="memberid" name="memberid"
                                value="${member.memberid}">
                        </h4>
                    </div>
                    <div class="input-group input-group-lg div">
                        <span class="input-group-text ">原本的密碼</span>
                        <input type="password" class="form-control" placeholder="請輸入原本的密碼" id="oldpassword" name="oldpassword" value="">
                        <span id="oldPwdShowBox" class="tip span"></span>
                    </div>
                    <div class="input-group input-group-lg div dataBlock">
                        <span class="input-group-text ">密碼</span>
                        <input type="password" class="form-control" placeholder="請輸入密碼" id="newpassword" name="newpassword" value=""><br>
                        <span id="newPwdShowBox" class="tip span"></span>
  
                    	
                    </div>
                    <div class="input-group input-group-lg div">
                        <span class="input-group-text ">確認密碼</span>
                        <input type="password" class="form-control" placeholder="請再次輸入密碼" id="checkpassword" name="checkpassword" value=""><br>
                        <span id="checkPwdShowBox" class="tip span"></span>
                        <span id="result0c" class="tip span"></span>
                    </div>

                    <div class="btnBlock gap-2 col-6 mx-auto container">
                        <input class="button btn btn-success" type="submit" style="width:200px;height:40px;" id="sendBtn" value="修改" disabled>
                        <input class="button btn btn-success" type="button" style="width:200px;height:40px;" value="返回" onclick="backBtn()">
                    </div>
                </form>
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
			window.location.assign("<c:url value='/member/MemberCenter'/>");
		}
        
        var oldPassword = false, newPassword = false, signCheckPassword = false, passwordExist = false;

            const input1 = document.getElementById('oldpassword');
            const input2 = document.getElementById('newpassword');
            const input3 = document.getElementById('checkpassword');
            var div = document.getElementById('result0c');

            var oldInputPwd = document.getElementById("oldpassword"),
                oldInputPwdShowBox = document.getElementById("oldPwdShowBox");

            input1.addEventListener('input', CheckOldPassword);

            function CheckOldPassword(){

            	if (oldInputPwd.value == "") {
            		oldInputPwdShowBox.innerHTML = "請輸入密碼";
                }
                if (oldInputPwd.value == "") {
                	oldInputPwdShowBox.innerHTML = "不可空白";
                } else {
                    	oldInputPwdShowBox.innerHTML = "";

                        var oldPwd = oldInputPwd.value;
                        
                		var xhr = new XMLHttpRequest();
                		xhr.open("POST", "<c:url value='/CheckPasswordExist' />", true);
                		xhr.setRequestHeader("Content-Type",
                				"application/x-www-form-urlencoded");
                		xhr.send("oldpassword=" + oldPwd);
                		var message = "";
                		xhr.onreadystatechange = function() {
                			// 伺服器請求完成
                			if (xhr.readyState == 4 && xhr.status == 200) {
                				var result = JSON.parse(xhr.responseText);

                				if (result.oldpassword.length == 0) {
                					passwordExist = true;
                					message = "";
                					Lock();
                				}else {
                					passwordExist = false;
                					message = "請輸入舊的密碼";
                					Lock();
                				}
                				div.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
                				console.log("passwordExist = " + passwordExist);
                			}
                		}
                }
         	}

            var newInputPwd = document.getElementById("newpassword"),
                newInputPwdShowBox = document.getElementById("newPwdShowBox"),
                pwdDoubleCheck = false;

            input2.addEventListener('input', CheckPassword);

            function CheckPassword() {
                if (newInputPwd.value == "") {
                    newInputPwdShowBox.innerHTML = "請輸入密碼";
                    newPassword = false;
                    pwdDoubleCheck = false;
                }
                if (newInputPwd.value == "") {
                    newInputPwdShowBox.innerHTML = "不可空白";
                    newPassword = false;
                    pwdDoubleCheck = false;
                } else {
                    if (newInputPwd.value.length < 8) {
                        newInputPwdShowBox.innerHTML = "至少要8字元";
                        newPassword = false;
                        pwdDoubleCheck = false;
                    } else {
                        var a = /[0-9]/;
                        var b = a.test(newInputPwd.value);
                        if (b == true) {
                            var c = /[a-z]/i;
                            var b = c.test(newInputPwd.value);
                            if (b == true) {
                                if(oldInputPwd.value != newInputPwd.value){
                                	newInputPwdShowBox.innerHTML = "";
                                    newPassword = true;
                                    pwdDoubleCheck = true;
                                }else{
                                	newInputPwdShowBox.innerHTML = "您輸入了變更前的密碼";
                                    newPassword = false;
                                    pwdDoubleCheck = false;
                                 }
                            } else {
                                newInputPwdShowBox.innerHTML = "必須含有英數字";
                                newPassword = false;
                                pwdDoubleCheck = false;
                            }
                        } else {
                            newInputPwdShowBox.innerHTML = "必須含有英數字";
                            newPassword = false;
                            pwdDoubleCheck = false;
                        }
                    }
                }
            }

            var checkPwd = document.getElementById("checkpassword"),
            checkPwdShowBox = document.getElementById("checkPwdShowBox");

            input3.addEventListener('input', CheckDoublePassword);

            function CheckDoublePassword() {
                if (checkPwd.value == "") {
                    checkPwdShowBox.innerHTML = "請再次輸入密碼";
                }
                if (checkPwd.value == "") {
                    checkPwdShowBox.innerHTML = "不可空白";
                } else {
                    if (checkPwd.value.length < 8) {
                        checkPwdShowBox.innerHTML = "至少要8字元";
                    } else {
                        var a = /[0-9]/;
                        var b = a.test(checkPwd.value);
                        if (b == true) {
                            var c = /[a-z]/i;
                            var b = c.test(checkPwd.value);
                            if (b == true) {
                                if (checkPwd.value == newInputPwd.value && pwdDoubleCheck == true) {
                                    checkPwdShowBox.innerHTML = "";
                                } else {
                                    checkPwdShowBox.innerHTML = "請輸入相同密碼";
                                }
                            } else {
                                checkPwdShowBox.innerHTML = "必須含有英數字";
                            }
                        } else {
                            checkPwdShowBox.innerHTML = "必須含有英數字";
                        }
                    }
                }
                Lock();
            }

            var doubleLock = false;

            function CheckAgain() {
                if (newInputPwd.value == checkPwd.value) {
                    doubleLock = true;
                    checkPwdShowBox.innerHTML = "";
                } else {
                    doubleLock = false;
                    checkPwdShowBox.innerHTML = "請輸入相同密碼";
                }
                Lock();
            }
            input2.addEventListener('input', CheckAgain);
            input3.addEventListener('input', CheckAgain);

            function Lock() {
                if (newPassword == true && pwdDoubleCheck == true && doubleLock == true && passwordExist == true) {
                    document.getElementById("sendBtn").disabled = false;
                } else {
                    document.getElementById("sendBtn").disabled = true;
                }
                console.log("doubleLock  " + doubleLock);
                console.log("newPassword  " + newPassword);
                console.log("pwdDoubleCheck  " + pwdDoubleCheck);
                console.log("passwordExist  " + passwordExist);
            }

			
        </script>
</body>
</html>