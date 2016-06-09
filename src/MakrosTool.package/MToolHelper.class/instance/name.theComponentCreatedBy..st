convenience - components naming
name: aName theComponentCreatedBy: aBlock
	| symbol |
	symbol := aName asSymbol.
	self
		executeIfApplicationIsNotYetInstalled: [ componentsDictionary at: symbol put: aBlock ]
		ifAlreadyInstalled: [ componentsDictionary at: symbol ifPresent: [ self error: 'The name ' , symbol , ' is already in use! ' ] ifAbsent: [ componentsDictionary at: symbol put: (aBlock cull: self application) ] ].