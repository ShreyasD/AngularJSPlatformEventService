var serviceModule = angular.module('platformEventServiceModule', []);

serviceModule.service('platformEventService', function() {
    var conn;

    this.init = function(sessionId) {
        sforce.connection.sessionId=sessionId;
    };

	this.getServiceName = function() {
	    var result = sforce.apex.execute("TestPlatformEventService", "getServiceName", {});
	    console.log(JSON.stringify(result));
	};

	this.createEvent = function() {
	    var result = sforce.apex.execute("TestPlatformEventService", "createPlatformEvent", {});
    }
});