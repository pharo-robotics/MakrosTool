as yet unclassified
applicationNamed: aName
	^ self executeIfApplicationIsNotYetInstalled: [ application := MakrosApplication named: aName atHost: self host onROS: self rosUrl ].