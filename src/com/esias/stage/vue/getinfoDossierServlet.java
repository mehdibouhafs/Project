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
 * Servlet implementation class getinfoDossierServlet
 */
@WebServlet("/getinfoDossierServlet")
public class getinfoDossierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getinfoDossierServlet() {
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
		int id=Integer.parseInt(request.getParameter("id"));
		try{
			PreparedStatement ps=con.prepareStatement("Select * from dossier where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			JsonObjectBuilder j = Json.createObjectBuilder();
			while(rs.next()){
				j.add("etat", rs.getInt("etat"));
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
