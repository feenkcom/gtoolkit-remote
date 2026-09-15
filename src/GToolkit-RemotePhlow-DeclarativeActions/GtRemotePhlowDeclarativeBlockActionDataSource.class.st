Class {
	#name : #GtRemotePhlowDeclarativeBlockActionDataSource,
	#superclass : #GtRemotePhlowDeclarativeActionDataSource,
	#instVars : [
		'targetBlock'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #actions }
GtRemotePhlowDeclarativeBlockActionDataSource >> executeContextMenuActionForElement: anElement item: anItem index: anIndex [
	| phlowApiWrapper |
	
	phlowApiWrapper := self phlowApiWrapper.
	self targetBlock cull: anElement cull: anItem cull: anIndex.
	
	^ phlowApiWrapper currentAction 
			ifNotNil: [ :aPhlowWrappedAction | 
				aPhlowWrappedAction asDictionaryForExport ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeBlockActionDataSource >> executeRemoteActionWithPhlowResult [
	| phlowApiWrapper |
	
	phlowApiWrapper := self phlowApiWrapper.
	self targetBlock value: phlowApiWrapper.
	
	^ phlowApiWrapper currentAction 
			ifNotNil: [ :aPhlowWrappedAction | 
				aPhlowWrappedAction asDictionaryForExport ]
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
