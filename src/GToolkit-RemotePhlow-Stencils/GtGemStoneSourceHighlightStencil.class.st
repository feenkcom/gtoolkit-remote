Class {
	#name : #GtGemStoneSourceHighlightStencil,
	#superclass : #GtPhlowStencil,
	#instVars : [
		'sourceString',
		'highlightStart',
		'highlightEnd'
	],
	#category : #'GToolkit-RemotePhlow-Stencils-Debugger'
}

{ #category : #serialization }
GtGemStoneSourceHighlightStencil >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'sourceString' put: sourceString;
		at: 'highlightStart' put: highlightStart;
		at: 'highlightEnd' put: highlightEnd;
		yourself
]

{ #category : #accessing }
GtGemStoneSourceHighlightStencil >> highlightEnd: anInteger [
	highlightEnd := anInteger
]

{ #category : #accessing }
GtGemStoneSourceHighlightStencil >> highlightStart: anInteger [
	highlightStart := anInteger
]

{ #category : #serialization }
GtGemStoneSourceHighlightStencil >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	sourceString := aDictionary at: 'sourceString'.
	highlightStart := aDictionary at: 'highlightStart'.
	highlightEnd := aDictionary at: 'highlightEnd'
]

{ #category : #accessing }
GtGemStoneSourceHighlightStencil >> sourceString: aString [
	sourceString := aString
]
