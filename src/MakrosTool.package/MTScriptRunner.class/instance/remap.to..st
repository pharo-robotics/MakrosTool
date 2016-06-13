as yet unclassified
remap: aName to: aNewName
	self inform: 'Remapping ', aName, ' To: ', aNewName. 
	makros registerTopicRemap: aName to: aNewName