package scenedipity.utilities;

import org.codehaus.jackson.map.ObjectMapper;
import org.ektorp.CouchDbConnector;
import org.ektorp.CouchDbInstance;
import org.ektorp.http.HttpClient;
import org.ektorp.http.StdHttpClient;
import org.ektorp.impl.StdCouchDbConnector;
import org.ektorp.impl.StdCouchDbInstance;
import java.sql.*;
import scenedipity.model.User;

public class MySQL_UsersToCouch {

	public MySQL_UsersToCouch() throws Exception{

		// --- Connect to couchDB
		HttpClient httpClient = new StdHttpClient.Builder()
		    .url("http://localhost:5984")
		    .build();

		CouchDbInstance dbInstance = new StdCouchDbInstance(httpClient);
		CouchDbConnector db = new StdCouchDbConnector("authdb", dbInstance);
		db.createDatabaseIfNotExists();
		
		// --- Connect to MySQL 
		 Connection conn = null;
         try{
             String userName = "androwis";
             String password = "w3rdup!!w3rdup!!";
             String url = "jdbc:mysql://scenedipity.com:3306/scenedipity";
             Class.forName ("com.mysql.jdbc.Driver").newInstance ();
             conn = DriverManager.getConnection (url, userName, password);
             System.out.println ("Database connection established");
             
             
             // --- retrieve result set
             Statement s = conn.createStatement ();
             s.executeQuery ("SELECT * FROM business");
             ResultSet rs = s.getResultSet ();
             int count = 0;
             while (rs.next ())
             {
                 User temp = new User();
                 if(rs.getInt ("fk_type")==0){
                	 temp.setType("foodtruck");
                 }
                 temp.setName(rs.getString ("username").toLowerCase());
                 temp.hashPassword(rs.getString("password"));
                 temp.setEmail(rs.getString("businessEmail"));
                 temp.setTwit_oauth_token(rs.getString("twit_oauth_token"));
                 temp.setTwit_oauth_secret(rs.getString("twit_oauth_secret"));
                 temp.setFb_oauth_id(rs.getString("fb_oauth_id"));
                 temp.setFb_oauth_token(rs.getString("fb_oauth_token"));
                 db.create(temp );
             }
             rs.close ();
             s.close ();
         }
         catch (Exception e)
         {
             System.err.println ("Cannot connect to database server ");
             e.printStackTrace();
         }
         finally
         {
             if (conn != null)
             {
                 try
                 {
                     conn.close ();
                     System.out.println ("Database connection terminated");
                 }
                 catch (Exception e) { /* ignore close errors */ }
             }
         }
    	}

	
	
	public static void main(String [ ] args)
	{
		try{
			new MySQL_UsersToCouch();
		}catch(Exception e){
			System.out.print(e.getMessage());
		}
	}


}
