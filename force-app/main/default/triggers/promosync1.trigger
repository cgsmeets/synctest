trigger promosync1 on promotion1__c (after insert) {

    public class ObjinsException extends Exception {
       
    }    
        
    List<Promotion2__c> objins = new List<Promotion2__c>();
  
    if (Trigger.isafter) {
        for (Promotion1__c p1 : Trigger.new) {
        	Promotion2__c p2 = new Promotion2__c();
            p2.promotion__c = p1.id;
            objins.add(p2);
       		objectsynccontrol.misobj.put(p1.id, p1.Name);
 		}
        
        List<Database.SaveResult> res = Database.insert(objins);
		for (Database.SaveResult fres : res) {
          
            if (!fres.isSuccess()) {
                throw new ObjinsException('Source Problems: ' + fres.getId() );
            }
            
    	}
    }
    
}