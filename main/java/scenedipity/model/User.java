package scenedipity.model;


import org.jasypt.digest.StandardStringDigester;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.ektorp.docref.DocumentReferences;
import org.ektorp.docref.FetchType;
import org.ektorp.support.CouchDbDocument;
import org.ektorp.support.TypeDiscriminator;


public class User extends CouchDbDocument {

        private static final long serialVersionUID = 1L;
        
        /**@TypeDiscriminator is used to mark properties that makes this class's documents unique in the database. */
        @TypeDiscriminator
        private String name;
        private String password;

        private String fullname;
        private String type="user";
        private String email;
        private ArrayList<String> roles = new ArrayList<String>();
        private String twit_oauth_token;
        private String twit_oauth_secret;
        private String fb_oauth_id;
        private String fb_oauth_token;
        
        @JsonIgnore
        private String ok;
        @JsonIgnore
        private String userCtx;
        @JsonIgnore
        private String info;
        
        // --- Getters & Setters
        public String getName(){ return name;}
        public void setName(String u){ 
        		roles.add("");
        		this.setId( "org.couchdb.user:"+u);
        		name=u;
        	}
        
        public String getPassword(){return this.password;}
        public void setPassword(String p){password=p;}
        
        public String getFullname(){ return this.fullname;}
        public void setFullname(String s){fullname = s;}
      
        public String getEmail(){ return this.email;}
        public void setEmail(String s){ email=s;}
        
        public String getType(){ return this.type;}
        public void setType(String s){type=s;}

        public ArrayList<String> getRoles(){ return roles;}

        public String getTwit_oauth_token(){return twit_oauth_token;}
        public void setTwit_oauth_token(String s){twit_oauth_token = s;}

        public String getTwit_oauth_secret(){return twit_oauth_secret;}
        public void setTwit_oauth_secret(String s){twit_oauth_secret = s;}

        public String getFb_oauth_id(){return fb_oauth_id;}
        public void setFb_oauth_id(String s){fb_oauth_id = s;}

        public String getFb_oauth_token(){return fb_oauth_token;}
        public void setFb_oauth_token(String s){fb_oauth_token = s;}
        
        
        
        // --- Authentication and Encryption methods.
        public void hashPassword(String s){
        	StandardStringDigester digester = new StandardStringDigester();
        	digester.setAlgorithm("SHA-1");
        	digester.setIterations(1);
        	digester.setStringOutputType("hexadecimal");
        	digester.setSaltSizeBytes(10);
        	String digested = digester.digest(s).toLowerCase();
        	password=digested;
        }
        public boolean validate(String s){
        	StandardStringDigester digester = new StandardStringDigester();
        	digester.setAlgorithm("SHA-1");
        	digester.setIterations(1);
        	digester.setStringOutputType("hexadecimal");
        	digester.setSaltSizeBytes(10);
        	return digester.matches(s, getPassword());
        }
}