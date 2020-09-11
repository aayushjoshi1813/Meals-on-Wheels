<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movable feast admin</title>
   
         
<style>
#order 
{
  background-color: white;
  border: 2px solid grey;
  padding: 25px;
  margin: 25px;
  height:131px;
}
#h6{
    padding-top: 10px;
}
.button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  margin-left: 85%;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
#bb
{
 margin-top:12px;
 margin-left:89%;
}
</style>
</head>
<body>
       <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minor","root","12345");
            PreparedStatement ps=con.prepareStatement("select * from orderp");
            ResultSet rs=ps.executeQuery();
            String coach="",seat="",pname="",quantity="",price="",total_amt="",oid="",Status="";
            String oidcheck="",quantitycheck="",pricecheck="",pnamecheck="",coachcheck="",statuscheck="",seatcheck="";
            int totalcheck=0;
            if(rs.next())
            {	int n=0;
                do
                {
                    coach 		=	rs.getString("coach");
                    seat 		=   rs.getString("seat");
                    pname   	=   rs.getString("pname");
                    quantity  	=   rs.getString("quantity");
                    price 		=   rs.getString("price");
                    total_amt   =   rs.getString("total_amt");
                    oid   		=   rs.getString("oid");
                    Status   	=   rs.getString("status");
                    if(Status.equals("Preparing"))
                    {          		
       %> 
                    <div id="order">
                        <h5 id="h6" color="red" style="margin-top: -26px">Product Name : <%=pname%> </h5>
                        <h5 id="aa" color="red" style="margin-top: -37px;margin-left:700px;">Order id : <%=oid%></h5>
                        <h5 id="h6" color="red" style="margin-top: -16px;margin-left:0px;">coach : <%=coach%></h5>
                        <h5 id="h6" color="black" style="margin-top: -50px;margin-left:700px;">Status : <%=Status%></h5>
                        <h5 id="h6" color="black" style="margin-top: -13px;">Seat : <%=seat%></h5>
                        <h5 id="h6" color="black" style="margin-top: -14px;">Quantity : <%=quantity%></h5>
                        <h5 id="aa" color="black"style="margin-top: -72px;margin-left: 700px;"> Price : <%=price%></h5>
                        <h5 id="aa" color="red" style="margin-top: 6px;margin-left: 700px;">Total : <%=total_amt%></h5>
          			    <form action="status.jsp">
          				<button type="submit" value="<%=oid %>" name="prepared" style="margin-top: -20px;margin-left: 94%;">Prepared</button>
          				</form>
          			</div>
        <%         }
              }while(rs.next());
                
            }
              response.addHeader("Refresh","10");
        %>              
   </body>
</html>