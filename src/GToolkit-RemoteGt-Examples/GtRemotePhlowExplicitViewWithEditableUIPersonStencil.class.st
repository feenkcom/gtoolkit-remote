Class {
	#name : #GtRemotePhlowExplicitViewWithEditableUIPersonStencil,
	#superclass : #BrStencil,
	#instVars : [
		'personObject'
	],
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> addAddressEditorTo: aContainer [
	aContainer addChild: (self newLabelWithText: 'Address:').
	aContainer
		addChild: ((self newEditorWithText: personObject address
				onAccept: [:aText | self updateAddress: aText])
					id: GtRemotePhlowExplicitViewExampleAddressEditorId)
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> addAgeEditorTo: aContainer [
	aContainer addChild: (self newLabelWithText: 'Age:').
	aContainer
		addChild: ((self newEditorWithText: personObject age asString
				onAccept: [:aText | self updateAge: aText])
					id: GtRemotePhlowExplicitViewExampleAgeEditorId)
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> addNameEditorTo: aContainer [
	aContainer addChild: (self newLabelWithText: 'Name:').
	aContainer
		addChild: ((self newEditorWithText: personObject name
				onAccept: [:aText | self updateName: aText])
					id: GtRemotePhlowExplicitViewExampleNameEditorId)
]

{ #category : #'api - instantiation' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> create [
	| container |
	container := self newContainer.
	self addNameEditorTo: container.
	self addAgeEditorTo: container.
	self addAddressEditorTo: container.
	^container
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> newContainer [
	^(BrVerticalPane new)
		hMatchParent;
		vFitContent;
		padding: (BlInsets all: 20)
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> newEditorWithText: aString onAccept: aBlock [
	^(BrEditableLabel new)
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: aString;
		hMatchParent;
		when: BrEditorAcceptWish do: [:aWish | aBlock value: aWish text asString]
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> newLabelWithText: aString [
	^(BrLabel new)
		aptitude: BrGlamorousLabelAptitude new bold;
		text: aString
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> personObject [
	^personObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> personObject: anObject [
	personObject := anObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> stencilData [
	^ self personObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> stencilData: anObject [
	self personObject: (self 
		gtDo: [ anObject asGtBareProxyObject ] 
		gemstoneDo: [anObject])
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> updateAddress: aString [
	personObject address: aString
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> updateAge: aString [
	personObject age: aString asInteger
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonStencil >> updateName: aString [
	personObject name: aString
]
