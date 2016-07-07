as yet unclassified
executeScripts
	(Smalltalk isInteractive and: [ self commandLine arguments size = 1 and: [ self manageInteractive: self commandLine arguments ] ])
		ifFalse: [ self loadSourceFile.
			self loadParameters.
			self installSourceFiles.
			FileStream stdout cr ]