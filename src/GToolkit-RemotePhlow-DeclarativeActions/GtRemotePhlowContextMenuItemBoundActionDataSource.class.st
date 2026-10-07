Class {
	#name : #GtRemotePhlowContextMenuItemBoundActionDataSource,
	#superclass : #GtRemotePhlowDeclarativeActionDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionDataSource >> executeRemoteActionWithPhlowResult [
	| phlowApiWrapper |
	
	phlowApiWrapper := self phlowApiWrapper.
	phlowAction executeActionFrom: phlowApiWrapper.
	
	^ phlowApiWrapper currentAction 
			ifNotNil: [ :aPhlowWrappedAction | 
				aPhlowWrappedAction asDictionaryForExport ]
]

{ #category : #accessing }
GtRemotePhlowContextMenuItemBoundActionDataSource >> phlowApiWrapper [
	^ GtRemotePhlowApiWrapper new
]
