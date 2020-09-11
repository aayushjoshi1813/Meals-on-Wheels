<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #f4511e;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}
.button {
  background-color: #f4511e;
  border: none;
  color: white;
  padding: 10px 30px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px 26px;
  cursor: pointer;
  margin-left:68%;
}
#aa
{
   text-decoration: none;
    color: white;
        margin: 30px -48px;
}
#ab
 {
    margin: 30px -48px;
  
}
/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>
<% 
	HttpSession mySession = request.getSession();
	int q=0;
	String ids[]=new String[50];
	String quantity[]=new String[50];
	int p=0;
	if(null == session.getAttribute("ids"))
	{
	}
	else
	{
		ids=(String[])mySession.getAttribute("ids");
		quantity=(String[])mySession.getAttribute("quantity");
		q=(int)mySession.getAttribute("x");
	}
	p=q-1;
	
	Class.forName("com.mysql.jdbc.Driver");   
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minor","root","12345");
%>

<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="check_ser.jsp">
      	
        <div class="row">
          <div class="col-50">
            <div class="container">
      			<h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><%=q %></b></span></h4>
      			<% 
      			int total=0,m=0,pwq=0;
      			for(String i:ids)
      			{
      			PreparedStatement ps=con.prepareStatement("select * from products where uniq_id=?");
      			ps.setString(1,i);
      			if(m<=p)
      			{
      			pwq=Integer.parseInt(quantity[m]);
      			m=m+1;
      			}
      			ResultSet rs=ps.executeQuery();
      				if(rs.next())
      				{
      					String price=rs.getString("price");
      					String name=rs.getString("name");
      					total=total+(Integer.parseInt(price)*pwq);
      			%>
      			<p><a href="#"><%=name %></a> <span>  &nbsp; &nbsp; *</span><span>&nbsp; &nbsp; <b><%=pwq%></b></span><span class="price"><%=Integer.parseInt(price)*pwq%>rs</span></p>
      			<hr>
      			<%
      				}
      			}
    
    	%>	
    	<p>Total <span class="price" style="color:black"><b><%=total %>rs</b></span></p>
    	
    		</div>
            </div>
           </div>
 				<button class="button"><a id="aa" href="delete.jsp">clear cart</a></button>
 				<button class="button"><a id="ab" href="index.jsp">updat cart</a></button>
          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accept only paytm</label>
            <div class="icon-container">
              <img src="https://upload.wikimedia.org/wikipedia/commons/4/42/Paytm_logo.png" alt="Flowers in Chania" width="200" height="80">
            </div>
            
            <label for="ccnum">Paytm number</label>
            <input type="text" id="ccnum" name="number" placeholder="98xxxx9549">

              </div>
        <input type="submit" value="Continue to checkout" class="btn">
      </form>
      </div>
          </div>
          
        </div>
        </div>
  </div>
  <div class="col-25">
    
  </div>
</div>

</body>
</html>
