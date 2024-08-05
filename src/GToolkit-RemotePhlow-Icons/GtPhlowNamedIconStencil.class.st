Class {
	#name : #GtPhlowNamedIconStencil,
	#superclass : #GtPhlowIconStencil,
	#instVars : [
		'iconName'
	],
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #'instance creation' }
GtPhlowNamedIconStencil class >> forIconName: anIconName [
	^ self new 
		iconName: anIconName
]

{ #category : #comparing }
GtPhlowNamedIconStencil >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
		
	^ self iconName = anObject iconName
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'iconName' put: self iconName;
		yourself
]

{ #category : #comparing }
GtPhlowNamedIconStencil >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self iconName hash
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> iconName [
	^ iconName
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> iconName: anIconName [
	iconName := anIconName
]

{ #category : #accessing }
GtPhlowNamedIconStencil >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	aDictionary 
		at: 'iconName' 
		ifPresent: [ :anIconName | 
			anIconName ifNotNil: [ 
				self iconName: anIconName ] ]
]
