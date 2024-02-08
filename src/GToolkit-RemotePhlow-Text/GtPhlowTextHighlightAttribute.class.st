Class {
	#name : #GtPhlowTextHighlightAttribute,
	#superclass : #GtPhlowTextColorAttribute,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextHighlightAttribute class >> typeLabel [
	^ 'phlowTextHighlightAttribute'
]

{ #category : #styling }
GtPhlowTextHighlightAttribute >> applyStyleToText: aText [
	aText highlight: self color asColor 
]

{ #category : #printing }
GtPhlowTextHighlightAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'phlow text-background: ';
		nextPutAll: self color printString
]
