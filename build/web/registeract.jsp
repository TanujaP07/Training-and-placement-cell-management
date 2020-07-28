<%@page import="java.sql.*"%>
<%@page import="Database.DbConnection"%>
<%@ page session="true" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");  
String email = request.getParameter("email");
String dob = request.getParameter("dob");
String address = request.getParameter("address");
String mobile = request.getParameter("mobile");

try{
    Connection con=DbConnection.getconnection();

PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,)");

ps.setString(1,username);
ps.setString(2,password);
ps.setString(3,email);
ps.setString(4,dob);
ps.setString(5,address);
ps.setString(6,mobile);

int i=ps.executeUpdate();
if(i>0)
{
response.sendRedirect("login.jsp?m1=Registered");
}
else{
    response.sendRedirect("studenttutor.jsp?m2=Failed");
}


%>
<%
}

catch(Exception e)
{
        out.println(e.getMessage());
}
%>