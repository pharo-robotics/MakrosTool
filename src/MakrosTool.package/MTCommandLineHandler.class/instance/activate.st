as yet unclassified
activate
	self activateHelp.
	self commandLine arguments size = 0
		ifTrue: [ Smalltalk isInteractive
				ifFalse: [ self roll ] ]
		ifFalse: [ self executeScripts ].
	self exitSuccess