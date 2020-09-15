<%@page import="com.entity.Note"%>
<%@page import="com.helper.FactryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container">
		<%@include file="navBar.jsp"%>
		<h1>Edit your Notes</h1>

		<%
			int noteid = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteid);
		
		%>
		
		
		<form action="UpdateNoteServlet" method="post">
		<input value="<%= note.getId() %>"  name = "noteId" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here"
					value="<%= note.getTitle() %>">

			</div>
			<div class="form-group">
				<label for="text">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter your content " class="form-control"
					style="height: 300px;"><%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>
		</form>
	</div>
</body>
</html>