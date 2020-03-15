#!/usr/bin/env makros

makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].

" Wiring up components "
makros
	applicationNamed: 'EchoerExample';
	route: #echoer >> #echo toPublisherOn: '/echo';
	start.

" Program Service "
system repeat: [ (makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf ] each: 10 hz cycleDelay.
