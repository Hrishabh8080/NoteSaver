package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactryProvider;


public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
    
    public UpdateNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int nodetId = Integer.parseInt(request.getParameter("noteId").trim());
			Session s = FactryProvider.getFactory().openSession();
			Transaction  tx = s.beginTransaction();
			
			Note note = s.get(Note.class, nodetId);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

}
