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

{ #category : #testing }
GtRemotePhlowContextMenuBasicAction >> shouldShowContextActionOn: anItem viewSelection: aViewSelection [ 
	^ self showCondition 
		ifNil: [ true ] 
		ifNotNil: [ :aShowConditon |
			aShowConditon cull: anItem cull: aViewSelection ]
]

{ #category : #accessing }
GtRemotePhlowContextMenuBasicAction >> showCondition [
	^ showCondition
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuBasicAction >> showIf: aBlock [ 
	showCondition := aBlock
]
