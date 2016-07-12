package com.esisas.stage.business;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esisa.stage.dao.Utilitaire;

/**
 * Servlet implementation class ModificationInfoServlet
 */
@WebServlet("/ModificationInfoServlet")
public class ModificationInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificationInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String nom=request.getParameter("nom");
		String prenom=request.getParameter("prenom");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		Connection con=Utilitaire.getConnection();
		HttpSession session1=request.getSession();
		String admin=(String)session1.getAttribute("login");
		try{
			PreparedStatement ps=con.prepareStatement("update utilisateur set nom=?,prenom=?,tel=?,email=? where logino=?");
			ps.setString(1, nom);
			ps.setString(2, prenom);
			ps.setString(3, tel);
			ps.setString(4, email);
			ps.setString(5, admin);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}

}
