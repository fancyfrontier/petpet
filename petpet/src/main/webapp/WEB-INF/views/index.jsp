<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PetPet Online Shop</title>
    <!--stylesheet-->
    <link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />	
    <!--light-slider-css-->
    <link rel='stylesheet' href="<c:url value='/css/lightslider.css' />" type="text/css" />
    <!--jQuery-------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
    <!--light-slider-js-->
    <script type="text/javascript" src="<c:url value='/js/jQuery.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/lightslider.js' />"></script>
    <!--fav-icon------------------->
    <link rel="shortcut icon" href="${basePath}/EEIT3101/images/Member/fav-icon.ico" />
    <!--using-FontAwesome-for-Icons-->
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
    <style>
    .tip{
            color: red;
            font-size: 10px;
        }
    input::-webkit-input-placeholder {
    font-size: 16px;
	}
    </style>
</head>
<script type="text/javascript">

	

</script>
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
                <li><a href="<c:url value='/member/MemberCenter'/>">會員中心</a></li>
            </ul>
            <!--right-menu------->
            <div class="right-menu">
                <!--search-->
                <a href="javascript:void(0);" class="search">
                    <i class="fas fa-search"></i>
                </a>
                <!--user-->
                <a href="javascript:void(0);" class="user">
                    <i class="fas fa-user"></i>
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

    <!--login-and-sign-up-form--------------------->
    <div class="form">
        <!--login-------------------->
        <div class="login-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>會員登入</strong>
            <!--inputs-->
            <form>
                <input id="loginInput" type="email" style="font-size:16px" placeholder="請輸入電子信箱" name="loginEmail" required>
                <input id="loginInputPwd" type="password" style="font-size:16px" placeholder="請輸入密碼" name="loginPassword" required>
                <!--submit-btn-->
                <input type="button" value="登入"  id="loginOutput" onclick="sendLoginData()">
                <span id="verifyBox" class="tip"></span>
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="<c:url value='/ForgotPassWord'/>" class="forget">忘記密碼？</a>
                <a href="javascript:void(0);" class="sign-up-btn">建立帳戶</a>
            </div>

        </div>


        <!--Sign-up-------------------->
        <div class="sign-up-form">
            <!--cancel-btn--------->
            <a href="javascript:void(0);" class="form-cancel">
                <i class="fas fa-times"></i>
            </a>

            <!--heading---->
            <strong>建立帳戶</strong>
            <!--inputs-->
            <form method="post" action="<c:url value='/Registermember'/>">
                <input type="email" style="font-size:16px" id="signInput" placeholder="請輸入電子信箱" name="email">
                <span id="signInputShowBox" class="tip"></span>
                <input type="password" style="font-size:16px" id="signInputPwd" placeholder="請輸入8~20字元的英數字，不可有特殊符號" name="password">
                <span id="signInputPwdShowBox" class="tip"></span>
                <input type="password"  style="font-size:16px"id="signCheckPwd" placeholder="請輸入再次輸入相同的密碼" name="cpassword">
                <span id="signCheckShowBox" class="tip"></span>
                <!--submit-btn-->
                <input type="submit" id="signOutput" value="註冊" disabled="true">
                <span id="result0c" class="tip"></span>
            </form>
            <!--forget-and-sign-up-btn-->
            <div class="form-btns">
                <a href="javascript:void(0);" class="already-acount">已經是會員？</a>
            </div>

        </div>

    </div>
    
    <!--Full-slider--------------------------------------------------------------->

    <ul id="adaptive" class="cs-hidden">
        <!--box-1---------------------->
        <li class="item-a">
            <!--box---------------->
            <div class="full-slider-box f-slide-1">
                <!--slider-text-container----------->
                <div class="slider-text-container">

                    <div class="f-slider-text">
                        <span>Limited offer</span>
                        <strong>30% off<br /> with <Font>promo code</Font></strong>
                        <a href="#" class="f-slider-btn">Shop Now</a>
                    </div>

                </div>
            </div>
        </li>

        <!--box-2---------------------->
        <li class="item-a">
            <!--box---------------->
            <div class="full-slider-box f-slide-2">
                <!--slider-text-container----------->
                <div class="slider-text-container">

                    <div class="f-slider-text">
                        <span>Limited offer</span>
                        <strong>30% off<br /> with <Font>promo code</Font></strong>
                        <a href="#" class="f-slider-btn">Shop Now</a>
                    </div>

                </div>
            </div>
        </li>

        <!--box-3---------------------->
        <li class="item-a">
            <!--box---------------->
            <div class="full-slider-box f-slide-3">
                <!--slider-text-container----------->
                <div class="slider-text-container">

                    <div class="f-slider-text">
                        <span>Limited offer</span>
                        <strong>30% off<br /> with <Font>promo code</Font></strong>
                        <a href="#" class="f-slider-btn">Shop Now</a>
                    </div>

                </div>
            </div>
        </li>
    </ul>

    <!--Feature-Categories-------------------------------->
    <div class="feature-heading">
        <h2>精選推薦</h2>
    </div>

    <ul id="autoWidth" class="cs-hidden">
        <!----1------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="<c:url value='/images/feature_1.jpg' />" />
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----2------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="<c:url value='/images/feature_2.jpg' />" />
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----3------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="<c:url value='/images/feature_3.jpg' />" />
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----4------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="<c:url value='/images/feature_4.jpg' />" />
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----5------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="<c:url value='/images/feature_5.jpg' />" />
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

        <!----6------------------------------------>
        <li class="item">
            <!--feature-box-->
        <div class="feature-box">
        <a href="#">
            <img src="<c:url value='/images/feature_6.jpg' />" />
        </a>
        </div>
        <!--text---------------------------->
        <span>T-shirt</span>
        </li>

    </ul>

    <!--new-arrival------------------->
    <section class="new-arrival">
        <!--heading------->
        <div class="arrival-heading">
            <strong>新品上架</strong>
            <p>我們總能提供給您 最安心 最實惠的 毛小孩用品</p>
        </div>
        <!--product-container----------------->
        <div class="product-container">
            <!--product-box-1-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-1.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>

            </div>

            <!--product-box-2-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-2.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-3-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-3.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-4-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-4.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-5-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-5.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-6-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-6.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-7-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-7.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-8-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-8.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-9-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-8.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-10-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-8.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

        </div>

    </section>

    <!---sale------------------------------------>
    <section class="sale">
        <!--sale-box-1-------------------->
        <div class="sale-box sale-1">
            <img src="<c:url value='/images/sale-1.jpg' />" />
            
            <a href="#">
            <div class="sale-text">
              <strong>Bag with rose pattern</strong>
              <span>Sale off 25%</span>
            </div></a>
        
          </div>
           <!--sale-box-2-------------------->
        <div class="sale-box sale-1">
          <img src="<c:url value='/images/sale-2.jpg' />" />
          
          <a href="#"><div class="sale-text">
            <strong>Hello Summer</strong>
            <span>Sale off 20%</span>
          </div></a>
      
        </div>
         <!--sale-box-3-------------------->
         <div class="sale-box sale-1">
          <img src="<c:url value='/images/sale-3.jpg' />" />
          
          <a href="#">
          <div class="sale-text">
            <strong>Let's Party Hard Pillow</strong>
            <span>Sale off 25%</span>
          </div></a>
      
        </div>
     
    </section>

    <!--new-arrival------------------->
    <section class="new-arrival">
        <!--heading------->
        <div class="arrival-heading">
            <strong>必購好物</strong>
            <p>還在等什麼？ 趕快帶回家給自己的毛主子吧！</p>
        </div>
        <!--product-container----------------->
        <div class="product-container">
            <!--product-box-1-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-1.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>

            </div>

            <!--product-box-2-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-2.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-3-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-3.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>

            <!--product-box-4-->
            <div class="product-box">
                <!--img---->
                <div class="product-img">
                    <!--add-cart----------->
                <a href="#" class="add-cart">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                    <img src="<c:url value='/images/p-4.jpg' />" />
                </div>

                <!--details-->
                <div class="product-details">
                    <a href="#" class="p-name">Drawstring T-shirt</a>
                    <span class="p-price">$22.00</span>
                </div>
                
            </div>
</div>
</section>

    <!--banner-------------------------------------->

    <!--box---------------->
    <div class="banner-box f-slide-1">
        <!--slider-text-container----------->
        <div class="banner-text-container">

            <div class="banner-text">
                <span>Limited offer</span>
                <strong>30% off<br /> with <Font>promo code</Font></strong>
                <a href="#" class="banner-btn">Shop Now</a>
            </div>

        </div>
    </div>

<!--services--------------------------------------------->
    <section class="services">
        <!--service-box-1-------------------->
        <div class="services-box">
            <i class="fas fa-shipping-fast"></i>
            <span>免運費</span>
            <p>額滿即享免運費</p>
        </div>

        <!--service-box-2-------------------->
        <div class="services-box">
            <i class="fas fa-headphones-alt"></i>
            <span>24小時客服</span>
            <p>提供即時在線服務</p>
        </div>

        <!--service-box-3-------------------->
        <div class="services-box">
            <i class="fas fa-sync"></i>
            <span>鑑賞期內 100%退款</span>
            <p>購回一周內若不滿意，享全額退款</p>
        </div>
    </section>

<!--footer--------------------------------------->
    <footer>
        <!--copyright----------------->
        <span class="copyright">
            Copyright 2021 - EEIT31全端工程師課程第7組
        </span>
        <!--subscribe--->
        <div class="subscribe">
            <form>
                <input type="email" placeholder="Example@gmail.com" required/>
                <input type="submit" value="Subscribe">
            </form>
        </div>
    </footer>

    <!--script-------->
    <script type="text/javascript">

    /*--------------------Spring-RESTful-Login-account-check----------------------*/
	
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
					loginAccount = false;
					loginMessage = "帳號或密碼錯誤";
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
        $(document).ready(function() {
        $('#autoWidth').lightSlider({
        autoWidth:true,
        loop:true,
        onSliderLoad: function() {
            $('#autoWidth').removeClass('cS-hidden');
        } 
    });  
  });

  /*----for-fix-menu-when-scroll----------------------*/
  $(window).scroll(function(){
      if($(document).scrollTop() > 50){
          $('.navigation').addClass('fix-nav');
      }
      else{
        $('.navigation').removeClass('fix-nav');
      }
  })
  /*--for-responsive-menu-----------------*/
  $(document).ready(function(){
      $('.toggle').click(function(){
          $('.toggle').toggleClass('active')
          $('.navigation').toggleClass('active')
      })
  })

    </script>
</body>
</html>