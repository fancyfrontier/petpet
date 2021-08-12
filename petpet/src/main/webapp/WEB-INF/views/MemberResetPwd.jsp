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
            margin:30px auto;
            width: 600px;
        }
        .button {
            margin: 0 auto;
            border: none;
        }
        .tip{
        	color: red;
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
                <h1 class="div" style="text-align: center;">重設密碼</h1>
                <form method="post" action="<c:url value='/ResetPassword'/>">
                <input type="hidden" name="token" value="${token}"/>	
                    <div class="input-group input-group-lg div mb-3">
                        <span class="input-group-text ">密碼</span>
                        <input type="password" class="form-control" placeholder="請輸入密碼" name="password" value="" id="signInputPwd"
                        		required autofocus id="password" onKeyUp=pwStrength(this.value) onBlur=pwStrength(this.value)>
                    </div>
                    <div align='center' valign="middle">
                    	<span id="signInputPwdShowBox" class="tip"></span>
                    </div>
                    <div align='center' valign="middle">
        				安全性<table width="500" border="1" cellspacing="0" cellpadding="1" bordercolor="#eeeeee" height="22" style='display:inline'>  
        				<tr align="center" bgcolor="#f5f5f5">  
        				<td width="100px" id="strength_L"></td>  
        				<td width="100px" id="strength_M"></td>  
        				<td width="100px" id="strength_H"></td>  
        				</tr>  
        				</table><br>  
        				
                    </div>
                    <div class="input-group flex-nowrap input-group-lg div">
                        <span class="input-group-text">密碼確認</span>
                        <input type="password" class="form-control" placeholder="請再次輸入密碼" name="confirmPassword" value=""  id="signCheckPwd"
                        		required>
                    </div>
					<div align='center' valign="middle">
                        <span id="signCheckShowBox" class="tip"></span>
                        <span id="result0c" class="tip"></span>
                    </div>
                    
                    
                    <div class="btnBlock gap-2 col-6 mx-auto container div">
                            <input class="button btn btn-success" type="submit" id="signOutput"
                                style="width:200px;height:40px;" disabled="true" value="送出">
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

		var signPassword = false, signCheckPassword = false;

		const input2 = document.getElementById('signInputPwd');
        const input3 = document.getElementById('signCheckPwd');
        var div = document.getElementById('result0c');

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
        if (signPassword == true && doubleLock == true) {
            document.getElementById("signOutput").disabled = false;
        } else {
            document.getElementById("signOutput").disabled = true;
        }
        console.log("doubleLock  " + doubleLock);
        console.log("signAccount  " + signAccount);
        console.log("signPassword  " + signPassword);
        console.log("emailCheck  " + emailCheck);
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
        
		function checkPasswordMatch(fieldConfirmPassword){
			if(fieldConfirmPassword.value != $("#password").val()){
				fieldConfirmPassword.setCustomValidity("密碼不一致");
				}else{
				fieldConfirmPassword.setCustomValidity("");
				}
			}
        </script>
</body>
</html>