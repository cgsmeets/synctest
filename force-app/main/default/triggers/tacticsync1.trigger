trigger tacticsync1 on Tactic1__c (after insert) {

    public class Tactic1Exception extends Exception {
       
    }    
        
    List<Tactic2__c> objins = new List<Tactic2__c>();
  
    if (Trigger.isafter) {
        for (Tactic1__c t1 : Trigger.new) {
        	Tactic2__c t2 = new Tactic2__c();
            t2.Tactic1__c = t1.id;
                
            Promotion2__c p2 = new Promotion2__c();
            p2.Name2__c = t1.Promotion1__c;
            t2.Promotion2__r = p2;
            
            objins.add(t2);
       		objectsynccontrol.misobj.put(t1.id, t1.Name);
           
 		}
        
        List<Database.SaveResult> res = Database.insert(objins);
		for (Database.SaveResult fres : res) {
          
            if (!fres.isSuccess()) {
                throw new Tactic1Exception('Source Problems: ' + fres.getId() );
            }
            
    	}
    }
    
}