<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%
String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
if(request.getParameter("password1").indexOf(34)!=-1||request.getParameter("password1").indexOf(39)!=-1) {
    %>
    
<jsp:forward page="password_reset.jsp" >
  <jsp:param name="message" value="Password should not contain single or double quotes" />
</jsp:forward>
    <%

}
else if(request.getParameter("password1").equals(request.getParameter("password2"))==false) {
    %>
    
<jsp:forward page="password_reset.jsp" >
  <jsp:param name="message" value="Passwords do not match" />
</jsp:forward>
    <%
       }
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String query="update accounts set passwd='"+request.getParameter("password1")+"' where uname='"+request.getParameter("uname")+"'";
stmt.executeUpdate(query);
conn.close();
response.sendRedirect("hall_accounts.jsp?message=Password+updated+Succesfully&type=success");
}catch(Exception e)
{
out.println(e.toString());
}

%>