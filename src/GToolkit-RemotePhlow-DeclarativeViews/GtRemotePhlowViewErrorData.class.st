Class {
	#name : #GtRemotePhlowViewErrorData,
	#superclass : #GtRemotePhlowBasicViewData,
	#instVars : [
		'errorDescription',
		'errorObject',
		'isRemoteException'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #serialization }
GtRemotePhlowViewErrorData class >> fromJSONDictionary: aDictionary [
	| data |
	data := (self new)
				errorDescription: (aDictionary at: 'errorDescription');
				yourself.
	(aDictionary at: 'isRemoteException' ifAbsent: [false])
		ifTrue: [data beRemoteException].
	^data
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> asDebuggableElement [
	| errorElement |
	errorElement := self isRemoteException
				ifTrue: 
					[| wrapper |
					wrapper := GtRemotePhlowItemExceptionWrapper new
								exceptionDescription: self errorDescription.
					wrapper asDebuggableElement]
				ifFalse: [self errorObject asDebuggableElement].
	errorElement id: GtPhlowExceptionId.
	^errorElement
]

{ #category : #serialization }
GtRemotePhlowViewErrorData >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'errorDescription' put: errorDescription;
		at: 'isRemoteException' put: self isRemoteException;
		yourself
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> beRemoteException [
	isRemoteException := true
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> errorDescription [
	^errorDescription
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> errorDescription: aString [
	errorDescription := aString
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> errorObject [
	^errorObject
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> errorObject: anException [
	errorObject := anException
]

{ #category : #testing }
GtRemotePhlowViewErrorData >> isError [
	^true
]

{ #category : #testing }
GtRemotePhlowViewErrorData >> isRemoteException [
	^isRemoteException ifNil: [false]
]
