package scenedipity.repository;

import java.util.*;

import scenedipity.model.Restaurant;
import org.ektorp.*;
import org.ektorp.support.*;
import org.ektorp.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class RestaurantRepository extends CouchDbRepositorySupport<Restaurant> {

	@Autowired
	public RestaurantRepository(@Qualifier("scenedipity") CouchDbConnector db) {
		super(Restaurant.class, db);
		initStandardDesignDocument();
	}

	@GenerateView @Override
	public List<Restaurant> getAll() {
		ViewQuery q = createQuery("all")
						.descending(true)
						.includeDocs(true);
		return db.queryView(q, Restaurant.class);
	}
	
	public Page<Restaurant> getAll(PageRequest pr) {
		ViewQuery q = createQuery("all")
						.descending(true)
						.includeDocs(true);
		return db.queryForPage(q, pr, Restaurant.class);
	}

}
