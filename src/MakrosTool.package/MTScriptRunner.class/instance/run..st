as yet unclassified
run: aScript
	super run: aScript.
	log ifNotNil: [ log close ]