package com.esisas.stage.business;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esisa.stage.dao.Utilitaire;

/**
 * Servlet implementation class addDossierServlet
 */
@WebServlet("/addDossierServlet")
public class addDossierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDossierServlet() {
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

		Connection con=Utilitaire.getConnection();
		//Connection con=Utilitaire.getConnection();
		JsonObject activite;
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO Compte(login,password,idEntreprise) VALUES(?,?,?)");
			ps.setString(1, "root"+idEntreprise);
			ps.setString(2, "root"+idEntreprise);
			ps.setInt(3, idEntreprise);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		int max=0;
		try {
			PreparedStatement ps=con.prepareStatement("select max(id) from compte");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				max=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO utilisateur(Nom,Prenom,email,tel,idCompte,logino) VALUES(?,?,?,?,?,?)");
			ps.setString(1, "a");
			ps.setString(2, "a");
			ps.setString(3, "a");
			ps.setString(4, "a");
			ps.setInt(5, max);
			ps.setString(6, "a");
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		 activite = Json.createObjectBuilder().add("ok","Compte : root"+idEntreprise ).build();
		try {
			PreparedStatement ps=con.prepareStatement("INSERT INTO Dossier(idEntreprise,type) VALUES(?,?)");
			ps.setInt(1, idEntreprise);
			ps.setString(2, "Examen");
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		response.setContentType("application/json");
		PrintWriter p = response.getWriter();
		p.print(activite);
		p.flush();
	}

}
