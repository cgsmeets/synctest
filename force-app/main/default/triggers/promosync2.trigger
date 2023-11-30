trigger promosync2 on Promotion2__c (after insert) {

    public class ObjcheckException extends Exception {
       
    }
        
    List<Promotion2__c> objins = new List<Promotion2__c>();
  
    if (Trigger.isafter) {
        for (Promotion2__c p2 : Trigger.new) {
            string p1Name = objectsynccontrol.misobj.get(p2.promotion__c);
            if (p2.Name != p1Name) {
	        	throw new ObjcheckException('Autonumber mismatch Promotion1: ' + p1Name + ' Promotion2: ' + p2.Name);            
            }
 		}
        
    }
    
}