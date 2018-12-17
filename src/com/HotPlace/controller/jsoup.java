package com.HotPlace.controller;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import oracle.jdbc.driver.OracleDriver;
public class jsoup {
	public static void main(String[] args) throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		DriverManager.registerDriver(new OracleDriver());
		try {
			String connUrl = "https://namu.wiki/w/PC%EB%B0%A9%EC%9D%98%20%EC%9C%84%EC%B9%98%20%EC%A0%95%EB%B3%B4#s-3.1.1";
			Connection conn = Jsoup.connect(connUrl);
			Document doc = conn.get();
			FileWriter fos = new FileWriter("1111.html");
			PrintWriter pw = new PrintWriter(fos);
			// pw.print(doc.select("html"));
			System.out.println();
			Elements element = doc.select(".wiki-heading-content > ul > li > p");
			String text = element.html();
			String[] strs = text.split("\n");
			List<TestVo> list = new ArrayList<>();
			for (String s : strs) {
				String str = s.replaceAll("<[^>]*>", " ");
				if (str.indexOf(" - ") != -1) {
					// System.out.println(str.substring(0, str.indexOf(" - ")) +
					// str.substring(str.indexOf(" - ")+2));
					list.add(new TestVo(str.substring(0, str.indexOf(" - ")), str.substring(str.indexOf(" - ") + 2)));
				}
				/*
				 * if(s.indexOf(" - ") != -1) { System.out.println(s.substring(0,
				 * s.indexOf(" - "))); if(s.indexOf(">") != -1 || s.indexOf("<") != -1) {
				 * System.out.println(s.substring(0, s.indexOf(" - ")) +
				 * s.substring(s.indexOf(">")+1 , s.lastIndexOf("<"))); } }
				 */
			}
			// System.out.println(list);
			/*
			 * Statement stmt = conn1.createStatement(); for(TestVo vo : list) {
			 * //System.out.println(vo.name); String sql =
			 * "insert into PC(pc_num ,name, address) " + "values(PC_seq.nextval," + "'" +
			 * vo.name + "', " + "'" + vo.addr + "');"; System.out.println(sql);
			 * stmt.executeUpdate(sql); }
			 */
			String sql = "insert into PC(pc_num ,name, address) " + "values(PC_seq.nextval,?,?)";
			PreparedStatement pstmt = null;
			java.sql.Connection conn1 = null;
			try {
				conn1 = DriverManager.getConnection(url, "hr", "hr");
				for (int i = 900 ; i < 1030 ;i++) {
					pstmt = conn1.prepareStatement(sql);
					pstmt.setString(1, list.get(i).name);
					pstmt.setString(2, list.get(i).addr);
					pstmt.executeUpdate();
				}
				System.out.println(list.size());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn1.close();
				pstmt.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
class TestVo {
	String name;
	String addr;
	public TestVo(String name, String addr) {
		super();
		this.name = name;
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "TestVo [name=" + name + ", addr=" + addr + "]";
	}
}
