public class HomeAssistantIntegrationtest1 {

    // Define the Home Assistant REST API endpoint
    private static final String HOME_ASSISTANT_ENDPOINT = 'https://loudcows.duckdns.org/api/states/switch.node_48';

    public static void readKitchenCoverState() {
        // Create an HTTP request to the Home Assistant REST API
        HttpRequest request = new HttpRequest();
        request.setEndpoint(HOME_ASSISTANT_ENDPOINT);
        request.setHeader('Authorization', 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkZDU2YzMwYmQ3NjE0OWJmYjY2Nzk1MzE0OTdkMTMyOCIsImlhdCI6MTYzNzUwNDgwNywiZXhwIjoxOTUyODY0ODA3fQ.JaDjL-EbPBYTor32g2Hpf_uYRVemkToKGmY3fq0vAC0');
        // Replace API_KEY_HERE with your Home Assistant API key
        request.setHeader('Content-Type', 'application/json');
        request.setMethod('GET');


        // Send the HTTP request and get the response
        Http http = new Http();
        HttpResponse response = http.send(request);

        system.debug(logginglevel.info, response.getBody());
        
        // Create a new record in Salesforce with the Home Assistant entity state
        Account account = new Account();
        account.Name = 'Kitchen Cover';
//        account.Home_Assistant_Entity_ID__c = entityId;
//        account.Home_Assistant_State__c = state;
        insert account;

        // Debug log the Home Assistant entity state    
        }
}