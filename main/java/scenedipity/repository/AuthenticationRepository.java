package scenedipity.repository;

import java.util.*;

import scenedipity.model.User;
import org.ektorp.*;
import org.ektorp.support.*;
import org.ektorp.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class AuthenticationRepository extends CouchDbRepositorySupport<User> {

	@Autowired
	public AuthenticationRepository(@Qualifier("auth") CouchDbConnector db) {
		super(User.class, db);
		initStandardDesignDocument();
	}
}
