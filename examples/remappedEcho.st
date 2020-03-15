#!/usr/bin/env makros

makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].

makros applicationNamed: 'EchoerExample'.

makros registerTopicRemap: '/echo' to: '/remapped/echo'.

" Wiring up components "
makros
	route: #echoer >> #echo toPublisherOn: '/echo';
	start.

" Program Service "
system repeat: [ (makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf ] each: 10 hz cycleDelay.
