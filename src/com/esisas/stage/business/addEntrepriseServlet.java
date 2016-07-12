package com.esisas.stage.business;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esisa.stage.dao.Utilitaire;

/**
 * Servlet implementation class addEntrepriseServlet
 */
@WebServlet("/addEntrepriseServlet")
public class addEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addEntrepriseServlet() {
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
		String nom=request.getParameter("nom");
		String su=request.getParameter("su");
		String adresse=request.getParameter("adresse");
		int idville=Integer.parseInt(request.getParameter("ville"));
		String tel=request.getParameter("tel");
		String fax=request.getParameter("fax");
		String email=request.getParameter("email");
		double tp=Double.parseDouble(request.getParameter("tp"));
		String rc=request.getParameter("rc");
		String cnss=request.getParameter("cnss");
		String ifa=request.getParameter("ifa");
		String dateCreation=request.getParameter("dateCreation");
		int fj=Integer.parseInt(request.getParameter("fj"));
		double cs=Double.parseDouble(request.getParameter("cs"));
		double pm=Double.parseDouble(request.getParameter("pm"));
		Connection con=Utilitaire.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO entreprise (Nom,signeUsuel,Adresse,idVille,Tel,Fax,Email,Taxeprof,Rc,CNSS,I_F,DateCreation,idFA,Capital,PartMA) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, nom);
			ps.setString(2, su);
			ps.setString(3, adresse);
			ps.setInt(4, idville);
			ps.setString(5, tel);
			ps.setString(6, fax);
			ps.setString(7, email);
			
			ps.setDouble(8, tp);
			ps.setString(9, rc);
			ps.setString(10, cnss);
			ps.setString(11, ifa);
			ps.setString(12, dateCreation);
			ps.setInt(13, fj);
			ps.setDouble(14, cs);
			ps.setDouble(15, pm);
			ps.executeUpdate();
			ps=con.prepareStatement("Select MAx(id) from entreprise");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				/* Création ou récupération de la session */
				HttpSession session = request.getSession();

				/* Mise en session d'une chaîne de caractères */
				int a=rs.getInt(1);
				session.setAttribute( "idEntreprise", a );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
