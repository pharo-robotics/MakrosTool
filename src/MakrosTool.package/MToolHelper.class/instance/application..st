accessing
application: anApplication
	^ self
		executeIfApplicationIsNotYetInstalled: [ 
			componentsDictionary 	associationsDo: [ :a | 
					a value isBlock
						ifTrue: [ a value: (a value value: anApplication) ] ].
			application := anApplication ]