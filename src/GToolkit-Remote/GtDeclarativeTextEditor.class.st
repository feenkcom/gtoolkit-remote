Class {
	#name : #GtDeclarativeTextEditor,
	#superclass : #GtDeclarativeView,
	#instVars : [
		'string'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #'instance creation' }
GtDeclarativeTextEditor class >> fromJSONDictionary: aDictionary [

	^(super fromJSONDictionary: aDictionary)
		string: (aDictionary at: #string);
		yourself
]

{ #category : #converting }
GtDeclarativeTextEditor >> asDictionaryForExport [ 

	^super asDictionaryForExport 
		at: #string put: string;
		yourself
]

{ #category : #accessing }
GtDeclarativeTextEditor >> string [
	^ string
]

{ #category : #accessing }
GtDeclarativeTextEditor >> string: anObject [
	string := anObject
]

{ #category : #'building - graph' }
GtDeclarativeTextEditor >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^aView textEditor 
		title: title;
		priority: priority;
		text: [ self string asRopedText ]
]
