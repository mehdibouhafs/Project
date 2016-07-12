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
 * Servlet implementation class addMasseEntrepriseServlet
 */
@WebServlet("/addMasseEntrepriseServlet")
public class addMasseEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addMasseEntrepriseServlet() {
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
		int annee=Integer.parseInt(request.getParameter("Annee"));
		int nbrmoy=Integer.parseInt(request.getParameter("nbmasd"));
		double masse=Double.parseDouble(request.getParameter("msadh"));
		Connection con=Utilitaire.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO MasseSalarialeAnnuelle(idEntreprise,Annee,nbrmoy,masseSalariale) VALUES(?,?,?,?)");
			ps.setInt(1, idEntreprise);
			ps.setInt(2, annee);
			ps.setInt(3, nbrmoy);
			ps.setDouble(4, masse);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
