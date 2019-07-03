Class {
	#name : #GtDeclarativeObjectViewAccessor,
	#superclass : #GtDeclarativeViewAccessor,
	#instVars : [
		'object',
		'selector'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #accessing }
GtDeclarativeObjectViewAccessor >> object [
	^ object
]

{ #category : #accessing }
GtDeclarativeObjectViewAccessor >> object: anObject [
	object := anObject
]

{ #category : #accessing }
GtDeclarativeObjectViewAccessor >> selector [
	^ selector
]

{ #category : #accessing }
GtDeclarativeObjectViewAccessor >> selector: anObject [
	selector := anObject
]
