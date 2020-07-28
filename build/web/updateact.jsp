<%@page import="java.sql.*"%>
<%@page import="Database.DbConnection"%>
<%@ page session="true" %>
<%
    
    String rno = request.getParameter("rno");
      String tp =request.getParameter("tp");
    String tpo =request.getParameter("tpo");
    String ip = request.getParameter("ip");
    String ipo = request.getParameter("ipo");
    String bp = request.getParameter("bp");
    String backlogs = request.getParameter("backlogs");
    try {
        Connection con = DbConnection.getconnection();
         //   ResultSet rs = st.executeQuery("update upload set Tenthpercentage = '"+tp+"',Tenthpassout = '"+tpo+"',Interpercentage = '"+ip+"',Interpassout = '"+ipo+"',Btechpercentage  = '"+bp+"',Backlogs = '"+backlogs+"'  where Rollnumer ='" + rno + "' ");
            PreparedStatement pst = con.prepareStatement("update upload set Tenthpercentage = '"+tp+"',Tenthpassout = '"+tpo+"',Interpercentage = '"+ip+"',Interpassout = '"+ipo+"',Btechpercentage  = '"+bp+"',Backlogs = '"+backlogs+"'  where Rollnumber ='" + rno + "'");
       int i= pst.executeUpdate();
    if(i>0)
    {
      
     response.sendRedirect("update.jsp?m2=Registred_sucessful");
     
    }
    else
    {
      response.sendRedirect("update.jsp?m3=login_failed");  
    }
    }
     catch(Exception e)
             {
                 out.println(e.getMessage());
             }
%>


