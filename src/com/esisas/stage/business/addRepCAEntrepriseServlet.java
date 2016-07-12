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
 * Servlet implementation class addRepCAEntrepriseServlet
 */
@WebServlet("/addRepCAEntrepriseServlet")
public class addRepCAEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRepCAEntrepriseServlet() {
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
		int annee=Integer.parseInt(request.getParameter("MeilleurAnnee"));
		
		int secteur=Integer.parseInt(request.getParameter("secteurrca"));
		double montant =Double.parseDouble(request.getParameter("MCA"));
		Connection con=Utilitaire.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO RepartitionCA(idEntreprise,idSecteur,Annee,montant) VALUES(?,?,?,?)");
			ps.setInt(1, idEntreprise);
			ps.setInt(3, annee);
			ps.setInt(2, secteur);
			ps.setDouble(4, montant);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
