<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>주소로 장소 표시하기</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=645189b6e3b4fffa603cf981d6189fc4&libraries=services"></script>
	<!-- <script>
		var geocoder = new daum.maps.services.Geocoder();
		var count =0;
		$.ajax("addrjson.jsp",{
			dataType : 'json',
			async :true,
			success : function(data){
				var idxArr = [];
				for (var i = 1; i < data.length; i++) {
					idxArr.push(data[i].pc_num);
					geocoder.addressSearch(data[i].addr, function(result, status) {
						if (status === daum.maps.services.Status.OK) {
						var y = result[0].y;
						var x = result[0].x;
						
						/* var str =encodeURIComponent(idxArr[count++] + "," + result[0].address_name+","+x+ ","+y);
						console.log(str); */
							 /* $.ajax("ajaxreciever.jsp",{
								data : "test=" + str,
								method : "post",
								async : true
								});    */
						}
					});
				}
			}
		});
	</script> -->
	
	<script>
		$.ajax("addrjson.jsp",{
			dataType : 'json',
			async :true,
			success : function(data){
				//var idxArr = [];
				for (var i = 950; i < 1000; i++) {
					//idxArr.push(data[i].pc_num);
						var str =encodeURIComponent(data[i].pc_num);
						$.ajax("ajaxreciever.jsp",{
							data : "test=" + str,
							method : "post",
							async : true
							});
						/* console.log(str);
						location.href = 'ajaxreciever.jsp?test=' + str; */
				}
			}
		});
		/* $.ajax("ajaxreciever.jsp",{
		data : "test=" + str,
		method : "post",
		async : true
		});  */
	</script>
</body>
</html>