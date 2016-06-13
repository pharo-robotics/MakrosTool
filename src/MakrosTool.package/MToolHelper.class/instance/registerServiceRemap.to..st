remap registering
registerServiceRemap: aName to: aNewName
	self executeIfApplicationIsNotYetInstalled: [ self namingTable registerServiceRemap: aName to: aNewName ]