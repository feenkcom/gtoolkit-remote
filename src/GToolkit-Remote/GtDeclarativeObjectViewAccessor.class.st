"
GtDeclarativeObjectViewAccessor is a leftover from initial development work on remote object viewing over Seamless.  It will be removed as part of the effort to get Seamless remote object viewing working again.
"
Class {
	#name : #GtDeclarativeObjectViewAccessor,
	#superclass : #GtDeclarativeViewAccessor,
	#instVars : [
		'object',
		'selector'
	],
	#category : #'GToolkit-Remote-Inspection'
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
