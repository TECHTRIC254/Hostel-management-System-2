<%-- 
    Document   : index
    Created on : 8 Oct, 2012, 9:43:19 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<%@ include file="banner.jsp" %>
<body>
<% 
if(session.getAttribute("username")!=null){
%>

<%
Integer level=(Integer)session.getAttribute("level");
out.println("."+level+".");

if(level==0){
    out.println("<jsp:forward page='admin.jsp' />");
}
else if(level.equals("1")){
    out.println("<jsp:forward page='hall.jsp' />");    
}
else if(level.equals("2")){
    out.println("<jsp:forward page='hostel.jsp' />");    
}
    
       }
%>
<%

    String status=(request.getParameter("status"));
    //out.println(status.);
    //out.println(status.equals("3"));
    if(status!=null&&status.charAt(0)=='1')
               {
               out.println("<div class='warning'>Please Login First</div>");
               }
       else if(status!=null&&status.charAt(0)=='2')
                     {
           out.println("<div class='warning'>Login Failed</div>");
       }
                      
          else if(status!=null&&status.charAt(0) =='3')
                 {
              out.println("<div class='signoff'>Logged out Successfully</div>");
              
          }
      %>
<%@ include file="login.jsp" %>
 </body>
</html>