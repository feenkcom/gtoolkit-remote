Class {
	#name : #GtPhlowTextForegroundAttribute,
	#superclass : #GtPhlowTextColorAttribute,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextForegroundAttribute class >> typeLabel [
	^ 'phlowTextForegroundAttribute'
]

{ #category : #styling }
GtPhlowTextForegroundAttribute >> applyStyleToText: aText [
	aText foreground: self color asColor 
]

{ #category : #printing }
GtPhlowTextForegroundAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'text-foreground: ';
		nextPutAll: self color printString
]
