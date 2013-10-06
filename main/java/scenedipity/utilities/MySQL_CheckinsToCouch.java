package scenedipity.utilities;

import org.codehaus.jackson.map.ObjectMapper;
import org.ektorp.CouchDbConnector;
import org.ektorp.CouchDbInstance;
import org.ektorp.http.HttpClient;
import org.ektorp.http.StdHttpClient;
import org.ektorp.impl.StdCouchDbConnector;
import org.ektorp.impl.StdCouchDbInstance;
import java.sql.*;
import java.util.ArrayList;

import scenedipity.model.Geometry;
import scenedipity.model.FoodTruckCheckin;

public class MySQL_CheckinsToCouch {

	public MySQL_CheckinsToCouch() throws Exception{

		// --- Connect to couchDB
		HttpClient httpClient = new StdHttpClient.Builder()
		    .url("http://localhost:5984")
		    .build();

		CouchDbInstance dbInstance = new StdCouchDbInstance(httpClient);
		CouchDbConnector db = new StdCouchDbConnector("checkins", dbInstance);
		db.createDatabaseIfNotExists();
		
		// --- Connect to MySQL 
		 Connection conn = null;
         try{
             String username = "androwis";
             String password = "w3rdup!!w3rdup!!";
             String url = "jdbc:mysql://scenedipity.com:3306/scenedipity";
             Class.forName ("com.mysql.jdbc.Driver").newInstance ();
             conn = DriverManager.getConnection (url, username, password);
             System.out.println ("Database connection established");
             
             
             // --- retrieve result set
             Statement s = conn.createStatement ();
             s.executeQuery ("SELECT * FROM foodtrucks_map");
             ResultSet rs = s.getResultSet ();
             int count = 0;
             while (rs.next ())
             {
                 FoodTruckCheckin temp = new FoodTruckCheckin();
                 
                 temp.setFoodtruckID(rs.getString("businessID"));
                 temp.setAnnouncement(rs.getString("Announcement"));
                 temp.setCheckin(rs.getDate("checkin"));
                 temp.setCheckout(rs.getDate("checkout"));
                 Geometry g = new Geometry();
                 ArrayList<Double> c = new ArrayList<Double>();
                 c.add(rs.getDouble("Lat"));
                 c.add(rs.getDouble("Lon"));
                 g.setCoordinates(c);
                 temp.setGeometry(g);
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
			new MySQL_CheckinsToCouch();
		}catch(Exception e){
			System.out.print(e.getMessage());
		}
	}


}
