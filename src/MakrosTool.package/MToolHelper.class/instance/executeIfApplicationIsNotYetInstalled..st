private
executeIfApplicationIsNotYetInstalled: aBlock
	^ self
		executeIfApplicationIsNotYetInstalled: aBlock
		ifAlreadyInstalled: [ Warning signal: ('Trying to execute {1} after application was already installed. ' format: {aBlock asString}) ]