Class {
	#name : #GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil,
	#superclass : #BrStencil,
	#instVars : [
		'personObject'
	],
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #'api - instantiation' }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil >> create [
	^GtRemotePhlowExplicitViewWithEditableUIPersonElement new
		personObject: personObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil >> personObject [
	^personObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil >> personObject: anObject [
	personObject := anObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil >> stencilData [
	^ self personObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil >> stencilData: anObject [
	self personObject: anObject
]
