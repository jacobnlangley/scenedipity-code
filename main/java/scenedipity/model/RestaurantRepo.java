package scenedipity.model;

import java.util.List;

import org.ektorp.CouchDbConnector;
import org.ektorp.support.CouchDbRepositorySupport;
import org.ektorp.support.GenerateView;

public class RestaurantRepo extends CouchDbRepositorySupport<Restaurant> {
	
	 public RestaurantRepo(CouchDbConnector db) {
		super(Restaurant.class, db);
	}

	 @GenerateView
	 public List<Restaurant> findByName(String name) {
	     return queryView("name", name);
	 }
	 
}
