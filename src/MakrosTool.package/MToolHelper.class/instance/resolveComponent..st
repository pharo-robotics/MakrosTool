private
resolveComponent: aNameOrComponent
	^ aNameOrComponent isString
		ifTrue: [ componentsDictionary at: aNameOrComponent asSymbol ifAbsent: [ aNameOrComponent , ' is not a registered component ' ] ]
		ifFalse: [ aNameOrComponent ]