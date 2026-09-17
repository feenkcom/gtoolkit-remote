Class {
	#name : #GtRemotePhlowContextMenuCompositeAction,
	#superclass : #GtRemotePhlowContextMenuBasicAction,
	#instVars : [
		'showCondition'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #testing }
GtRemotePhlowContextMenuCompositeAction class >> isAbstract [
	^ self name = #GtRemotePhlowContextMenuCompositeAction
]

{ #category : #'api - scripting' }
GtRemotePhlowContextMenuCompositeAction >> showIf: aBlock [ 
	showCondition := aBlock
]
