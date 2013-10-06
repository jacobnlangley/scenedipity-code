package scenedipity.control;

import scenedipity.model.*;
import scenedipity.repository.*;
import javax.servlet.http.*;
import org.ektorp.*;
import org.joda.time.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class ScenedipityController{

	@Autowired
	RestaurantRepository restaurantRepo;
	@Autowired
	CheckinRepository checkinRepo;

	// --- helper functions ------------------------------------------------------------
	@RequestMapping( value = "/favicon", method = RequestMethod.GET)
	public ModelAndView getFaviconl() { return new ModelAndView();}
    
	public static ModelAndView addErrorMessage(String s){
		return ScenedipityController.buildPage("Register w/ Scenedipity","login","pages/register.jsp")
		.addObject("message", s)
		.addObject("message-type","error");
	}
	
	public static ModelAndView buildPage(String title, String who, String include){
		return new ModelAndView("/index")
		.addObject("title", title)
		.addObject("who", who)
		.addObject("include",include);
	} 
	
	public static ModelAndView buildAuthPage(HttpSession session, String title, String who, String include){
		if(session.getAttribute("user")!=null)
			return buildPage(title, who, include);
		else
			return addErrorMessage("Sorry, you have to be logged in for this content.");
	}
	

	// --- Home Page ------------------------------------------------------------------
	@RequestMapping( value = "/", method = RequestMethod.GET)
	public ModelAndView viewAll(@RequestParam(value = "p", required = false) String pageLink) {
		ModelAndView temp = buildPage(	"Find a restaurant, foodtruck, or anything in between",	"everyone",	"pages/index.jsp");
		PageRequest pr = pageLink != null ? PageRequest.fromLink(pageLink) : PageRequest.firstPage(100);
		temp.addObject("page",restaurantRepo.getAll(pr));
		return temp; 
	}

	// --- Documentation ------------------------------------------------------------------
    @RequestMapping(value="/import", method = RequestMethod.GET)
	public ModelAndView importData(){
		try{
			//new MySQL_CheckinsToCouch();
			//new MySQL_UsersToCouch();
		}catch(Exception e){
			System.out.println(e.getLocalizedMessage());
		}
		return buildPage(
           "Data Importer",
           "the hood",
           "docs/import.jsp");
	}
    
	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
	public ModelAndView goToAboutUs() {
		return buildPage(
				"About Scenedipity",
				"our company",
				"docs/about-us.jsp");
	}
	

	@RequestMapping(value = "/find-food", method = RequestMethod.GET)
	public ModelAndView goToFindFood() {
		return buildPage(
				"Find Food",
				"Find You Some Tasty Vittles",
		"docs/find-food.jsp");
	}
	
	@RequestMapping(value = "/feed-the-masses", method = RequestMethod.GET)
	public ModelAndView goToFeedTheMasses() {
		return buildPage(
				"Feed the Masses",
				"Spreadin' the Tasebud Love",
		"docs/feed-the-masses.jsp");
	}

	@RequestMapping(value = "/local-business", method = RequestMethod.GET)
	public ModelAndView goToLocalBusiness() {
		return buildPage(
				"Local Business",
				"Make Sweet Tastebud Love.",
		"docs/local-business.jsp");
	}
	
	@RequestMapping(value = "/how-scenedipity-works", method = RequestMethod.GET)
	public ModelAndView goToHowScenedipityWorks() {
		return buildPage(
				"How scenedipity Works",
				"Post Once. Blast Everywhere.",
		"docs/how-scenedipity-works.jsp");
	}
	
	@RequestMapping(value = "/web-services", method = RequestMethod.GET)
	public ModelAndView goToWebServices() {
		return buildPage(
				"Web Services",
				"Let Us Help.",
		"docs/web-services.jsp");
	}

	@RequestMapping(value = "/products-offered", method = RequestMethod.GET)
	public ModelAndView goToProducts() {
		return buildPage(
				"Services and Products Offered by Scenedipity, Inc.",
				"our product",
				"docs/products-offered.jsp");
	}

	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public ModelAndView goToPrivacy() {
		return buildPage(
				"Privacy by Scenedipity, Inc.",
				"your privacy",
				"docs/privacy.jsp");
	}

	@RequestMapping(value = "/terms-of-service", method = RequestMethod.GET)
	public ModelAndView goToTerms() {
		return buildPage(
				"Terms of Service by Scenedipity, Inc.",
				"our term",
				"docs/terms-of-service.jsp");
	}
	
	@RequestMapping(value = "/oauth", method = RequestMethod.GET)
	public ModelAndView goToOauth() {
		return buildPage(
				"Building Your Scene",
				"your",
				"oauth/oauth.jsp");
	}
	
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public ModelAndView goToSchedlue(HttpSession session) {
		return buildPage(
				"Write your own future with Scenedipity",
				"the future",
				"pages/schedule.jsp");
	}

	
	// --- pages that require validated sessions ----------------------------------
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public ModelAndView goToSettings(HttpSession session) {
		return buildAuthPage(
				session,
				"Edit your information on Scenedipity",
				"your info",
				"pages/settings.jsp")
				.addObject("user",session.getAttribute("user"));
	}
	
	// --- menu pages --------------------------------------------------------------
	@RequestMapping(value = "/{page}", method = RequestMethod.GET)
	public ModelAndView viewPost(@PathVariable("page") String page) {
		if(page.equalsIgnoreCase("streets") || page.equalsIgnoreCase("foodtrucks")){
			return buildPage(
					"finding food trucks with the help of scenedipity",
					"the street",
					"pages/foodtrucks.jsp")
					.addObject("checkins", checkinRepo.getAll());
		}else{// --- dynamic pages
			//<scenedipity:head title="${restaurant.restaurant_info.restaurant_name} (${restaurant.id}) on scenedipity" />
			Restaurant toReturn = restaurantRepo.get(page.toLowerCase());
			return buildPage(
					"A restaurant's name.",
					"asheville's",
					"pages/menu.jsp")
					.addObject("restaurant",toReturn);
		}
	}
}
