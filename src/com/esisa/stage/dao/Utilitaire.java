package com.esisa.stage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Utilitaire {
	
	private static Connection conn;
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/MinistereTransport","root","");
			System.out.println("Connexion à la base de donnee reussi");
			
		}catch (ClassNotFoundException e)
		{
			System.out.println("driver introuvable");
		} catch(SQLException e)
		{
			System.out.println("Base de données n'existe pas");
			//e.printStackTrace();
		}
	}
	
	public static Connection getConnection()
	{
		return conn;
	}
	
}