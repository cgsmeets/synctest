public with sharing class HomeAssistantController {
    // Define the Home Assistant REST API endpoint URL and access token
    private static final String API_BASE_URL = 'https://loudcows.duckdns.org/api';
    private static final String ACCESS_TOKEN = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkZDU2YzMwYmQ3NjE0OWJmYjY2Nzk1MzE0OTdkMTMyOCIsImlhdCI6MTYzNzUwNDgwNywiZXhwIjoxOTUyODY0ODA3fQ.JaDjL-EbPBYTor32g2Hpf_uYRVemkToKGmY3fq0vAC0';

    // Define a method to retrieve the state of a Home Assistant entity
    public static String getSwitchNode48State() {
        // Build the API endpoint URL for the "switch.node_48" entity
        String endpointUrl = API_BASE_URL + '/states/switch.node_48';

        // Send an HTTP GET request to the endpoint URL with the access token in the "Authorization" header
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpointUrl);
        request.setHeader('Authorization', 'Bearer ' + ACCESS_TOKEN);
        request.setMethod('GET');

        // Send the HTTP request and retrieve the response
        Http http = new Http();
        HttpResponse response = http.send(request);

        // Parse the JSON response and return the state value
        if (response.getStatusCode() == 200) {
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String stateValue = (String) responseMap.get('state');
            return stateValue;
        } else {
            // Handle error response
            return null;
        }
    }
}