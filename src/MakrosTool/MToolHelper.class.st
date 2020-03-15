"
This facade object allows an easy interaction with makros objects
"
Class {
	#name : #MToolHelper,
	#superclass : #Object,
	#instVars : [
		'host',
		'application',
		'rosUrl',
		'name',
		'componentsDictionary',
		'system',
		'namingTable'
	],
	#category : 'MakrosTool'
}

{ #category : #accessing }
MToolHelper >> application [
	^ self executeIfApplicationIsNotYetInstalled: [ self applicationNamed: self name ] ifAlreadyInstalled: [ application ]
]

{ #category : #accessing }
MToolHelper >> application: anApplication [
	^ self
		executeIfApplicationIsNotYetInstalled: [ 
			componentsDictionary 	associationsDo: [ :a | 
					a value isBlock
						ifTrue: [ a value: (a value value: anApplication) ] ].
			application := anApplication ]
]

{ #category : #'convenience - application build' }
MToolHelper >> applicationNamed: aName [
	^ self executeIfApplicationIsNotYetInstalled: [ self application: (MakrosApplication named: aName atHost: self host onROS: self rosUrl resolvingNamesWith: self namingTable) ]
]

{ #category : #private }
MToolHelper >> executeIfApplicationIsNotYetInstalled: aBlock [
	^ self
		executeIfApplicationIsNotYetInstalled: aBlock
		ifAlreadyInstalled: [ Warning signal: ('Trying to execute {1} after application was already installed. ' format: {aBlock asString}) ]
]

{ #category : #private }
MToolHelper >> executeIfApplicationIsNotYetInstalled: aBlock ifAlreadyInstalled: anOtherBlock [
	^ application ifNil: [ aBlock value ] ifNotNil: [ anOtherBlock value ]
]

{ #category : #accessing }
MToolHelper >> host [
	^ host ifNil: [ self host: self resolveHostAddress ]
]

{ #category : #accessing }
MToolHelper >> host: aHost [
	^ self executeIfApplicationIsNotYetInstalled: [ host := aHost ]
]

{ #category : #initialization }
MToolHelper >> initialize [
	super initialize.
	componentsDictionary := Dictionary new.
	namingTable := MakrosNamingTable new.
]

{ #category : #accessing }
MToolHelper >> name [
	^ name ifNil: [ self name: 'MakrosGenericApplication' ]
]

{ #category : #accessing }
MToolHelper >> name: aName [
	^ self executeIfApplicationIsNotYetInstalled: [ name := aName ]
]

{ #category : #'convenience - components naming' }
MToolHelper >> name: aName theComponentCreatedBy: aBlock [
	| symbol |
	symbol := aName asSymbol.
	self
		executeIfApplicationIsNotYetInstalled: [ componentsDictionary at: symbol put: aBlock ]
		ifAlreadyInstalled: [ componentsDictionary at: symbol ifPresent: [ self error: 'The name ' , symbol , ' is already in use! ' ] ifAbsent: [ componentsDictionary at: symbol put: (aBlock cull: self application) ] ].
]

{ #category : #accessing }
MToolHelper >> namingTable [
	^ namingTable
]

{ #category : #'remap registering' }
MToolHelper >> registerParameterRemap: aName to: aNewName [
	self executeIfApplicationIsNotYetInstalled: [ self namingTable registerParameterRemap: aName to: aNewName ]
]

{ #category : #'remap registering' }
MToolHelper >> registerServiceRemap: aName to: aNewName [
	self executeIfApplicationIsNotYetInstalled: [ self namingTable registerServiceRemap: aName to: aNewName ]
]

{ #category : #'remap registering' }
MToolHelper >> registerTopicRemap: aTopicKeyName to: aNewTopicName [
	self executeIfApplicationIsNotYetInstalled: [ self namingTable registerTopicRemap: aTopicKeyName to: aNewTopicName ]
]

{ #category : #private }
MToolHelper >> resolveComponent: aNameOrComponent [
	^ aNameOrComponent isString
		ifTrue: [ componentsDictionary at: aNameOrComponent asSymbol ifAbsent: [ aNameOrComponent , ' is not a registered component ' ] ]
		ifFalse: [ aNameOrComponent ]
]

{ #category : #private }
MToolHelper >> resolveHostAddress [
	" First try to load the ROS_IP globar variable. If its not set up, use the ROS_HOSTNAME global variable. If it's not setup either of both previous variables, then ask for the Host address   "

	^ ((OSProcess thisOSProcess environmentAt: 'ROS_IP') ifNil: [ NetNameResolver addressForName: (OSProcess thisOSProcess environmentAt: 'ROS_HOSTNAME') ]) ifNil: [ NetNameResolver localHostAddress ]
]

{ #category : #accessing }
MToolHelper >> rosUrl [
	^ rosUrl ifNil: [ self rosUrl: (OSProcess thisOSProcess environmentAt: 'ROS_MASTER_URI') ]
]

{ #category : #accessing }
MToolHelper >> rosUrl: aStringURL [
	^ self executeIfApplicationIsNotYetInstalled: [ rosUrl := aStringURL ]
]

{ #category : #'convenience - routing' }
MToolHelper >> route: aComponentPortAssociation to: anOtherComponentPortAssociation [
	^ self application
		routeFrom: (self resolveComponent: aComponentPortAssociation key)
		port: aComponentPortAssociation value
		to: (self resolveComponent: anOtherComponentPortAssociation key)
		port: anOtherComponentPortAssociation value
]

{ #category : #'convenience - routing' }
MToolHelper >> route: aComponentPortAssociation toPublisherOn: aTopicName [
	self name: aTopicName theComponentCreatedBy: [ :app | MakrosTopicPublisher forApp: app onTopOfTopicNamed: aTopicName ].
	^ self route: aComponentPortAssociation to: aTopicName asSymbol >> #outgoing
]

{ #category : #'convenience - routing' }
MToolHelper >> routeSubscriberOn: aTopicName to: aComponentPortAssociation [
	self name: aTopicName theComponentCreatedBy: [ :app | MakrosTopicSubscriber forApp: app onTopOfTopicNamed: aTopicName ].
	^ self route: aTopicName asSymbol >> #incoming to: aComponentPortAssociation
]

{ #category : #service }
MToolHelper >> start [
	self application
		configure;
		start.
	system registerProcessToJoin: self application process
]

{ #category : #'as yet unclassified' }
MToolHelper >> system: aSystemFacade [
	system := aSystemFacade 
]
