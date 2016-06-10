#!/usr/bin/makros/makros


makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].
makros name: #syncer theComponentCreatedBy: [ :app | MakoSyncRunner forApp: app ].


" Wiring up components "
makros
	applicationNamed: 'EchoerExample';
	route: #echoer >> #echo toPublisherOn: '/echo';
	start.

" Program Service "

	
(makros resolveComponent: #syncer) repeat: [ (makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf ]
