"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMakrosTool,
	#superclass : #PackageManifest,
	#instVars : [
		'makros',
		'system'
	],
	#category : 'MakrosTool'
}

{ #category : #'code-critics' }
ManifestMakrosTool class >> ruleOnlyReadOrWrittenVariableRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#MTScriptRunner)) #'2016-06-09T15:49:57.246491+02:00') )
]

{ #category : #'as yet unclassified' }
ManifestMakrosTool >> ideas [
	" Naming main components "

	makros name: #movebase theComponentCreatedBy: [ :app | Makros2DMoveBase setupIn: app ].
	makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].


	" Wiring up components "
	makros
		applicationNamed: 'EchoerExample';
		route: #echoer >> #echo toPublisherOn: '/echo';
		start.


	" Program Service "
	system repeat: [ (makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf ] each: 10 hz.
	makros name: #asd theComponentCreatedBy: [ :app | MakoSyncRunner forApp: app ].
	(makros resolveComponent: #asd) repeat: [ (makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf ]
]
