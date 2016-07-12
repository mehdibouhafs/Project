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

import com.esisa.stage.dao.Utilitaire;

/**
 * Servlet implementation class getInfoEntrepriseServlet
 */
@WebServlet("/getInfoEntrepriseServlet")
public class getInfoEntrepriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getInfoEntrepriseServlet() {
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
		int id=Integer.parseInt(request.getParameter("id"));
		Connection con=Utilitaire.getConnection();
		JsonArrayBuilder jsa = Json.createArrayBuilder();
		try {
			PreparedStatement ps=con.prepareStatement("select * from entreprise where id=?");
			ps.setInt(1, id);
			JsonObjectBuilder j = Json.createObjectBuilder();
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				j.add("nom", rs.getString(2));
				j.add("signe", rs.getString(3));
				j.add("tel", rs.getString(6));
				j.add("email", rs.getString(8));
				j.add("tp", rs.getDouble(9));
				j.add("rc", rs.getString(10));
				j.add("cnss", rs.getString(11));
				j.add("datecreation", rs.getString(13));
				j.add("capital", rs.getDouble(15));
				j.add("part", rs.getDouble(16));
				PreparedStatement ps1=con.prepareStatement("select * from FormeJuridique where id=?");
				ps1.setInt(1, rs.getInt(14));
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next()){
					j.add("fj", rs1.getString(2));
				}
				JsonArrayBuilder jsa1 = Json.createArrayBuilder();
				 ps1=con.prepareStatement("select * from Materiel m,categorieMateriel cm where m.idCategorieMateriel=cm.id and idEntreprise=?");
				ps1.setInt(1, rs.getInt(1));
				rs1=ps1.executeQuery();
				JsonObjectBuilder j1 = Json.createObjectBuilder();
				while(rs1.next()){
					j1.add("catmat",rs1.getString(10) );
					j1.add("nombre",rs1.getInt(5) );
					j1.add("pu",rs1.getDouble(6) );
					j1.add("description",rs1.getString(7) );
					j1.add("annee",rs1.getInt(8) );
				}
				jsa1.add(j1);
				j.add("Materiel", jsa1);
				
				
				JsonArrayBuilder jsa2 = Json.createArrayBuilder();
				 ps1=con.prepareStatement("select e.nom,prenom,d.nom,f.nom,s.nom from Employe e,diplome d,fonction f,Specialite s where e.idSpecialite=s.id and e.idDiplome=d.id and f.id=e.idFonction and idEntreprise=?");
				ps1.setInt(1, rs.getInt(1));
				rs1=ps1.executeQuery();
				JsonObjectBuilder j2 = Json.createObjectBuilder();
				while(rs1.next()){
					j2.add("nom",rs1.getString(1)+" "+rs1.getString(2) );
					j2.add("diplome",rs1.getString(3) );
					j2.add("fonction",rs1.getString(4) );
					j2.add("specialite",rs1.getString(5) );
				}
				jsa2.add(j2);
				j.add("humain", jsa2);
				
				jsa.add(j);
			}
			JsonArray js = jsa.build();
			response.setContentType("application/json");
			PrintWriter p = response.getWriter();
			p.print(js);
			p.flush();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
