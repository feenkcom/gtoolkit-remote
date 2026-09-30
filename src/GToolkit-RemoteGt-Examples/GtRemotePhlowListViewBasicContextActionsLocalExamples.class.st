"
Abstract local subclass for context menu action inspection examples. Subclasses provide the test object directly or wrapped in a simulation.
"
Class {
	#name : #GtRemotePhlowListViewBasicContextActionsLocalExamples,
	#superclass : #GtRemotePhlowListViewBasicContextActionsExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #testing }
GtRemotePhlowListViewBasicContextActionsLocalExamples class >> isAbstract [
	^ self name = #GtRemotePhlowListViewBasicContextActionsLocalExamples
]

{ #category : #expected }
GtRemotePhlowListViewBasicContextActionsLocalExamples >> expectedSingleSelectionForIndex: anIndex [
	^ GtPhlowListingViewSelection forSingleListIndex: anIndex
]
