Class {
	#name : #GtRemotePhlowLocalTextAttributeRunsStyler,
	#superclass : #BlTextStyler,
	#instVars : [
		'attributedRun'
	],
	#category : #'GToolkit-RemoteGt-Styler'
}

{ #category : #accessing }
GtRemotePhlowLocalTextAttributeRunsStyler >> attributedRuns: aCollection [
	attributedRun := aCollection
]

{ #category : #accessing }
GtRemotePhlowLocalTextAttributeRunsStyler >> privateStyle: aText [
	attributedRun do: [ :anAttributedRun |
		anAttributedRun applyStyleToText: aText  ].
	^ aText
]
