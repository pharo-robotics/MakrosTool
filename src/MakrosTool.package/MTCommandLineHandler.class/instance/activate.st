as yet unclassified
activate
	self activateHelp.
	self commandLine arguments size = 0
		ifTrue: [ self logCr: 'Loading Makros REPL.'.
			RORepl default
				fullRepl;
				loop ]
		ifFalse: [ self loadSourceFile.
			self loadParameters.
			self installSourceFiles.
			FileStream stdout cr ].
	self exitSuccess