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
 * Servlet implementation class addEmployeEntreprise
 */
@WebServlet("/addEmployeEntreprise")
public class addEmployeEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addEmployeEntrepriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		int idEntreprise=(Integer) session.getAttribute( "idEntreprise");
		String nom=request.getParameter("nompe");
		String prenom=request.getParameter("prenompe");
		String dateRecrutement=request.getParameter("dateRecrutement");
		int idFonction=Integer.parseInt(request.getParameter("fonction"));
		int idDiplome=Integer.parseInt(request.getParameter("diplome"));
		int idSpecialite=Integer.parseInt(request.getParameter("specialite"));
		String cnss=request.getParameter("cnsspe");
		Connection con=Utilitaire.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO Employe(idEntreprise,Nom,Prenom,DateRecrutement,idFonction,idDiplome,idSpecialite,CNSS) VALUES(?,?,?,?,?,?,?,?)");
			ps.setInt(1, idEntreprise);
			ps.setString(2, nom);
			ps.setString(3, prenom);
			ps.setString(4, dateRecrutement);
			ps.setInt(5, idFonction);
			ps.setInt(6,idDiplome);
			ps.setInt(7, idSpecialite);
			ps.setString(8, cnss);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
