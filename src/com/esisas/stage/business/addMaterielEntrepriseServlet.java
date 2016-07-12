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
 * Servlet implementation class addMaterielEntrepriseServlet
 */
@WebServlet("/addMaterielEntrepriseServlet")
public class addMaterielEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addMaterielEntrepriseServlet() {
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
		
		int catmat=Integer.parseInt(request.getParameter("catmat"));
		int typemat=Integer.parseInt(request.getParameter("typemat"));
		HttpSession session = request.getSession();
		
		int idEntreprise=(Integer) session.getAttribute( "idEntreprise");
		int q=Integer.parseInt(request.getParameter("q"));
		double pu=Double.parseDouble(request.getParameter("pu"));
		int anneeAcquisition=Integer.parseInt(request.getParameter("anneeAcquisition"));
		String desc=request.getParameter("desc");
		String pja=request.getParameter("pja");
		Connection con=Utilitaire.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO Materiel(idEntreprise,idTypeMateriel,idCategorieMateriel,Nombre,PrixUnitaire,Description,AnneeAcquisition) VALUES(?,?,?,?,?,?,?)");
			ps.setInt(1, idEntreprise);
			ps.setInt(2, typemat);
			ps.setInt(3, catmat);
			ps.setInt(4, q);
			ps.setDouble(5, pu);
			ps.setString(6,desc);
			ps.setInt(7, anneeAcquisition);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
