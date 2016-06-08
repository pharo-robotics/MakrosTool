as yet unclassified
application
	^ self executeIfApplicationIsNotYetInstalled: [ self applicationNamed: self name ] ifAlreadyInstalled: [  ]