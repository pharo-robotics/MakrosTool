accessing
rosUrl: aStringURL
	^ self executeIfApplicationIsNotYetInstalled: [ rosUrl := aStringURL ]