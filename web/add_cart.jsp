<%@page import="javafx.beans.binding.IntegerExpression"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<% 
HttpSession mySession = request.getSession();
String quantity[]=new String[50];
String ids[]=new String[50];
String coach="",seat="";
int x=0;
if(null == session.getAttribute("ids"))
{
}
else
{
	ids=(String[])mySession.getAttribute("ids");
	quantity=(String[])mySession.getAttribute("quantity");
	x=(int)mySession.getAttribute("x");
			
}
coach=(String)mySession.getAttribute("coach");
seat=(String)mySession.getAttribute("seat");
String id=request.getParameter("id");
String quant=request.getParameter("number");
System.out.println(quant);
ids[x]=id;
quantity[x]=quant;
x=x+1;

mySession.setAttribute("ids",ids);
mySession.setAttribute("coach",coach);
mySession.setAttribute("seat",seat);
mySession.setAttribute("quantity",quantity);
mySession.setAttribute("x",x);

response.sendRedirect("index.jsp");	


%>