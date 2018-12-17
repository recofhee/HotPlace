<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<style>
h2 {
   text-align: center;
   padding-top: 150px;
   margin: 0 auto;
}

h3 {
   text-align: center;
   margin: 0 auto;
   padding-top: 20px;
}

.under {
   display: inline-block;
   width: 120px;
   min-width: 70px;
   border-right: 3px solid #e4e2e2;
   padding: 0 10px 10px 0;
   font-size: 1.2em;
   font-weight: bold;
   
}

.container {
   width: 90%;
   margin: 0 auto;
}

.person-outer {
   width:650px;
   margin:0 auto;
   border-top: 2px solid gray;
   border-bottom: 2px solid gray;
   padding:30px 0;
   
}
.person {
   height: 140px;
   width: 700px;
   margin: 0 auto;
   
}

.box {
   width: 650px;
   height: 170px;
   margin: 0 auto;
   margin-bottom: 20px;
}

table td {
   font-size: 15px;
   
   
   
}

.button {
   display: inline-block;
   vertical-align: top;
   height: 35px;
   width: 120px;
   line-height: 34px;
   padding: 0 25px;
   font-size: 12px;
   color: #bbb;
   text-align: center;
   text-decoration: none;
   background-color: #303030;
   border-radius: 10px;
   margin-left: 10px;
   background-image: linear-gradient(to bottom, #3d3d3d, #272727);
}

#container {
   width: 90%;
   margin: 0 auto;
}

.button:active, .button.active {
   line-height: 34px;
   color: #ccc;
}

input[type='text'] {
   width: 200px;
   height: 30px;
   border: 1px solid gray;
   float: left;
   font-size: 15px;
}

input[type='password'] {
   width: 200px;
   height: 30px;
   border: 1px solid gray;
   float: left;
   font-size: 15px;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 10%;
   height: 50px;
   padding: 0;
   font-size: 17px;
   color: white;
   text-align: center;
   background: #d43b79eb;
   border: 0;
   cursor: pointer;
}

.signUpButton2 {
   position: relative;
   vertical-align: top;
   width: 10%;
   height: 50px;
   padding: 0;
   font-size: 17px;
   color: white;
   text-align: center;
   background: #e60d0d6b;
   border: 0;
   cursor: pointer;
}
</style>

</head>
<body>
   <div class="container">
      <h2 align="center">회원 탈퇴</h2>

      <div class="box" style="background: url(images/memberToegeo.jpg);">

      </div>
      <form action="memberWithdrawal" method="post" name="frm" id="frm">
            <div class="person-outer">
            <table class="person">
   
               <tr>
                  <td height="20px" align="center" ><span class="under">이메일</span></td>
                  <td><input style="height: 30px; width: 200px;" type="text" name="email" id="email" size="20" value="${vo.email}" readonly></td>
               </tr>
               <tr>
                  <td height="20px" align="center" > <span class="under">비밀번호</span></td>
                  <td><input id = "pw" type="password" name="pw" size="20"><p>&nbsp;&nbsp;&nbsp;${message}</p></td>
               </tr>
            </table>
            </div>
            <h3>회원 탈퇴 시 회원님의 모든 정보가 바로 삭제되어집니다.^^</h3>
            <div
               style="text-align: center; padding-top: 30px; margin-right: 55px; margin: 0 auto;">
               <input  type="submit" value="확인" class="signUpButton"> <!-- type="submit" -->
               &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" onclick="location.href='main'" value="취소" class="signUpButton2">
            </div>
            
            <div id="confirm-resv" class="confirm-resv" title="예약 정보가 있을 시 탈퇴 불가능합니다.">
               <!-- <h5><i class="far fa-check-circle" style="margin-right: 10px;"></i>예약 내역이 있습니다. 삭제시 탈퇴 가능합니다.</h5> -->
               <div id="resv"></div>
               <div class="row">
                  <div class="resv-info flex1 w100"></div>
                  <div class="vertical-hr"></div>
                  <div class="tab-wrap flex1 w100"></div>
               </div>
            </div>
      </form>
   </div>
   
   
 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

</body>
</html>