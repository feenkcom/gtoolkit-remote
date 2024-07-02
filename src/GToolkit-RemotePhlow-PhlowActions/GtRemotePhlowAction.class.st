Class {
	#name : #GtRemotePhlowAction,
	#superclass : #Object,
	#instVars : [
		'id',
		'priority',
		'tooltipText'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
GtRemotePhlowAction >> asGtDeclarativeAction [
	^ nil
]

{ #category : #decorating }
GtRemotePhlowAction >> button [
	^ GtRemotePhlowButtonAction new
]

{ #category : #accessing }
GtRemotePhlowAction >> id [
	^ id
]

{ #category : #accessing }
GtRemotePhlowAction >> id: anId [
	id := anId
]

{ #category : #decorating }
GtRemotePhlowAction >> noAction [
	^ GtRemotePhlowNoAction new
]

{ #category : #accessing }
GtRemotePhlowAction >> priority [
	^ priority
]

{ #category : #accessing }
GtRemotePhlowAction >> priority: aNumber [
	priority := aNumber
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltip: aTextOrString [
	self tooltipText: aTextOrString
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltipText [
	^ tooltipText
]

{ #category : #accessing }
GtRemotePhlowAction >> tooltipText: aTextOrString [
	tooltipText := aTextOrString
]
