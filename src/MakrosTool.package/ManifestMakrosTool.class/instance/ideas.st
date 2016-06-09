as yet unclassified
ideas
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