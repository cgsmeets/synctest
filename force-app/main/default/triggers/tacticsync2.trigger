trigger tacticsync2 on Tactic2__c (after insert) {

        public class Tactic2Exception extends Exception {
       
    }
  
    if (Trigger.isafter) {
        for (Tactic2__c t2 : Trigger.new) {
            string t1Name = objectsynccontrol.misobj.get(t2.Tactic1__c);
            if (t2.Name != t1Name) {
	        	throw new Tactic2Exception('Autonumber mismatch Tactic1: ' + t1Name + ' Tactic2: ' + t2.Name);            
            }
 		}
        
    }
    
}