remap registering
registerTopicRemap: aTopicKeyName to: aNewTopicName
	self executeIfApplicationIsNotYetInstalled: [ self namingTable registerTopicRemap: aTopicKeyName to: aNewTopicName ]