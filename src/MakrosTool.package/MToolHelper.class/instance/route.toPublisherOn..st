convenience - routing
route: aComponentPortAssociation toPublisherOn: aTopicName
	self name: aTopicName theComponentCreatedBy: [ :app | MakrosTopicPublisher forApp: app onTopOfTopicNamed: aTopicName ].
	^ self route: aComponentPortAssociation to: aTopicName >> #outgoing