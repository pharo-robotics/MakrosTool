accessing
application: anApplication
	^ self
		executeIfApplicationIsNotYetInstalled: [ 
			application := anApplication.
			componentsDictionary
				associationsDo: [ :a | 
					a value isBlock
						ifTrue: [ a value: (a value value: anApplication) ] ] ]