Extension { #name : #SCSystemFacade }

{ #category : #'*MakrosTool' }
SCSystemFacade >> repeat: aBlockClosure each: aDelay [
	[ true ]
		whileTrue: [ aBlockClosure value.
			aDelay wait ]
]
