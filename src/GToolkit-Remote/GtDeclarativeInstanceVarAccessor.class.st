Class {
	#name : #GtDeclarativeInstanceVarAccessor,
	#superclass : #Object,
	#instVars : [
		'list'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtDeclarativeInstanceVarAccessor class >> list: aTableView [

	^ self new list: aTableView
]

{ #category : #accessing }
GtDeclarativeInstanceVarAccessor >> list [
	^ list
]

{ #category : #accessing }
GtDeclarativeInstanceVarAccessor >> list: anObject [
	list := anObject
]

{ #category : #'as yet unclassified' }
GtDeclarativeInstanceVarAccessor >> sentItem: anArray at: anIndex [

	^ anArray second
]
