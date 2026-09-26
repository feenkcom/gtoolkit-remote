Class {
	#name : #GtRemotePhlowExampleItemActionTarget,
	#superclass : #GtRemotePhlowActionTarget,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #testing }
GtRemotePhlowExampleItemActionTarget class >> isAbstract [
	^ self name = #GtRemotePhlowExampleItemActionTarget
]

{ #category : #accessing }
GtRemotePhlowExampleItemActionTarget class >> typeLabel [
	^ 'exampleItemAction'
]
