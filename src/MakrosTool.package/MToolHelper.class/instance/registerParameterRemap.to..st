remap registering
registerParameterRemap: aName to: aNewName
	self executeIfApplicationIsNotYetInstalled: [ self namingTable registerParameterRemap: aName to: aNewName ]