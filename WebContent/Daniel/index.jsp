<%
if (session.getAttribute("danielResponded")!=null) {
	response.sendRedirect("home.jsp");
	return;
} else {
	response.sendRedirect("notification.jsp");
	return;
}
%>