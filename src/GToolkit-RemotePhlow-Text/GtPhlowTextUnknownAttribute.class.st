Class {
	#name : #GtPhlowTextUnknownAttribute,
	#superclass : #GtPhlowTextAttribute,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowTextUnknownAttribute class >> typeLabel [
	^ 'phlowTextUnknownAttribute'
]

{ #category : #styling }
GtPhlowTextUnknownAttribute >> applyStyleToText: aText [
]

{ #category : #accessing }
GtPhlowTextUnknownAttribute >> rawData: aTextStylerData [ 
	rawData := aTextStylerData
]
