convenience - routing
routeSubscriberOn: aTopicName to: aComponentPortAssociation
	self name: aTopicName theComponentCreatedBy: [ :app | MakrosTopicSubscriber forApp: app onTopOfTopicNamed: aTopicName ].
	^ self route: aTopicName asSymbol >> #incoming to: aComponentPortAssociation