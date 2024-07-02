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
GtRemotePhlowDeclarativeActionDataSource >> phlowAction: aPhlowAction [ 
	phlowAction := aPhlowAction 
]
