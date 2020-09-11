<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>;
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="javax.servlet.ServletRequest"%>

<%
    String pname=request.getParameter("pname");
	String price=request.getParameter("price");
	String des=request.getParameter("des");
		

	HttpSession mySession = request.getSession();
	mySession.setAttribute("pname",pname);
	mySession.setAttribute("price",price);
	mySession.setAttribute("des",des);
		
	response.sendRedirect("uploadimage.jsp");

%>