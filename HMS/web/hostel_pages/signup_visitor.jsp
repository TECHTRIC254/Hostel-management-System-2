<%-- 
    Document   : signup_visitor
    Created on : Nov 11, 2012, 3:13:11 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<html>
    <%
     String student_name=request.getParameter("student_name");
     out.println(student_name);
     String visitor_name=request.getParameter("visitor_name");
     out.println(visitor_name);
     %>
    <%
		String url = "jdbc:mysql://localhost:3306/hms";
	        String user= "root";
                String pass= "123456";
                try{
                   Class.forName ("com.mysql.jdbc.Driver").newInstance ();
                   Connection conn = DriverManager.getConnection(url, user, pass);
                   Statement stmt = conn.createStatement();
                   String query="select sid from Student where name='"+student_name+"'";
		   ResultSet rs=stmt.executeQuery(query);
		   rs.next();
		   int id=rs.getInt("sid");
		   query="insert into Visitors(sid,name,entry_time) values"
			  +"("+id+",'"+visitor_name+"',(select sysdate()))";
		   stmt.executeUpdate(query);
		   %>
		   <jsp:forward page="visitor_book.jsp" >
		    <jsp:param name="message" value="Visitor Signed in" />
		    <jsp:param name="type" value="success"/>
		    </jsp:forward>
		   <%
	           }
		catch(Exception e){
                     out.println(e.toString());
                   }
%>
</html>
