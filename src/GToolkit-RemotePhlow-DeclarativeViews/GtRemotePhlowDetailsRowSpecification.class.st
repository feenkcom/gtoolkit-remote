Class {
	#name : #GtRemotePhlowDetailsRowSpecification,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowDetailsRowSpecification class >> fromJSONDictionary: aDictionary [
	^ self new
		name: (aDictionary at: 'name')
]

{ #category : #'as yet unclassified' }
GtRemotePhlowDetailsRowSpecification >> asDictionaryForExport [
	^ Dictionary new
		at: 'name' put: name;
		yourself
]

{ #category : #accessing }
GtRemotePhlowDetailsRowSpecification >> name [
	^ name
]

{ #category : #accessing }
GtRemotePhlowDetailsRowSpecification >> name: anObject [
	name := anObject
]
