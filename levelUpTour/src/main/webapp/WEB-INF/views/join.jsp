<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>
        <link href="${path}/member/css/style.css" rel="stylesheet">
        <script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
        <script>
        $(function(){
            $("#loginbtn").click(function(){
                if((String)request.getAttribute("loginFailMsg") != null) {
          	     	alert('${loginFailMsg}');	
                } 
            });
        });
        
        
        function checks() {
        	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
        	var getName= RegExp(/^[가-힣]+$/);
        	var getPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
        	
        	// 이메일 공백 확인
        	if($("#email").val() == ""){
        		alert("공백없이 작성해주세요.");
        		$("#email").focus();
        		return false;
        	}
        	
        	// 이메일 유효성 검사
        	if(!getMail.test($("#email").val())){
        		alert("이메일형식에 맞게 입력해주세요.");
        		$("#email").val("");
        		$("#email").focus();
        		return false;
        	}
        	
        	// 이름 유효성 검사
        	if(!getName.test($("#name").val())){
        		alert("한국어로 이름을 작성해주세요.");
        		$("#name").val("");
        		$("#name").focus();
        		return false;
        	}
        	
        	// 휴대폰번호 유효성 검사
        	if(!getPhone.test($("#phone").val())){
        		alert("휴대폰번호를 제대로 작성해주세요.");
        		$("#phone").val("");
        		$("#phone").focus();
        		return false;
        	}
        	
        	return true;
        }
        </script>
    </head>
    <body>
        <div class="wrap" style="background-image: url(../member/img/제주도사진.jpeg);">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                	 <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                  	<button type="button" class="togglebtn" onclick="register()">REGISTER</button> 
                </div>
                <div class="social-icons">
                	 <a href="https://kauth.kakao.com/oauth/authorize?client_id=637cc7db249a5fbb47607ade4bf2f7d2&redirect_uri=http://localhost:8090/kaoLogin&response_type=code">
                    	<img src="${path}/member/img/ka.JPG" alt="kakao">
        			</a>
                    <img src="${path}/member/img/gl.png" alt="google">
                </div>
                <form method="post" id="login" action="${path}/normal-login" class="input-group">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="email" name="email" class="input-field" placeholder="User Email" required>
                    <input type="password" name="password" class="input-field" placeholder="Enter Password" required>
                    <button type="submit" class="submit" id="loginbtn">Login</button>
                </form> 
             <form method="post" id="register" action="${path}/join/end" class="input-group" onclick="return check();">
                	<input type="hidden" name="platformtype" value="normal">
                	<input type="hidden" name="auth" value="user">
                    <input type="text" id="name" name="name" class="input-field" placeholder="User name" required>
                    <input type="email" id="email" name="email" class="input-field" placeholder="Your Email" required>
                    <input type="password" name="password" class="input-field" placeholder="Enter Password" required>
                    <input type="text" id="phone" name="phone" class="input-field" placeholder="Your Phone number" required>
                    <button type="submit" class="submit" >REGISTER</button>
             </form>     
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            
        </script>
    </body>
</html>