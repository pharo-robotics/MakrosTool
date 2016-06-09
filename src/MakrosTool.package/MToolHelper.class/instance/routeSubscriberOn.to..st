convenience - routing
routeSubscriberOn: aTopicName to: aComponentPortAssociation
	self name: aTopicName theComponentCreatedBy: [ :app | MakrosTopicSubscriber forApp: app onTopOfTopicNamed: aTopicName ].
	^ self route: aTopicName >> #incoming to: aComponentPortAssociation