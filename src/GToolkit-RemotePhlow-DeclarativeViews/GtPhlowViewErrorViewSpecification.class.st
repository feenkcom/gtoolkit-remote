Class {
	#name : #GtPhlowViewErrorViewSpecification,
	#superclass : #GtPhlowViewSpecification,
	#instVars : [
		'errorMessage'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowViewErrorViewSpecification class >> fromJSONDictionary: aDictionary [

	^ (super fromJSONDictionary: aDictionary)
		errorMessage: (aDictionary at: 'errorMessage' ifAbsent: [ nil ])
]

{ #category : #converting }
GtPhlowViewErrorViewSpecification >> asDictionaryForExport [ 
	^ super asDictionaryForExport
		at: 'errorMessage' put: errorMessage;
		yourself
]

{ #category : #accessing }
GtPhlowViewErrorViewSpecification >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
GtPhlowViewErrorViewSpecification >> errorMessage: anObject [
	errorMessage := anObject
]
