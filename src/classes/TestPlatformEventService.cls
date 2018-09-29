global with sharing class TestPlatformEventService {

    @AuraEnabled
    webservice static String getServiceName() {
        return TestPlatformEventService.class.getName();
    }

    @AuraEnabled
    webservice static void createPlatformEvent() {
        List<Test_Platform_Event__e> testEvents = new List<Test_Platform_Event__e>();
        testEvents.add(new Test_Platform_Event__e(Description__c = 'Test Event ' + Math.random()));

        // Call method to publish events
        List<Database.SaveResult> results = EventBus.publish(testEvents);

        // Inspect publishing result for each event
        for (Database.SaveResult sr : results) {
            if (sr.isSuccess()) {
                System.debug('Successfully published event.');
            } else {
                for (Database.Error err : sr.getErrors()) {
                    System.debug('Error returned: ' +
                            err.getStatusCode() +
                            ' - ' +
                            err.getMessage());
                }
            }
        }
    }
}