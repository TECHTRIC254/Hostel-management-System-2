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
String query="delete from Student where sid="+request.getParameter("id");
stmt.executeUpdate(query);
conn.close();
%>
         <jsp:forward page="student_info.jsp" >
  <jsp:param name="message" value="Student deleted Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
%>