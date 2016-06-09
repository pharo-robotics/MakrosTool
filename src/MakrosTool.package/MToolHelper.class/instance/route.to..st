convenience - routing
route: aComponentPortAssociation to: anOtherComponentPortAssociation
	^ self application
		routeFrom: (self resolveComponent: aComponentPortAssociation key)
		port: aComponentPortAssociation value
		to: (self resolveComponent: anOtherComponentPortAssociation key)
		port: anOtherComponentPortAssociation value