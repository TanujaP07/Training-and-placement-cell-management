<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 <%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DbConnection"%>

<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Placement Cell Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/download.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700|Raleway:300,400,400i,500,500i,700,800,900" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/nivo-slider/css/nivo-slider.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.carousel.css" rel="stylesheet">
  <link href="lib/owlcarousel/owl.transitions.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/util.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">

  <!-- Nivo Slider Theme -->
  <link href="css/nivo-slider-theme.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- Responsive Stylesheet File -->
  <link href="css/responsive.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: Placement Cell
    Theme URL: https://bootstrapmade.com/Placement Cell-bootstrap-corporate-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body data-spy="scroll" data-target="#navbar-example" >


  <header>
    <!-- header-area start -->
    <div id="sticker" class="header-area">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12">

            <!-- Navigation -->
            <nav class="navbar navbar-default">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".bs-example-navbar-collapse-1" aria-expanded="false">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
                <!-- Brand -->
                <a class="navbar-brand page-scroll sticky-logo" href="index.html">
                  <h1><img src="img/download.png" style="width: 40px;height: 40px" alt="" title="">                         Placement Cell</h1></a>
                  <!-- Uncomment below if you prefer to use an image logo -->
                  <!-- <img src="img/logo.png" alt="" title=""> -->
								</a>
              </div>
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse main-menu bs-example-navbar-collapse-1" id="navbar-example">
                <ul class="nav navbar-nav navbar-right">
                  <li class="active">
                    <a class="page-scroll" href="userhome.jsp">Home</a>
                  </li>
<!--                  <li>
                    <a class="page-scroll" href="login.jsp">User</a>
                  </li>-->
                  <li>
                    <a class="page-scroll" href="upload.jsp">Upload Data</a>
                  </li>
                  <li>
                    <a class="page-scroll" href="view.jsp">View Data</a>
                  </li>
                  <li>
                    <a class="page-scroll" href="login.jsp">Logout</a>
                  </li>

                </ul>
              </div>
              <!-- navbar-collapse -->
            </nav>
            <!-- END: Navigation -->
          </div>
        </div>
      </div>
    </div>
    <!-- header-area end -->
  </header>
  <!-- header end -->
  <%
      String uname = session.getAttribute("username").toString();
      String rno = request.getParameter("rno");
      String tp =request.getParameter("tp");
    String tpo =request.getParameter("tpo");
    String ip = request.getParameter("ip");
    String ipo = request.getParameter("ipo");
    String bp = request.getParameter("bp");
    String backlogs = request.getParameter("backlogs");
    Connection connection = DbConnection.getconnection();
                        
    String sql="SELECT * FROM upload where Rollnumber = '"+rno+"' ";
    Statement stmt = connection.createStatement();
    ResultSet rs =stmt.executeQuery(sql);

      %>
  <!-- Start Slider Area -->
  <div id="home" class="slider-area">
    
       
       
     
        <br><br><br>

 

	<div class="limiter">
		<div class="container-login100" >
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					View Data
				</span>
                            <%
       
	while(rs.next()){
            %>
                            <form class="login100-form validate-form p-b-33 p-t-5" action="updateact.jsp" method="post">

					<div class="wrap-input100 validate-input" >
                                            <input class="input100" type="text" name="rno" value="<%=rs.getString(1)%>" >
						<span class="focus-input100" placeholder="&#xe82a;">Roll No:</span>
					</div>

					<div class="wrap-input100 validate-input" >
                                            <input class="input100" type="text" name="tp" value="<%=rs.getString(2)%>">
						<span class="focus-input100" data-placeholder="&#xe80f;">Tenth Percentage:</span>
					</div>
                                        <div class="wrap-input100 " >
						<input class="input100" type="text" name="tpo" value="<%=rs.getString(3)%>">
						<span class="focus-input100" placeholder="&#xe82a;">Tenth Passout:</span>
					</div>

					<div class="wrap-input100 " >
						<input class="input100" type="text" name="ip" value="<%=rs.getString(4)%>">
						<span class="focus-input100" >Inter Percentage:</span>
					</div>
                                        
                                        <div class="wrap-input100 validate-input" >
                                            <input class="input100" type="text" name="ipo" value="<%=rs.getString(5)%>" required="">
						<span class="focus-input100" data-placeholder="&#xe80f;">Inter Passout</span>
					</div>
                                        <div class="wrap-input100 " >
						<input class="input100" type="text" name="bp" value="<%=rs.getString(6)%>">
						<span class="focus-input100" placeholder="&#xe82a;">Btech percentage</span>
					</div>

					<div class="wrap-input100 " >
						<input class="input100" type="text" name="backlogs" value="<%=rs.getString(7)%>">
						<span class="focus-input100" >Backlogs</span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Update
						</button>
					</div>

				</form>
                                                <%  }
        
        %>
			</div>
		</div>
	</div>
	
    
    </div>
      
  </div>
  <!-- End Slider Area -->

  <!-- Start About area -->
 
     

  
       
        
  


  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/venobox/venobox.min.js"></script>
  <script src="lib/knob/jquery.knob.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/parallax/parallax.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/nivo-slider/js/jquery.nivo.slider.js" type="text/javascript"></script>
  <script src="lib/appear/jquery.appear.js"></script>
  <script src="lib/isotope/isotope.pkgd.min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <script src="js/main.js"></script>
</body>

</html>
