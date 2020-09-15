<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All note : Note Saver</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navBar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes :</h1>
		<div class="row">
			<div class="col-12">
				<%
					Session s = FactryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>
				<div class="card mt-3">
					<img src="img/note.png"
						style="max-width: 70px; transform: rotate(30deg); margin-left: 20px; margin-top: 10px"
						class="card-img-top mx-auto" alt="...">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text" ><%=note.getContent()%></p>
						<p style=" text-align: right;"><b class="text-primary" >Last Update : <%=note.getAddedDate() %></b></p>
						<div class="container text-center">
							<a href="DeteleServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="editnote.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>
				<%
					}
				s.close();
				%>

			</div>


		</div>

	</div>

</body>
</html>