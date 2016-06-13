convenience - application build
applicationNamed: aName
	^ self executeIfApplicationIsNotYetInstalled: [ self application: (MakrosApplication named: aName atHost: self host onROS: self rosUrl resolvingNamesWith: self namingTable) ]