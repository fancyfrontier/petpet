<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!--jQuery-------->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--BookStrap-------------------->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
        <!--Adress--js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
    <title>修改會員資料</title>
    <style>
        .test {
            border: solid 1px rgba(0, 0, 0, 0.3);
            box-shadow: 1px 1px 9px rgba(0, 0, 0, 0.3);
        }

        .title{
            background-color: #435D7D;
            color: white;
        }

        .out {
            width: 1000px;
            margin: auto;
            padding-top: 50px;
        }

        .inputBlock{
            margin: auto;
            margin-top: 50px;
            width: 700px;
        }
        .div {
            margin: 60px auto;
            width: 600px;
        }
        .btnDiv{
            margin: 40px auto;
            width: 600px;
        }

        .btnBlock {
            width: auto;
            display: flex;
            justify-content: center;
        }
        .last{
            margin-top: 50px;
        }
        .image{
		max-width: 250px;
		margin: 0px;
		}
		#demo{
  		max-width:200px;
  		max-height:150px;
  		}
  		.msgBox{
            font-size: xx-large;
            color: #467e14;
        }
        .choose{
            height: 50px;
            font-size: larger;
        }
    </style>
</head>

<body>
    <div class="out">
        <div>
            <h1 class="title" style="text-align:center">修改會員資料</h1>
        </div>
        <form id="form" class="test">
            <input type="hidden" class="form-control" name="memberid" id="memberid" value=${memberid}>
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text ">會員名稱</span>
                <input type="text" class="form-control" value="${fullname}" id="fullname" name="fullname" required="required">
            </div>
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text ">會員大頭照</span>
                <img src="${pageContext.request.contextPath}/product/display/${memberid}" class="image" alt="">
            </div>
            <input type="file" class="form-control inputBlock" placeholder="" name="image" id="imgupload" required="required">
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text ">大頭照預覽</span>
                <img id="demo" />
                <p id="error_file"></p>
            </div>
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text">性別</span>
                <div class="btn-group">
                	<c:set var="gd" value="${gender}" />
                		<select id="gender">
                	<c:choose>
                		<c:when test="${gender==null}">
                			<option selected>請選擇</option>
                		</c:when>
                		<c:otherwise>
                			<option>請選擇</option>
                		</c:otherwise>
                	</c:choose>          		
                	<c:choose>
                		<c:when test="${gender=='男'}">
                			<option selected>男</option>
                		</c:when>
                		<c:otherwise>
                			<option>男</option>
                		</c:otherwise>
                	</c:choose>
                    <c:choose>
                    	<c:when test="${gender=='女'}">
                    		<option selected>女</option>
                    	</c:when>
                    	<c:otherwise>
                    		<option>女</option>
                    	</c:otherwise>
                    </c:choose>  
                    	</select>                      
                    <input type="hidden" id="genderInput" name="gender" value="${gender}">
                </div>
            </div>
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text ">生日</span>
                <input class="form-control" type="date" id="birthday" name="birthday" value="${birthday}">
            </div>
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text ">手機號碼</span>
                <input type="text" class="form-control" placeholder="" id="mobile" name="mobile" value="${mobile}">
            </div>
            <div id="twzipcode" class="input-group flex-nowrap input-group-lg inputBlock">
                        <span class="input-group-text">地址</span>
                        <div data-role="county" data-style="form-control choose" id="city" data-name="city" data-value="${city}"></div>
                        <div data-role="district" data-style="form-control choose" id="region" data-name="region"  data-value="${region}"></div>
                        <div data-role="zipcode" data-style="form-control choose" id="postalcode" data-name="postalcode" data-value="${postalcode}"></div>
            </div>
            <div class="input-group input-group-lg inputBlock">
                <span class="input-group-text ">詳細地址</span>
                <input type="text" class="form-control" placeholder="" id="address" name="address" value="${address}">
            </div>
            <div class="msgBox" style="text-align:center">
                <span id="message"></span>  
            </div>
            <div class="btnDiv btnBlock">
                <input type="text" id="submit" style="width:400px;height:40px;" class="btn btn-primary form-control inputBlock" value="送出資料">
            </div>
            <div class="btnDiv btnBlock container">
                <div class="">
                    <a href="#" style="width:400px;height:40px;" class="btn btn-success form-control  text-right">返回</a>
                </div>
            </div>	
        </form>
        
        <div class="last"></div>


    </div>
</body>
<script>

const choose = document.getElementById('gender');

choose.addEventListener("input", getOption)

function getOption() {
    var x = document.getElementById("gender")
    document.getElementById("genderInput").value = x.options[x.selectedIndex].text;
    console.log(document.getElementById("genderInput").value);
}

function myrefresh(){
	window.location.assign("<c:url value='/AdminShowAllMembers'/>");
}

	// 預覽功能 ，使用FileReader物件
$('#imgupload').change(function() {   
	  var file = $('#imgupload')[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
	    $('#demo').attr('src', e.target.result);
	  };
	  reader.readAsDataURL(file);
	});

	// AJAX送出新增表單
$(document).ready(function() {
    $("#submit").on("click", function() {
    	$("#submit").prop("disabled", true);//上傳一次
        var form = $("#form").serialize();
    	var data = new FormData($("#form")[0]);
                    $.ajax({
                        type: 'POST',
                        enctype: 'multipart/form-data',
                        data: data,
                        url: "/petpet/AdminUpdateMember", 
                        processData: false,  //將原本不是xml時會自動將所發送的data轉成字串(String)的功能關掉
                        contentType: false,  //默认值为contentType = "application/x-www-form-urlencoded".在默认情况下，内容编码类型满足大多数情况。但要上傳檔案，要設為False
                        cache: false,        //暫存取消
                        success: function(data, statusText, xhr) {  //	請求成功時執行函式,  前面新增的FormData物件放在第一個 ，第二個我不知道，第三個XMLHttpRequest(XHR) 物件發送
                        console.log(xhr.status);
                        if(xhr.status == "200") {
                            setTimeout( "myrefresh()",1500);  // Reload或轉到其他頁面
							$("#message").html("修改成功");
							$("#message").css("font-color","green");
							//window.location.assign("<c:url value='/index'/>");
                         }	   
                        },
                        error: function(e) {
							console.log('錯誤');
                        }
                    });
  
            });
        });
        
/*------Adress-Code------*/
$("#twzipcode").twzipcode({   
});


</script>

</html>