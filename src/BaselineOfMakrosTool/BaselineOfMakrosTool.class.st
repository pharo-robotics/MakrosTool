Class {
	#name : #BaselineOfMakrosTool,
	#superclass : #BaselineOf,
	#category : #BaselineOfMakrosTool
}

{ #category : #baselines }
BaselineOfMakrosTool >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'Makros' with: [ spec repository: 'github://sbragagnolo/Makros:master' ].
			spec baseline: 'Scale' with: [ spec repository: 'github://guillep/Scale:master' ].
			spec package: #MakrosTool ]
]
