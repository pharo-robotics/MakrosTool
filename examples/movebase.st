#!/usr/bin/makros/makros


makros name: #movebase theComponentCreatedBy: [ :app | Makros2DMoveBase setupIn: app ].

" Wiring up components "
makros
	applicationNamed: 'MoveBaseBasicBinding';
	start.


