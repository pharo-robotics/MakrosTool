"
This command responds to 'makros' keyword and it uses an MTScriptRunner
"
Class {
	#name : #MTCommandLineHandler,
	#superclass : #SCCommandLineHandler,
	#category : 'MakrosTool'
}

{ #category : #'as yet unclassified' }
MTCommandLineHandler class >> commandName [
	^ 'makros'
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> activate [
	self activateHelp.
	self commandLine arguments size = 0
		ifTrue: [ Smalltalk isInteractive
				ifFalse: [ self roll ] ]
		ifFalse: [ self executeScripts ].
	self exitSuccess
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> createRunner [
	^ MTScriptRunner new
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> executeScripts [
	(Smalltalk isInteractive and: [ self commandLine arguments size = 1 and: [ self manageInteractive: self commandLine arguments ] ])
		ifFalse: [ self loadSourceFile.
			self loadParameters.
			self installSourceFiles.
			FileStream stdout cr ]
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> loadParameters [
	| pair variable value |
	self commandLine arguments allButFirst
		select: #isNotEmpty
		thenDo: [ :arg | 
			pair := ':=' split: (arg copyReplaceAll: '__' with: '').
			pair size = 2
				ifTrue: [ variable := pair at: 1.
					value := pair at: 2.
					(self respondsTo: (variable , ':') asSymbol)
						ifTrue: [ self perform: (variable , ':') asSymbol withArguments: {value} ]
						ifFalse: [ self remap: variable to: value. ] ]
				ifFalse: [ self halt ] ]
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> loadSourceFile [
	self loadSourceFiles: {(self commandLine arguments at: 1)}
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> log: aLogFilePath [
	runner logFile: (aLogFilePath asFileReference openWritable: true).
	
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> name: aNodeName [ 
	runner nodeName: aNodeName 
]

{ #category : #'as yet unclassified' }
MTCommandLineHandler >> remap: aVariableName to: aNewName [
	runner remap: aVariableName to: aNewName

]
