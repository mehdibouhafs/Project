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
 * Servlet implementation class AuthentificationServlet
 */
@WebServlet("/AuthentificationServlet")
public class AuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthentificationServlet() {
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
		String login=request.getParameter("login");
	  	String password=request.getParameter("password");
	  	//System.out.println();
	  	Connection con=Utilitaire.getConnection();
	  	try{
	  		PreparedStatement ps=con.prepareStatement("Select idEntreprise FROM compte where login=? and password=?");
	  		ps.setString(1, login);
	  		ps.setString(2, password);
	  		ResultSet rs=ps.executeQuery();
	  			int a=0;
	  		while(rs.next()){
	  			a=rs.getInt(1);
	  		}
	  		HttpSession session=request.getSession();
	  		JsonObject activite;
	  		if(a==0){
				//creation de l'objet JSON avec l'affectation d'une valeur à l'attribut desactive
		  		 activite = Json.createObjectBuilder().add("desactive","Compte inexistant" ).build();
		  		session.setAttribute("login",login);
			  	session.setAttribute("password",password);
				  //envoyer les données enregsitrer dans l'objet JSON au demandeur

	  		}else{
		  		//recuperation de l'objet session  pour stocker certains données dans la session
			 
			  	session.setAttribute("login",login);
			  	session.setAttribute("password",password);
			  	session.setAttribute("idEntreprise",a);
		  		//creation de l'objet JSON avec l'affectation d'une valeur à l'attribut desactive
		  		 activite = Json.createObjectBuilder().add("desactive","Compte existe" ).build();
				
	  		}
			response.setContentType("application/json");
			PrintWriter p = response.getWriter();
			p.print(activite);
			p.flush();
	  	}catch(SQLException e){
	  		e.printStackTrace();
	  	}
		
	}

}
