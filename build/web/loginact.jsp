<%@page import="java.sql.*"%>
<%@page import="Database.DbConnection"%>
<%@ page session="true" %>
<%
    
    String username = request.getParameter("username");
    System.out.println(username);

    String password = request.getParameter("password");
    System.out.println(password);

    try {
        Connection con = DbConnection.getconnection();
        Statement st = con.createStatement();
        
            ResultSet rs = st.executeQuery("select * from user where username ='" + username + "' and password='" + password + "'");
            if (rs.next()) {
                String user = rs.getString(1);
                
                session.setAttribute("username", user);
                
                response.sendRedirect("userhome.jsp?m1=Success");
            } else {
                response.sendRedirect("studenttutor.jsp?m2=LoginFail");
            }
        

    } catch (Exception e) {
        System.out.println("Error in index.html" + e.getMessage());
    }
%>


