<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<% String block=request.getParameter("page");%>
<html>
<head>
<title>Admin Page</title>
</head>
<body>
    <%@include file="banner.jsp"%>
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
           
        
           <table><tr>
                   <td style="vertical-align: top">
                    <%@include file="admin-panel.jsp"%>   
                   </td>
                   <td>
                       <%
                       if(block==null||block.equals("home")){
                               out.println("<iframe src =admin_pages/home.jsp width=1040 height=430>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
                                             else if(block.equals("add_hall")){
                                                out.println("<iframe src =admin_pages/add_hall.jsp width=1040 height=430>");
                                                out.println("<p>Your browser does not support iframes.</p>");
                                                out.println("</iframe>");
                                                 
                                             }
                                             else if(block.equals("hall_info")){
                                                out.println("<iframe src =admin_pages/hall_info.jsp width=1040 height=430>");
                                                out.println("<p>Your browser does not support iframes.</p>");
                                                out.println("</iframe>");
                                                 
                                             }
                                            else if(block.equals("hostel_info")){
                                                out.println("<iframe src =admin_pages/hostel_info.jsp width=1040 height=430>");
                                                out.println("<p>Your browser does not support iframes.</p>");
                                                out.println("</iframe>");
                                                 
                                             }
                                            else if(block.equals("student_info")){
                                                out.println("<iframe src =admin_pages/student_info.jsp width=1040 height=430>");
                                                out.println("<p>Your browser does not support iframes.</p>");
                                                out.println("</iframe>");
                                                 
                                             }
                                             else if(block.equals("update_hall")){
                                                out.println("<iframe src =admin_pages/update_hall.jsp width=1040 height=430>");
                                                out.println("<p>Your browser does not support iframes.</p>");
                                                out.println("</iframe>");
                                                 
                                             }
                       
                                             else{
                           //out.println("."+block.charAt(5)+".");
                           out.println(block);
                           out.println("Requested resource not found or you are not supposed to access it");
                                             }
                       %>
                   </td>
               </tr></table>
           
           <%
}
    
else if (session.getAttribute("username")!=null)
{
    out.println("Access Denied");
       }
else
       {
response.sendRedirect("index.jsp?status=1");
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