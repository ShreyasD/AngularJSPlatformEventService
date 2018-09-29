/**
 * Created by shreyasdhond1 on 2018-09-26.
 */

trigger TestPlatformEventTrigger on Test_Platform_Event__e (after insert) {
    List<TestPlatformEventRecord__c> testPlatformEventRecords = new List<TestPlatformEventRecord__c>();
    for(Test_Platform_Event__e evt : Trigger.new) {
        System.debug('Creating record for event: ' + evt);
        TestPlatformEventRecord__c eventRecord = new TestPlatformEventRecord__c();
        eventRecord.User__c = evt.CreatedById;
        eventRecord.Description__c = evt.Description__c;
        testPlatformEventRecords.add(eventRecord);
    }

    insert testPlatformEventRecords;
}