/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Java4
 */
public class DbConnection {
    static Connection co;
	public static Connection getconnection()
	{
 		
 			
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			co = DriverManager.getConnection("jdbc:mysql://localhost:3306/load","root","root");
		}
		catch(Exception e)
		{
			System.out.println("Database Error"+e);
		}
		return co;
	}
}
