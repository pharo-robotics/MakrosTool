as yet unclassified
rosUrl: aStringURL
	^ self executeIfApplicationIsNotYetInstalled: [ rosUrl := aStringURL ]