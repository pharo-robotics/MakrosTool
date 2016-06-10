accessing
application
	^ self executeIfApplicationIsNotYetInstalled: [ self applicationNamed: self name ] ifAlreadyInstalled: [ application ]