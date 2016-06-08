as yet unclassified
host
	^ host ifNil: [ self host: self resolveHostAddress ]