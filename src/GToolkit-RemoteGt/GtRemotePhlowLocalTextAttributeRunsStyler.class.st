Class {
	#name : #GtRemotePhlowLocalTextAttributeRunsStyler,
	#superclass : #BlTextStyler,
	#instVars : [
		'attributedRuns'
	],
	#category : #'GToolkit-RemoteGt-Styler'
}

{ #category : #accessing }
GtRemotePhlowLocalTextAttributeRunsStyler >> attributedRuns: aRunsCollection [
	attributedRuns := aRunsCollection
]

{ #category : #accessing }
GtRemotePhlowLocalTextAttributeRunsStyler >> privateStyle: aText [
	attributedRuns runsDo: [ :anAttributedRun |
		anAttributedRun applyStyleToText: aText  ].
	^ aText
]
