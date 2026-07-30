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
GtRemotePhlowViewErrorData >> asDictionaryForExport [
	^(super asDictionaryForExport)
		at: 'errorDescription' put: errorDescription;
		at: 'errorObject' put: errorObject;
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

{ #category : #initialization }
GtRemotePhlowViewErrorData >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.

	self
		errorDescription: (aDictionary at: 'errorDescription');
		errorObject: (aDictionary at: 'errorObject' ifAbsent: [ nil ]);
		isRemoteException: (aDictionary at: 'isRemoteException' ifAbsent: [false]).
]

{ #category : #testing }
GtRemotePhlowViewErrorData >> isPhlowErrorData [
	^true
]

{ #category : #testing }
GtRemotePhlowViewErrorData >> isRemoteException [
	^isRemoteException ifNil: [false]
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> isRemoteException: anObject [
	isRemoteException := anObject
]

{ #category : #accessing }
GtRemotePhlowViewErrorData >> updateLocalRemoteSide [
	self gtDo: [] gemstoneDo: [self beRemoteException]
]
