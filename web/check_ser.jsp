<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>


<%
HttpSession mySession = request.getSession();

String ids[]=new String[50];
String quantity[]=new String[50];
int x=0,oid=0,total_amt=0;
String coach="s1",seat="123",pname="",Status="Preparing",idssql="",quansql="",totalsql="";
int price=0,p=0;
if(null == session.getAttribute("ids"))
{
	response.sendRedirect("checkout.jsp");
}
else
{
	int y=0,m=0;
	ids=(String[])mySession.getAttribute("ids");  //product ki id	
	quantity=(String[])mySession.getAttribute("quantity");
	coach=(String)mySession.getAttribute("coach");
	seat=(String)mySession.getAttribute("seat");
	int q=(int)mySession.getAttribute("x");
	p=q-1;
	Class.forName("com.mysql.jdbc.Driver");   
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minor","root","12345");
	Random rand = new Random();
    oid = rand.nextInt(500000);
    int total=0,pwq=0;
	for(String i:ids)
	{
		int quan=0;
		PreparedStatement ps=con.prepareStatement("Select * from products where uniq_id=?");
		ps.setString(1,i);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			System.out.println(quantity[x]);
			quan=Integer.parseInt(quantity[x]);
			if(m<=p)
  			{
  			pwq=Integer.parseInt(quantity[m]);
  			quansql=quansql+quantity[m]+", ";
  			m=m+1;
  			}
			do
			{
				pname=rs.getString("name");
				price=rs.getInt("price");
				total=0;
				total=total+price*pwq;
			}while(rs.next());
		idssql=idssql+pname+", ";
		totalsql=totalsql+total+", ";
		total_amt=total_amt+total;
		p=q-1;
		x=x+1;
		}
	}
	
	PreparedStatement ps1=con.prepareStatement("insert into orderp values(?,?,?,?,?,?,?,?)");
	ps1.setString(1,coach);
	ps1.setString(2,seat);
	ps1.setString(3,idssql);
	ps1.setString(4,totalsql);
	ps1.setString(5,quansql);
	ps1.setInt(6,total_amt);
	ps1.setInt(7,oid);
	ps1.setString(8,Status);
	y=0;
	y=ps1.executeUpdate();
	
	if(y!=0)
	{
		mySession.removeAttribute("ids");
		mySession.removeAttribute("quantity");
		response.sendRedirect("index.jsp");
	}
}

%>