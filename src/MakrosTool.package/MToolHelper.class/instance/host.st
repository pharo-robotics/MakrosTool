accessing
host
	^ host ifNil: [ self host: self resolveHostAddress ]