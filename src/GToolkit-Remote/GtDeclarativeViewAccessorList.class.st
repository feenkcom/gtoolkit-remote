Class {
	#name : #GtDeclarativeViewAccessorList,
	#superclass : #Object,
	#instVars : [
		'object',
		'accessors'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #'instance creation' }
GtDeclarativeViewAccessorList class >> for: anObject [

	^self new object: anObject
]

{ #category : #'as yet unclassified' }
GtDeclarativeViewAccessorList >> accessorWithTitle: aString [

	^accessors detect: [ :each | each title = aString ]
]

{ #category : #accessing }
GtDeclarativeViewAccessorList >> accessors [

	^ accessors ifNil: [ accessors := self getAccessors ]
]

{ #category : #enumerating }
GtDeclarativeViewAccessorList >> accessorsCollect: aBlock [

	^self accessors collect: aBlock
]

{ #category : #private }
GtDeclarativeViewAccessorList >> getAccessors [

	^Array streamContents: [ :stream |
		(object gtViewsInContext: nil) do: [ :view |
			view canBeGtDeclarativeView ifTrue: [ 
				stream nextPut: (GtDeclarativeViewAccessorServer new 
					object: object;
					view: view ) ] ] ]
]

{ #category : #inspecting }
GtDeclarativeViewAccessorList >> gtViewAccessorsListFor: aView [
	<gtView>
	accessors ifNil: [ aView empty ].
	^ aView list 
		title: 'View accessors';
		items: [ accessors ]
]

{ #category : #accessing }
GtDeclarativeViewAccessorList >> object [
	^ object
]

{ #category : #accessing }
GtDeclarativeViewAccessorList >> object: anObject [
	object := anObject
]

{ #category : #printing }
GtDeclarativeViewAccessorList >> printOn: aStream [

	super printOn: aStream.
	aStream
		<< '(';
		print: object;
		<< ')'.
]
