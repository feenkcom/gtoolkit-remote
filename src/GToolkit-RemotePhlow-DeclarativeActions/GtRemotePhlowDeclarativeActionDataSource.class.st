Class {
	#name : #GtRemotePhlowDeclarativeActionDataSource,
	#superclass : #Object,
	#instVars : [
		'phlowAction'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeActionDataSource class >> forPhlowAction: aPhlowAction [
	^ self new
		phlowAction: aPhlowAction
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionDataSource >> definingMethod [
	^ self phlowAction definingMethod
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionDataSource >> phlowAction [
	^ phlowAction
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionDataSource >> phlowAction: aPhlowAction [ 
	phlowAction := aPhlowAction 
]
