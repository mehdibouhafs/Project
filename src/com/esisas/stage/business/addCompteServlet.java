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
 * Servlet implementation class addCompteServlet
 */
@WebServlet("/addCompteServlet")
public class addCompteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCompteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	HttpSession session = request.getSession();
		
		//int idEntreprise=(int)session.getAttribute( "idEntreprise");

		Connection con=Utilitaire.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO Compte(login,password,idEntreprise) VALUES(?,?,?)");
			ps.setString(1, "");
			ps.setString(2, "");
			ps.setInt(3, 1);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
