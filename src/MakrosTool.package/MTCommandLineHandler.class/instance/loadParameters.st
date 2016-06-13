as yet unclassified
loadParameters
	| pair variable value |
	self commandLine arguments allButFirst
		select: #isNotEmpty
		thenDo: [ :arg | 
			pair := ':=' split: (arg copyReplaceAll: '__' with: '').
			pair size = 2
				ifTrue: [ variable := pair at: 1.
					value := pair at: 2.
					(self respondsTo: (variable , ':') asSymbol)
						ifTrue: [ self perform: (variable , ':') asSymbol withArguments: {value} ]
						ifFalse: [ self remap: variable to: value. ] ]
				ifFalse: [ self halt ] ]