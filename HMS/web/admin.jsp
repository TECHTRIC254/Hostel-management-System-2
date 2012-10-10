<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Admin Page</title>
</head>
<body>
<% String url = "jdbc:mysql://localhost:3306/hms";
String user= "root";
String pass= "123456";
try{
Class.forName ("com.mysql.jdbc.Driver").newInstance ();
Connection conn = DriverManager.getConnection(url, user, pass);
Statement stmt = conn.createStatement();
String uname = (String)session.getAttribute("username");
String query="select * from accounts where uname='"+uname+"' and type=0";
ResultSet rs = stmt.executeQuery(query);
rs.next();
//out.println(rs.getRow());
if(rs.getRow()==1)
{
           %>
           Welcome <%=session.getAttribute("username")%>
           <a href="logout.jsp">logout</a>
           <%
}
    
else if (session.getAttribute("username")!=null)
{
    out.println("Access Denied");
       }
else
       {
    %>
    <%@ include file="banner.jsp" %>
    <center><font color="red">Please Login First</font></center>
    <%@ include file="login.jsp" %>
    <%
}
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
</body>
</html>