Class {
	#name : #GtDeclarativeViewAccessorClient,
	#superclass : #GtDeclarativeViewAccessor,
	#instVars : [
		'proxy'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #accessing }
GtDeclarativeViewAccessorClient >> declarativeView [ 

	^declarativeView ifNil: [ declarativeView := 
		(proxy declarativeViewAt: id)
			accessor: self;
			yourself ]
]

{ #category : #accessing }
GtDeclarativeViewAccessorClient >> priority: aNumber [

	priority := aNumber
]

{ #category : #accessing }
GtDeclarativeViewAccessorClient >> proxy [
	^ proxy
]

{ #category : #accessing }
GtDeclarativeViewAccessorClient >> proxy: anObject [
	proxy := anObject
]

{ #category : #accessing }
GtDeclarativeViewAccessorClient >> sentItemAt: anIndex [

	^proxy sentItemAt: (id, '/', anIndex asString)
]

{ #category : #accessing }
GtDeclarativeViewAccessorClient >> title: aString [

	title := aString
]
