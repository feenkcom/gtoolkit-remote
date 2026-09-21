Class {
	#name : #GtRemotePhlowContextMenuBasicAction,
	#superclass : #Object,
	#instVars : [
		'showCondition'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #testing }
GtRemotePhlowContextMenuBasicAction class >> isAbstract [
	^ self name = #GtRemotePhlowContextMenuBasicAction
]

{ #category : #collecting }
GtRemotePhlowContextMenuBasicAction >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: anIndex [
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuBasicAction >> showIf: aBlock [ 
	showCondition := aBlock
]
