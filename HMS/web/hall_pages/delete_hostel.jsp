<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<% 
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="delete from Hostel where hid="+request.getParameter("id");
stmt.executeUpdate(query);
query="delete from accounts where h_no="+request.getParameter("id")+" and type=2";
stmt.executeUpdate(query);
conn.close();
%>
         <jsp:forward page="hostel_info.jsp" >
  <jsp:param name="message" value="Hostel deleted Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
%>