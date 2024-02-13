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

{ #category : #comparing }
GtPhlowTextUnknownAttribute >> equals: anAnotherAttribute [
	^ self rawData = anAnotherAttribute rawData
]

{ #category : #comparing }
GtPhlowTextUnknownAttribute >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self rawData hash
]

{ #category : #accessing }
GtPhlowTextUnknownAttribute >> rawData [
	^ rawData
]

{ #category : #accessing }
GtPhlowTextUnknownAttribute >> rawData: aTextStylerData [ 
	rawData := aTextStylerData
]
