<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員登入</title>
    <!--stylesheet-->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--light-slider-css-->
    <link rel="stylesheet" type="text/css" href="css/lightslider.css">
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
            width: 800px;
            height: 800px;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
            display: flex;
            flex-wrap: wrap;
            border-radius: 10px;
            border: solid 1px rgba(0, 0, 0, 0.3);
            box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
        }
        .dataBlock {
            margin: auto;
        }
        .button {
            margin: 0 auto;
            border: none;
        }
        .tip {
            font-size: 1px;
            color: red;
        }
        .outSide {
            margin: 40px auto;
            width: 600px;
        }
        .inSide {
            width: 400px;
        }
        form {
            margin: 80px;
            right: 100px;
        }
        .upButton {
            margin: 0 auto;
        }
        .sub {
            margin: 50px;
        }
        .test{
            margin-top:60px;
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

        <!----------------------------------------------NEW!!Strat!!-------------------------------------------->


        <div class="block">
            <div class="dataBlock" style="text-align:center;">
                <h1 class="test">會員中心</h1>
                <div class="outSide">
                    <nav class="">
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <button class="nav-link active upButton" id="login" data-bs-toggle="tab" data-bs-target="#nav-home"
                                type="button" role="tab" aria-controls="nav-home" aria-selected="true">　　　　　登入會員　　　　　</button>
                            <button class="nav-link upButton" id="signIn" data-bs-toggle="tab" data-bs-target="#nav-profile"
                                type="button" role="tab" aria-controls="nav-profile"
                                aria-selected="false">　　　　　註冊會員　　　　　</button>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="login">
                            <form>
                                <div class="mb-3 ">
                                    <label for="logInput" class="form-label">會員帳號</label>
                                    <input style="width:440px;" type="email" class="form-control" id="loginInput" placeholder="請輸入Email" name="loginEmail">
                                    <span id="logInputShowBox" class="tip"></span>
                                </div>
                                <div class="mb-3 ">
                                    <label for="logInputPwd" class="form-label">密碼</label>
                                    <input style="width:440px;" type="password" class="form-control" id="loginInputPwd"
                                        placeholder="請輸入密碼" name="loginPassword">
                                    <span id="logInputPwdShowBox" class="tip"></span>
                                    <span id="verifyBox" class="tip"></span>
                                </div>
                                <div class="d-grid gap-2 col-6 mx-auto sub">
                                    <button type="button" class="btn btn-success" id="loginOutput" onclick="sendLoginData()">送出</button>
                                    <button type="button" class="btn btn-success" id="loginBack" onclick="Back()">返回</button>
                                </div>
                            </form>
                            <div class="form-btns">
                				<a href="<c:url value='/ForgotPassWord'/>" class="forget">忘記密碼？</a>
            				</div>
                        </div>
        
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="signIn">
                            <form method="post" action="<c:url value='/Registermember'/>">
                                <div class="mb-3 inSide">
                                    <label for="signInput" class="form-label">會員帳號</label>
                                    <input type="email" style="width:440px;" class="form-control" id="signInput" placeholder="請輸入Email" name="email">
                                    <span id="signInputShowBox" class="tip"></span>
                                </div>
                                <div class="mb-3 inSide">
                                    <label for="signInputPwd" class="form-label">密碼</label>
                                    <input type="password" style="width:440px;" class="form-control" id="signInputPwd" placeholder="請輸入8~20字元的英數字" 
                                    name="password" onKeyUp=pwStrength(this.value) onBlur=pwStrength(this.value)>
                                    <br>安全性　
        							<table width="500" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="22" style='display:inline'>  
        							<tr align="center" bgcolor="#f5f5f5">  
        							<td width="100px" id="strength_L"></td>  
        							<td width="100px" id="strength_M"></td>  
        							<td width="100px" id="strength_H"></td>  
        							</tr>  
        							</table><br>  
                                    <span id="signInputPwdShowBox" class="tip"></span>
                                </div>
                                <div class="mb-3 inSide">
                                    <label for="signCheckPwd" class="form-label">確認密碼</label>
                                    <input type="password" style="width:440px;" class="form-control" id="signCheckPwd" placeholder="請輸入相同密碼"
                                        name="cpassword">
                                    <span id="signCheckShowBox" class="tip"></span>
                                    <span id="result0c" class="tip"></span>
                                </div>
                                <div class="d-grid gap-2 col-6 mx-auto sub">
                                    <button type="submit" class="btn btn-success" id="signOutput" disabled="true">送出</button>
                                    <button type="button" class="btn btn-success" id="signBack" onclick="Back()">返回</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--script-------->
        <script>

        var loginAccount = false;
    	
    	const input4 = document.getElementById('loginInput');
    	var verifyBox = document.getElementById('verifyBox'),
    		loginInputAccount = document.getElementById('loginInput'),
    		outputLogin = document.getElementById('loginOutput')
    	
    	
    		function sendLoginData() {

    		var loginEmail = loginInputAccount.value,
    		loginPassword = loginInputPwd.value;
            
    		var xhr = new XMLHttpRequest();
    		xhr.open("POST", "<c:url value='/Login' />", true);
    		xhr.setRequestHeader("Content-Type",
    				"application/x-www-form-urlencoded");
    		xhr.send("loginEmail=" + loginEmail + "&" + "loginPassword=" + loginPassword);
    		var loginMessage = "";
    		xhr.onreadystatechange = function() {
    			// 伺服器請求完成
    			if (xhr.readyState == 4 && xhr.status == 200) {
    				var emailResult = JSON.parse(xhr.responseText);

    				if (emailResult.loginEmail.length == 0) {
    					loginAccount = true;
    					loginMessage = "";
    					window.location.assign("<c:url value='/index'/>");
    				}else {
        				if(emailResult.loginEmail.length == 3){
        					loginAccount = false;
        					loginMessage = "您輸入的是舊的密碼" + "　且上次更新日期為 " + emailResult.date;
            			}else{
            				loginAccount = false;
        					loginMessage = "帳號或密碼錯誤";
                    	}
    				}
    				verifyBox.innerHTML = "<font color='red' size='-2'>" + loginMessage + "</font>";
    			}
    		}
    	}



        
    	/*--------------------Spring-RESTful-account-check----------------------*/

    	var signAccount = false, signPassword = false, signCheckPassword = false, emailCheck = false;
        
        const input1 = document.getElementById('signInput');
        const input2 = document.getElementById('signInputPwd');
        const input3 = document.getElementById('signCheckPwd');
    	var div = document.getElementById('result0c');

        var signInputAccount = document.getElementById("signInput"),
            signInputAccountShowBox = document.getElementById("signInputShowBox");
    	
        input1.addEventListener('input', CheckAccount);

        function CheckAccount() {
            if (signInputAccount.value == "") {
                signInputAccountShowBox.innerHTML = "請輸入Email";
                signAccount = false;
                Lock();
            }
            if (signInputAccount.value == "") {
                signInputAccountShowBox.innerHTML = "不可空白";
                signAccount = false;
                Lock();
            } else {
                var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                if (signInputAccount.value.search(emailRule) != -1) {
                    signInputAccountShowBox.innerHTML = "";
                    signAccount = true;

                    var email = signInputAccount.value;
                    
            		var xhr = new XMLHttpRequest();
            		xhr.open("POST", "<c:url value='/CheckEmailRepeat' />", true);
            		xhr.setRequestHeader("Content-Type",
            				"application/x-www-form-urlencoded");
            		xhr.send("email=" + email);
            		var message = "";
            		xhr.onreadystatechange = function() {
            			// 伺服器請求完成
            			if (xhr.readyState == 4 && xhr.status == 200) {
            				var result = JSON.parse(xhr.responseText);

            				if (result.email.length == 0) {
            					emailCheck = true;
            					message = "";
            					Lock();
            				}else {
            					emailCheck = false;
            					message = "帳號重複，請重新輸入帳號";
            					Lock();
            				}
            				div.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
            				console.log("emailCheck = " + emailCheck);
            			}
            		}
                    
                } else {
                    signInputAccountShowBox.innerHTML = "Email格式錯誤";
                    signAccount = false;
                    Lock();
                }
            }
        }

        var signInputPwd = document.getElementById("signInputPwd"),
            signInputPwdShowBox = document.getElementById("signInputPwdShowBox"),
            signInputDoubleCheck = false;

        input2.addEventListener('input', CheckPassword);

        function CheckPassword() {
            if (signInputPwd.value == "") {
                signInputPwdShowBox.innerHTML = "請輸入密碼";
                signPassword = false;
                signInputDoubleCheck = false;
            }
            if (signInputPwd.value == "") {
                signInputPwdShowBox.innerHTML = "不可空白";
                signPassword = false;
                signInputDoubleCheck = false;
            } else {
                if (signInputPwd.value.length < 8) {
                    signInputPwdShowBox.innerHTML = "至少要8字元";
                    signPassword = false;
                    signInputDoubleCheck = false;
                } else {
                    var a = /[0-9]/;
                    var b = a.test(signInputPwd.value);
                    if (b == true) {
                        var c = /[a-z]/i;
                        var b = c.test(signInputPwd.value);
                        if (b == true) {
                            signInputPwdShowBox.innerHTML = "";
                            signPassword = true;
                            signInputDoubleCheck = true;
                        } else {
                            signInputPwdShowBox.innerHTML = "必須含有英數字";
                            signPassword = false;
                            signInputDoubleCheck = false;
                        }
                    } else {
                        signInputPwdShowBox.innerHTML = "必須含有英數字";
                        signPassword = false;
                        signInputDoubleCheck = false;
                    }
                }
            }
        }

        var signCheckPwd = document.getElementById("signCheckPwd"),
            signCheckShowBox = document.getElementById("signCheckShowBox");

        input3.addEventListener('input', CheckDoublePassword);

        function CheckDoublePassword() {
            if (signCheckPwd.value == "") {
                signCheckShowBox.innerHTML = "請再次輸入密碼";
            }
            if (signCheckPwd.value == "") {
                signCheckShowBox.innerHTML = "不可空白";
            } else {
                if (signCheckPwd.value.length < 8) {
                    signCheckShowBox.innerHTML = "至少要8字元";
                } else {
                    var a = /[0-9]/;
                    var b = a.test(signCheckPwd.value);
                    if (b == true) {
                        var c = /[a-z]/i;
                        var b = c.test(signCheckPwd.value);
                        if (b == true) {
                            if (signCheckPwd.value == signInputPwd.value && signInputDoubleCheck == true) {
                                signCheckShowBox.innerHTML = "";
                            } else {
                                signCheckShowBox.innerHTML = "請輸入相同密碼";
                            }
                        } else {
                            signCheckShowBox.innerHTML = "必須含有英數字";
                        }
                    } else {
                        signCheckShowBox.innerHTML = "必須含有英數字";
                    }
                }
            }
            Lock();
        }
        
        var doubleLock = false;
    	
        function CheckAgain() {
            if (signInputPwd.value == signCheckPwd.value) {
                doubleLock = true;
                signCheckShowBox.innerHTML = "";
            } else {
                doubleLock = false;
                signCheckShowBox.innerHTML = "請輸入相同密碼";
            }
            Lock();
        }
        input2.addEventListener('input', CheckAgain);
        input3.addEventListener('input', CheckAgain);
            
        function Lock() {
            if (signAccount == true && signPassword == true && doubleLock == true && emailCheck == true) {
                document.getElementById("signOutput").disabled = false;
            } else {
                document.getElementById("signOutput").disabled = true;
            }
            console.log("doubleLock  " + doubleLock);
            console.log("signAccount  " + signAccount);
            console.log("signPassword  " + signPassword);
            console.log("emailCheck  " + emailCheck);
        }

        function Back(){
			window.location.assign("<c:url value='/index'/>");
		}

	////////////////////////////////////////////////計算密碼強度//////////////////////////////////////////////////////
	
	
	//判斷輸入密碼的類型  
        function CharMode(iN){  
        if (iN>=48 && iN <=57) //數字
        return 1;  
        if (iN>=65 && iN <=90) //大寫 
        return 2;  
        if (iN>=97 && iN <=122) //小寫  
        return 4;  
        else  
        return 8;   
        }  
        //bitTotal函数  
        //計算密碼模式 
        function bitTotal(num){  
        modes=0;  
        for (i=0;i<4;i++){  
        if (num & 1) modes++;  
        num>>>=1;  
        }  
        return modes;  
        }  
        //確認密碼安全等級  
        function checkStrong(sPW){  
            if (sPW.length<=4)  
            return 0; //密碼太短  
            Modes=0;  
            for (i=0;i<sPW.length;i++){  
            //密碼模式  
            Modes|=CharMode(sPW.charCodeAt(i));  
            }  
            return bitTotal(Modes);  
        }  
          
        //顯示顏色  
        function pwStrength(pwd){  
        O_color="#eeeeee";  
        L_color="#FF0000";  
        M_color="#FF9900";  
        H_color="#33CC00";  
        if (pwd==null||pwd==''){  
        Lcolor=Mcolor=Hcolor=O_color;  
        }  
        else{  
        S_level=checkStrong(pwd);  
        switch(S_level) {  
        case 0:  
        Lcolor=Mcolor=Hcolor=O_color;  
        case 1:  
        Lcolor=L_color;  
        Mcolor=Hcolor=O_color;  
        break;  
        case 2:  
        Lcolor=Mcolor=M_color;  
        Hcolor=O_color;  
        break;  
        default:  
        Lcolor=Mcolor=Hcolor=H_color;  
        }  
        }  
        document.getElementById("strength_L").style.background=Lcolor;  
        document.getElementById("strength_M").style.background=Mcolor;  
        document.getElementById("strength_H").style.background=Hcolor;  
        return;  
        }  

    ////////////////////////////////////////////////計算密碼強度/////////////////////////////////////////////////////	
        </script>
</body>
</html>