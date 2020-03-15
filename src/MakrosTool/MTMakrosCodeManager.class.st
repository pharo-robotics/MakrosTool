Class {
	#name : #MTMakrosCodeManager,
	#superclass : #SCAbstractCodeManager,
	#category : 'MakrosTool'
}

{ #category : #'as yet unclassified' }
MTMakrosCodeManager class >> cleanContent: content [
	^ content copyReplaceAll: self interpreter with: ''
]

{ #category : #'as yet unclassified' }
MTMakrosCodeManager class >> interpreter [
	^ '#!/usr/bin/makros'
]

{ #category : #'as yet unclassified' }
MTMakrosCodeManager >> content [
	^ content copyReplaceAll: self class interpreter with: ''.
]

{ #category : #'as yet unclassified' }
MTMakrosCodeManager >> runnerClass [
	^ MTScriptRunner 
]

{ #category : #'as yet unclassified' }
MTMakrosCodeManager >> title [
	^ 'Makros script'
]
