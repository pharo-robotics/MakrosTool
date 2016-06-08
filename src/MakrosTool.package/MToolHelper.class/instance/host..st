as yet unclassified
host: aHost
	^ self executeIfApplicationIsNotYetInstalled: [ host := aHost ]