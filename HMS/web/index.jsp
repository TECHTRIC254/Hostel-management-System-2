<%-- 
    Document   : index
    Created on : 8 Oct, 2012, 9:43:19 PM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>Login Page</title>
</head>
<%@ include file="banner.jsp" %>
<body>
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