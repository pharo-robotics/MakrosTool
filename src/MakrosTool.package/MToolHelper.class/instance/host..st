accessing
host: aHost
	^ self executeIfApplicationIsNotYetInstalled: [ host := aHost ]