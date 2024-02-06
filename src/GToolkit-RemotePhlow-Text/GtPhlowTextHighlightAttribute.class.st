Class {
	#name : #GtPhlowTextHighlightAttribute,
	#superclass : #GtPhlowTextColorAttribute,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextHighlightAttribute class >> typeLabel [
	^ 'phlowTextHighlightAttribute'
]

{ #category : #accessing }
GtPhlowTextHighlightAttribute >> applyStyleToText: aText [
	aText highlight: self color asColor 
]

{ #category : #accessing }
GtPhlowTextHighlightAttribute >> printOn: aStream [
	aStream
		nextPutAll: 'text-background: ';
		nextPutAll: self color printString
]
