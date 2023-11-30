public class HomeAssistantAPI86 {
    public static String readSwitchState(String baseURL, String token, String entityId) {
        String endpoint = baseURL + '/api/states/' + entityId;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + token);
        HttpResponse res = h.send(req);
        if (res.getStatusCode() == 200) {
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) result.get('state');
        } else {
            return null;
        }
    }
}