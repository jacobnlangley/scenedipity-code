package scenedipity.repository;

import java.util.*;

import scenedipity.model.FoodTruckCheckin;
import org.ektorp.*;
import org.ektorp.support.*;
import org.ektorp.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class CheckinRepository extends CouchDbRepositorySupport<FoodTruckCheckin>{

	@Autowired
	public CheckinRepository(@Qualifier("checkins") CouchDbConnector db) {
		super(FoodTruckCheckin.class, db);
		initStandardDesignDocument();
	}
	
}


/*
 * main
 * 
 * spatial -- this provides geocouch functionality. 
 * {
 "points": "function(doc) {
 if (doc.geometry) {
 emit(doc.geometry, [doc._id, doc.announcement]);
 }
 };"
 }
 */
