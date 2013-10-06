package scenedipity.control;

import scenedipity.model.*;
import scenedipity.repository.AuthenticationRepository;
import javax.servlet.http.*;
import org.ektorp.*;
import org.ektorp.http.*;
import org.joda.time.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class AuthenticationController{
	
	@Autowired
	AuthenticationRepository authRepo;

	// --------------------------- Registration ----------------------------------------
	@RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(){
        return ScenedipityController.buildPage(
        		"Register with Scenedipity",
        		"your account",
        		"pages/register.jsp");
    }
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(
                                 @RequestParam(value = "name", required = true) String name,
                                 @RequestParam(value = "password", required = true) String password,
                                 @RequestParam(value = "email", required = true) String email,
                                 @RequestParam(value = "fullname", required = true) String fullname,
                                 @RequestParam(value = "type", required = true) String type,
                                 HttpSession session) {
		User temp = new User();
		temp.setName(name);
		temp.hashPassword(password);
		temp.setEmail(email);
		temp.setFullname(fullname);
		temp.setType(type);
		authRepo.add(temp);
		session.setAttribute("user", temp);
	  	return ScenedipityController.buildPage(
	  			name+" Welcome Scenedipity",
	  			"your account",
	  			"pages/welcome.jsp");
    }
    
    
	// --------------------------- Authentication ----------------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView gotoLogin(){
		return ScenedipityController.buildPage(
				"Scenedipity Login",
				"login",
				"pages/welcome.jsp");
    }
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView renderCPassPage(
				@RequestParam(value = "name", required = false) String name,
				@RequestParam(value = "password", required = false) String password,
				HttpSession session){
		
        ModelAndView mv = ScenedipityController.buildPage("Welcome to Scenedipity","your","pages/welcome.jsp");
        try{
            User temp =authRepo.get("org.couchdb.user:"+name);
            session.setAttribute("user", temp);
	    	
    		// --- Error Handling--------------
            if(!temp.validate(password)){ 							 		//Wrong password
                mv = ScenedipityController.addErrorMessage("sorry, but you put in the wrong password");	    			
            }
        
        }catch(java.lang.IllegalArgumentException a){ 				//Document ID cannot be empty
            mv = ScenedipityController.addErrorMessage(a.toString());
        
        }catch(org.ektorp.DocumentNotFoundException b){	//User name not found
            mv = ScenedipityController.addErrorMessage("username (<b>"+name+"</b>) not found.");
        }
        return mv;    
    }
    
    
	// --------------------------- Deauthentication ----------------------------------------
	//------------------------------------------------------------------------------------
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView gotoLogout(HttpSession session){
		session.removeAttribute("user");
		return ScenedipityController.buildPage(
                                               "Scenedipity",
                                               "our goodbye",
                                               "pages/logout.jsp");
    }
    
	
	// --- forward requests to couchdb
    //	@RequestMapping(value = "/_session", method = {RequestMethod.GET},
    //			headers = "x-requested-with=XMLHttpRequest")
    //			public 
    //			@ResponseBody userTO
    //			void verifyForXHR(@RequestParam(required = true) String code,
    //					HttpServletRequest request, HttpServletResponse response) {
    //		try {
    //			UserTO userTO = new;
    //			return userTO;
    //		} catch (ExceptionABC ex) {
    //			response.setStatus(response.SC_BAD_REQUEST);
    //			return null;
    //		} catch (RuntimeException ex) {
    //			response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
    //			return null;
    //		}
    //		
    //	}
}
