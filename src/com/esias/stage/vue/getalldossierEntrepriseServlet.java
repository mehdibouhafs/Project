package com.esias.stage.vue;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esisa.stage.dao.Utilitaire;

/**
 * Servlet implementation class getalldossierEntrepriseServlet
 */
@WebServlet("/getalldossierEntrepriseServlet")
public class getalldossierEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getalldossierEntrepriseServlet() {
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
		Connection con=Utilitaire.getConnection();
		JsonArrayBuilder jsa = Json.createArrayBuilder();
		HttpSession session1=request.getSession();
		int id=(Integer) session1.getAttribute("idEntreprise");
		System.out.println(id);
		try{
			PreparedStatement ps=con.prepareStatement("Select * from dossier where idEntreprise=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			JsonObjectBuilder j = Json.createObjectBuilder();
			while(rs.next()){
				j.add("id",rs.getInt(1));
				j.add("identreprise", rs.getInt(2));
				j.add("type", rs.getString(3));
				PreparedStatement ps1=con.prepareStatement("Select nom from entreprise where id=?");
				ps1.setInt(1, rs.getInt(2));
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next()){
					j.add("nom", rs1.getString(1));
				}
				j.add("etat",rs.getInt(4));
				jsa.add(j);
			}
			JsonArray js = jsa.build();
			response.setContentType("application/json");
			PrintWriter p = response.getWriter();
			p.print(js);
			p.flush();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
