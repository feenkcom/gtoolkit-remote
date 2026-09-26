Class {
	#name : #GtRemotePhlowContextMenuTargetedObjectActions,
	#superclass : #GtRemotePhlowContextMenuCompositeAction,
	#instVars : [
		'target',
		'groupTarget',
		'groupFactory'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #'instance creation' }
GtRemotePhlowContextMenuTargetedObjectActions class >> forTarget: aGtRemotePhlowActionTarget [
	^ self new target: aGtRemotePhlowActionTarget
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuTargetedObjectActions class >> forTarget: aSingleTarget groupTarget: aGroupTarget groupWith: aGroupFactory [
	^ self new
		target: aSingleTarget;
		groupTarget: aGroupTarget;
		groupFactory: aGroupFactory
]

{ #category : #'instance creation' }
GtRemotePhlowContextMenuTargetedObjectActions class >> forTarget: aTarget groupWith: aGroupFactory [
	^ self new
		target: aTarget;
		groupFactory: aGroupFactory
]

{ #category : #actions }
GtRemotePhlowContextMenuTargetedObjectActions >> collectInvidualActionsOn: aCollection forElement: anElement item: anObject index: aSelectionIndex [
	| effectiveTarget effectiveObject |
	groupFactory
		ifNil: [
			effectiveTarget := target.
			effectiveObject := anObject ]
		ifNotNil: [
			anObject size = 1
				ifTrue: [
					effectiveTarget := target.
					effectiveObject := anObject first ]
				ifFalse: [
					effectiveTarget := self groupTarget.
					effectiveObject := groupFactory value: anObject ] ].
	effectiveTarget actionsForObject: effectiveObject do: [ :anAction |
		aCollection add: anAction ]
]

{ #category : #accessing }
GtRemotePhlowContextMenuTargetedObjectActions >> groupFactory [
	^ groupFactory
]

{ #category : #accessing }
GtRemotePhlowContextMenuTargetedObjectActions >> groupFactory: aBlock [
	groupFactory := aBlock
]

{ #category : #accessing }
GtRemotePhlowContextMenuTargetedObjectActions >> groupTarget [
	^ groupTarget ifNil: [ target ]
]

{ #category : #accessing }
GtRemotePhlowContextMenuTargetedObjectActions >> groupTarget: aGtRemotePhlowActionTarget [
	groupTarget := aGtRemotePhlowActionTarget default
]

{ #category : #accessing }
GtRemotePhlowContextMenuTargetedObjectActions >> target [
	^ target
]

{ #category : #accessing }
GtRemotePhlowContextMenuTargetedObjectActions >> target: aGtRemotePhlowActionTarget [
	target := aGtRemotePhlowActionTarget default
]
