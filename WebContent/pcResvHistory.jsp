<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>총 예약 내역</title>
<style>
body{background-image: url(images/starback.jpg);
    background-repeat: no-repeat;
    background-size: cover;}

section{
   padding: 50px;
   padding-top: 150px;
   background: #000000a3;
}
.wrap{width: 960px;
     margin: auto;
     height: 600px;
     border: 0px solid black;
      overflow: scroll;
	-ms-overflow-style: none;}
::-webkit-scrollbar {display:none;} 	
.table{
      margin-top:50px;
      /* border: 1px solid black; */
      color: white;
   }

.table th {width: 180px; 
		   font-size: 15px;
		   vertical-align: middle !important; 
		   text-align: center;
		   border-top: 1px solid #eceeef2b !important;}
.table th a{text-decoration: none;
			color: #ffff00d1;}
.table th:hover a { color: #4eabbbb5;}
.table th a:active {color: red;	}
.table1{border: 0px solid white;
   	    position: absolute;
   	    height: 50px;
    	width: 960px;
    	background: #eee;
    	}
.table1 th {
			vertical-align: middle !improtant;
			text-align: center;
			}


</style>
</head>
<body>
<%@ include file="header.jsp"%>
<section>
<div class="wrap">

      <table class="table1">
      		<tr style="color: #444;">
      			<th>시간</th>
      			<th>이름</th>
      			<th>좌석</th>
      			<th>가격</th>
      			<th>날짜</th>
      			<th>결제</th>
      		</tr>
      </table>
      <table class="table">
      <c:forEach var="resv" items="${ResvList}">
               <tr>
                  <th>${resv.resv_start}~ ${resv.resv_end}</th>
                  <th> <a href="resvView?resv=${resv.resv_num}">${resv.pc_name}</a></th>
                  <th>${resv.seat_num}</th>
                  <th>${resv.resv_price}</th>
                  <th>${resv.resv_date}</th>
                  <th>${resv.payment}</th>
               </tr>
	</c:forEach> 
            </table>
   </div>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>