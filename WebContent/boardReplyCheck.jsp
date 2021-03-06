<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url = "jdbc:oracle:thin:@rdp.hees.xyz:1521:XE";
	String id = "hp";
	String pass = "123";
	String nick_name = request.getParameter("nick_name");
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int category_num = Integer.parseInt(request.getParameter("category_num"));
	

	try {
		int parent = 0;
		int indent = 0;
		int step = 0;
		Connection conn = DriverManager.getConnection(url, id, pass);
		Statement stmt = conn.createStatement();
		String sql = "SELECT PARENT, INDENT, STEP FROM BOARD WHERE NUM=" + num;
		ResultSet rs = stmt.executeQuery(sql);
	
		if (rs.next()) {
			parent = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}

		sql = "UPDATE board SET INDENT = INDENT+1 where parent=" + parent + " and INDENT > " + indent;
		
		stmt.executeUpdate(sql);

		sql = "INSERT INTO board(NUM, TITLE, CONTENT, PARENT, INDENT, STEP, category_num, nick_name) values(BOARD_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, parent);
		pstmt.setInt(4, indent + 1);
		pstmt.setInt(5, step + 1);
		pstmt.setInt(6, category_num);
		pstmt.setString(7, nick_name);

		pstmt.execute();

		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href = "boardList.g?category_num=${param.category_num}";
</script>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>