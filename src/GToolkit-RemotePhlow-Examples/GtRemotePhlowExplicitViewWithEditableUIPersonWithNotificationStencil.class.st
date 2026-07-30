Class {
	#name : #GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil,
	#superclass : #GtPhlowWithDataStencil,
	#instVars : [
		'personObject'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil class >> new [
	^ self basicNew initialize
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil >> initialize [
	super initialize.
	
	self dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy forDirectProxy
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
	self personObject: (self 
		gtDo: [ anObject asGtBareProxyObject ] 
		gemstoneDo: [anObject])
]
