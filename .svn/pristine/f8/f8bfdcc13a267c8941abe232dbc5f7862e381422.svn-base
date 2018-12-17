<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function() {
$.ajax("PcResvJson",{
   dataType : 'json',
   async : false,
   success : function(data) {
      var resv = [];
      resv = data;
      var htmlstr ="";
      for (i = 0; i < data.length; i++) {
         htmlstr +=   '<div class="row-wrap">'
         htmlstr +=      '<div class="row-left">'
         htmlstr +=      '<h2><a href="resvView?resv='+resv[i].resv_num+'">'+resv[i].name+'</a></h2>' 
         htmlstr +=      '</div>'
         htmlstr +=    '<div class="row-right">'
         htmlstr +=      '<p>시간 : <span style="color:#d4b184; font-weight: bold;">'+resv[i].resv_start + " " + "~" + " " + resv[i].resv_end+'</span></p>'
         htmlstr +=      '<p>좌석 : <span style="color:#d4b184; font-weight: bold;">'+resv[i].seat_nums+'</span></p>'
         htmlstr +=      '<p>날짜 : <span style="color:#d4b184; font-weight: bold;">'+resv[i].resv_date+'</span></p>'
         htmlstr +=      '<p>결제 방법 : <span style="color:#d4b184; font-weight: bold;">'+resv[i].payment+'</span></p>'
         htmlstr +=      '<p>가격 : <span style="color:#d4b184; font-weight: bold;">'+resv[i].resv_price+'원</span></p>'
         htmlstr +=    '</div>'
         htmlstr +=    '</div>'
      }
      console.log("ddd::"+htmlstr);
      $("#id").html(htmlstr);
   }
})  
})


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>PC방 예약내역</title>
<style type="text/css">
body{background-image: url(images/starback.jpg);
    background-repeat: no-repeat;
    background-size: cover;}
section {padding: 15px;
       padding-top: 130px;
       background: #000000b3;
       }
.wrap {
   width: 960px;
   margin: 20px auto;
   padding: 0;
   height: 600px;
   border: 0px solid black;
   background: #0000003d;
    overflow: scroll;
   -ms-overflow-style: none;
   }
::-webkit-scrollbar {display:none;} 
#id {text-align: center;
    color: white;
    padding-top: 30px;
   }   
   

#id h2 {/* color: gold; */ padding: 10px;}
#id h2 a{text-decoration: none; color: gold;}
#id h2:hover a{color: aquamarine; text-decoration: none;}

.row-right{display: flex;
             font-size: 13px;
            margin: 5px;
}
.row-right p{border: 1px solid #ffffff05;
          padding: 5px;
          margin: 5px;
          width: 200px;}
.row-left h2{text-align: left; 
          font-size: 20px; 
          padding: 5px; 
          margin: 5px;
          border-top: 1px solid #ffffff2b;}
</style>
</head>
<body>
<%@ include file="header.jsp"%>
<section>
   <div class="wrap">
   <div id = "id"></div>
   </div>
</section>
<%@ include file="footer.jsp"%>   
</body>
</html>