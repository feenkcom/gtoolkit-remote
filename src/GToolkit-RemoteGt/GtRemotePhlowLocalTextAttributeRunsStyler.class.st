Class {
	#name : #GtRemotePhlowLocalTextAttributeRunsStyler,
	#superclass : #BlTextStyler,
	#instVars : [
		'attributeRuns'
	],
	#category : #'GToolkit-RemoteGt-Styler'
}

{ #category : #accessing }
GtRemotePhlowLocalTextAttributeRunsStyler >> attributeRuns: aRunsCollection [
	attributeRuns := aRunsCollection
]

{ #category : #accessing }
GtRemotePhlowLocalTextAttributeRunsStyler >> privateStyle: aText [
	attributeRuns runsDo: [ :anAttributedRun |
		anAttributedRun applyStyleToText: aText  ].
	^ aText
]
