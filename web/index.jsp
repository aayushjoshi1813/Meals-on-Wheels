	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.io.IOException"%>

<%
	if(null!=(String)request.getParameter("coach"))
	{
		String coach=(String)request.getParameter("coach");
		String seat=(String)request.getParameter("seat");
		session.setAttribute("coach",coach);
		session.setAttribute("seat",seat);
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meal on wheel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<!-- quan -->

<style>

body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif;}
.w3-bar-block .w3-bar-item {padding:20px}
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 10px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 2px;
  margin-top: 16px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

#sticky {
  position: fixed;
  top: 485px;
  margin-left: 62%;

  font-size: 20px;
}
.notification {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 10px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: grey;
}

.notification #badge {
  position: absolute;
  top: -32%;
  right: -14%;
  padding: 4% 13%;
  border-radius: 100%;
  background-color: red;
  color: white;
}
.w3-quarter
{
  margin-bottom: 20px;
}


.w3-quarter img
{
  width: 95%;
  height:249px;
}
#quan {
  width: 300px;
  margin: 0 auto;
  text-align: center;
  padding-top: 50px;
}

.value-button {
  display: inline-block;
  border: 1px solid #ddd;
  margin: 0px;
  width: 40px;
  height: 41px;
  text-align: center;
  vertical-align: middle;
  padding: 11px 0;
  background: #eee;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.value-button:hover {
  cursor: pointer;
}

#quan #decrease {
  margin-right: -4px;
  border-radius: 8px 0 0 8px;
}

#quan #increase {
  margin-left: -4px;
  border-radius: 0 8px 8px 0;
}

#quan #input-wrap {
  margin: 0px;
  padding: 0px;
}

input#number {
  text-align: center;
  border: none;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  margin: 0px;
  width: 40px;
  height: 40px;
}
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#quan
{
  margin-top: -52px;
}
#h
{
  margin-top: 10px;
}
#q
{
 margin-left:17px;
}

</style>
</head>
<body background="images/aa.jpg">
<% 


Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minor","root","12345");


%>
<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()"
  class="w3-bar-item w3-button"><span class="glyphicon glyphicon-arrow-left"></span></a>
  <a href="https://www.railyatri.in/live-train-status" onclick="w3_close()" class="w3-bar-item w3-button">Live Status</a>
  
</nav>
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()"><span class="glyphicon glyphicon-th-list"></div>
    <div class="w3-right w3-padding-16"></div>
    <div class="w3-center w3-padding-16">Meal on wheel</div>
  </div>
</div>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

<div class="w3-row-padding w3-padding-16 w3-center">

<%
		
	PreparedStatement ps=con.prepareStatement("select * from products");
	ResultSet rs=ps.executeQuery();
	
	int qu=0;
	if(session.getAttribute("ids")!=null)
	{
		qu=(int)session.getAttribute("x");
		
	}

	if(rs.next())
	{
		do
		{
			
			int q=1;
			String id=rs.getString("uniq_id");
			String path=rs.getString("full_path");
			String price=rs.getString("price");
			String name=rs.getString("name");
			String des=rs.getString("description");
%>

 
<form action="add_cart.jsp"  >
  <div class="w3-quarter">
      <img id="aa" src="<%=path%>">
      <h3 id="na"><%=name %></h3>
      <p id="bb"><%=des %></p>
      <h3 id="h"><%=price %> rs</h3>  
	  <input id="q" type="number" value="1" name="number">	
     <button type="submit" value=<%=id %> name="id" class="button" style="vertical-align:middle" onclick="add()" id="b1">Add to cart</button>
  </div>
</form>

<%
		}while(rs.next());
	}
%>        
  </div>
<div id="sticky"><a href="checkout.jsp" class="notification">
  <span class="fa fa-shopping-cart"> cart</span>
  <span id="badge"><%=qu %></span>
</a></div>
</div>

</body>
	
 <script>
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}

function add() {
  document.getElementById("badge").innerHTML = parseInt(document.getElementById("badge").innerHTML)+1;
    }

function increaseValue(a) {
	//alert(a);
	  var value = parseInt(document.getElementById('number'+a).value, 10);
	  value = isNaN(value) ? 0 : value;
	  value++;
	  document.getElementById('number'+a).value = value;
	}

	function decreaseValue() {
	  var value = parseInt(document.getElementById('number').value, 10);
	  value = isNaN(value) ? 0 : value;
	  value < 1 ? value = 1 : '';
	  value--;
	  document.getElementById('number').value = value;
	}


</script>
</html>
