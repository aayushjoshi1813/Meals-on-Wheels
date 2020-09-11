<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Upload Product</title>
<!--meta-tags-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Simple Statistics Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--meta-tags-->

<!--css-links-->
<link rel="stylesheet" href="css/jquery-uiproduct.css" />
<link href="css/styleproduct.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/font-awesome.minproduct.css" rel="stylesheet" type="text/css" media="all">
<!--//css-links-->

<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Cabin:400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext,vietnamese" rel="stylesheet">
<!--//online-fonts -->
<style>
.button {
  background-color: #23bfdb;
  border: none;
  color: white;
  padding: 11px 43px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
 
  margin: 4px 2px;
  cursor: pointer;
}
.button1
{
background-color: orange;
  border: none;
  color: white;
  padding: 15px 52px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-left: 200px;
  margin: 4px 2px;
  cursor: pointer;

}
</style>				
</head>
<body>
	<h1>Upload Product</h1>
<!-- main-section -->
	<div class="head agile">
		<div class="login w3">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item"><span >Product Details</span></li>						
					</ul>				  	 
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" >
							<div class="login-top agileinfo">
								
								
								<form action="admin_product_detailsupload.jsp" method="post">
									<div class="w3_agileits_main_grid w3l_main_grid">
										<div class="agileits_grid">
											<h5>Product name</h5>
											<div class="name">
												<input type="text" name="pname" placeholder="Product name" required="">
											</div>
											<div class="clear"></div>
										</div>
									</div>
									<div class="w3_agileits_main_grid w3l_main_grid">
										<div class="agileits_grid">
											<h5>Price</h5>
												<input type="text" name="price"placeholder="in(rs)" required="">
										</div>
									</div>
									
									
									
										
										
									<div class="w3_agileits_main_grid w3l_main_grid">
										<div class="agileits_grid">
											<h5>Description</h5>
												<input type="text" name="des" required="">
										</div>
										</div>
					                       <button class="button" name="submit">Add Images</button>
								</form>
							</div>
						</div>
						
									</div>		
							</div>
						</div>
					</div>	
				</div>
			
	<div class="footer agile-w3l">
		<p> All Rights Reserved  </p>
	</div>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
				
</script>	
</body>
</html>
