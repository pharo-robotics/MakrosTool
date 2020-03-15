"
Runner that defines a makros variable with the Makros tool helper installed on it. 
"
Class {
	#name : #MTScriptRunner,
	#superclass : #SCScriptRunner,
	#instVars : [
		'makros',
		'log',
		'nodeName'
	],
	#category : 'MakrosTool'
}

{ #category : #'as yet unclassified' }
MTScriptRunner >> initialize [
	super initialize.
	makros := MToolHelper new.
	makros system: system.
]

{ #category : #'as yet unclassified' }
MTScriptRunner >> logFile: aLogFile [
	log := aLogFile writeStream.
	
]

{ #category : #'as yet unclassified' }
MTScriptRunner >> nodeName: aName [
	makros name: aName.
	
]

{ #category : #'as yet unclassified' }
MTScriptRunner >> remap: aName to: aNewName [
	self inform: 'Remapping ', aName, ' To: ', aNewName. 
	makros registerTopicRemap: aName to: aNewName
]

{ #category : #'as yet unclassified' }
MTScriptRunner >> run: aScript [
	super run: aScript.
	log ifNotNil: [ log close ]
]
