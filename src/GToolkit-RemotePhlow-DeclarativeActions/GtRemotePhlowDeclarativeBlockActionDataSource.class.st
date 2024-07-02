Class {
	#name : #GtRemotePhlowDeclarativeBlockActionDataSource,
	#superclass : #GtRemotePhlowDeclarativeActionDataSource,
	#instVars : [
		'targetBlock'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtRemotePhlowDeclarativeBlockActionDataSource >> executeRemoteActionWithPhlowResult [
	| phlowApiWrapper |
	
	phlowApiWrapper := self phlowApiWrapper.
	self targetBlock value: phlowApiWrapper.
	
	^ phlowApiWrapper currentAction asDictionaryForExport
]

{ #category : #accessing }
GtRemotePhlowDeclarativeBlockActionDataSource >> phlowApiWrapper [
	^ GtRemotePhlowApiWrapper new
]

{ #category : #accessing }
GtRemotePhlowDeclarativeBlockActionDataSource >> targetBlock [
	^ targetBlock
]

{ #category : #accessing }
GtRemotePhlowDeclarativeBlockActionDataSource >> targetBlock: aBlockClosure [
	targetBlock := aBlockClosure
]
