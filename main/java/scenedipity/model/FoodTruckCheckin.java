package scenedipity.model;


import org.jasypt.digest.StandardStringDigester;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.ektorp.docref.DocumentReferences;
import org.ektorp.docref.FetchType;
import org.ektorp.support.CouchDbDocument;
import org.ektorp.support.TypeDiscriminator;
import scenedipity.model.Geometry;

public class FoodTruckCheckin extends CouchDbDocument {

        private static final long serialVersionUID = 1L;
        
        /**@TypeDiscriminator is used to mark properties that makes this class's documents unique in the database. */
        @TypeDiscriminator
        private String foodtruckID;
        private String announcement;
        private String type="Checkin";
        private Date checkin;
        private Date checkout;
        private Geometry geometry;
        
        // --- Getters & Setters
        public String getFoodtruckID(){ return foodtruckID;}
        public void setFoodtruckID(String s){ foodtruckID=s;}

        public String getAnnouncement(){ return announcement;}
        public void setAnnouncement(String s){ announcement=s;}

        public String getType(){ return type;}
        public void setType(String s){type=s;}

        
        public Date getCheckin(){ return checkin;}
        public void setCheckin(Date s){ checkin =s;}

        public Date getCheckout(){ return checkout;}
        public void setCheckout(Date s){ checkout = s;}
        
        public Geometry getGeometry(){ return geometry;}
        public void setGeometry(Geometry s){ geometry = s;}
        
        

}