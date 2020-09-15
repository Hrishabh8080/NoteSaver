package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactryProvider;

public class DeteleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeteleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int noteid = Integer.parseInt(request.getParameter("note_id").trim());

			Session s = FactryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note n = s.get(Note.class, noteid);
			s.delete(n);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
