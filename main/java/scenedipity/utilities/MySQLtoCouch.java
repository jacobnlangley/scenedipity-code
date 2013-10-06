package scenedipity.utilities;
import java.io.File;

import scenedipity.model.Restaurant;
import org.codehaus.jackson.map.ObjectMapper;
import org.ektorp.CouchDbConnector;
import org.ektorp.CouchDbInstance;
import org.ektorp.http.HttpClient;
import org.ektorp.http.StdHttpClient;
import org.ektorp.impl.StdCouchDbConnector;
import org.ektorp.impl.StdCouchDbInstance;

public class MySQLtoCouch {

	public MySQLtoCouch() throws Exception{

		// --- Connect to couchDB
		HttpClient httpClient = new StdHttpClient.Builder()
		    .url("http://localhost:5984")
		    .build();

		CouchDbInstance dbInstance = new StdCouchDbInstance(httpClient);
		CouchDbConnector db = new StdCouchDbConnector("scenedipity", dbInstance);
		db.createDatabaseIfNotExists();

		ObjectMapper mapper = new ObjectMapper();

		File dir = new File("/Dropbox/documents/Professional/Scenedipity/jsonfiles/scenedipity.copy");
		
		for(File f : dir.listFiles()){
			try{
			Restaurant rest = mapper.readValue(f, Restaurant.class);
			rest.setId(f.getName().toLowerCase());
			db.update(rest);
			
			}catch(Exception e){
				System.out.println(e.toString());
			}
			
		}
		httpClient.shutdown();
		
	}

	public static void main(String [ ] args)
	{
		try{
			new MySQLtoCouch();
		}catch(Exception e){
			System.out.print(e.getLocalizedMessage());
		}
	}


}
