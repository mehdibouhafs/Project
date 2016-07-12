package com.esisas.stage.business;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esisa.stage.dao.Utilitaire;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



/**
 * Servlet implementation class passwordresetServlet
 */
@WebServlet("/passwordresetServlet")
public class passwordresetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public passwordresetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
	
		HttpSession session1=request.getSession();
		String admin=(String)session1.getAttribute("login");
		int a=0;
		Connection con=Utilitaire.getConnection();
		try{
			PreparedStatement ps=con.prepareStatement("select count(*) from compte where login=? and password=?");
			ps.setString(2, pass2);
			ps.setString(1, admin);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				a=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		if(a>0){
			try{
				PreparedStatement ps=con.prepareStatement("UPDATE compte set password=? where login=?");
				ps.setString(1, pass2);
				ps.setString(2, admin);
				ps.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}

}
