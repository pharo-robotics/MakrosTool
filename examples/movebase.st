#!/usr/bin/makros/makros


makros name: #movebase theComponentCreatedBy: [ :app | Makros2DMoveBase setupIn: app ].
makros name: #echoer theComponentCreatedBy: [ :app | MakrosEcho forApp: app ].

" Wiring up components "
makros
	applicationNamed: 'EchoerExample';
	route: #echoer >> #echo toPublisherOn: '/echo'.
makros application configure. 
makros start.
" Program Service "
system repeat: [ (makros resolveComponent: #echoer) echo: 'Shiny happy people holding hands ' , String crlf ] each: 10 hz cycleDelay.
