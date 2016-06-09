accessing
name: aName
	^ self executeIfApplicationIsNotYetInstalled: [ name := aName ]