private
executeIfApplicationIsNotYetInstalled: aBlock ifAlreadyInstalled: anOtherBlock
	^ application ifNil: [ aBlock value ] ifNotNil: [ anOtherBlock value ]