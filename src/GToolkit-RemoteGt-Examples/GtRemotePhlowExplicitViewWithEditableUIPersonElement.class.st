Class {
	#name : #GtRemotePhlowExplicitViewWithEditableUIPersonElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'personObject',
		'notificationLabel'
	],
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #'private - editing' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> addAddressEditor [
	self addChild: (self newLabelWithText: 'Address:').
	self
		addChild: ((self newEditorWithText: personObject address
				onAccept: [:aText | self updateAddress: aText])
					id: GtRemotePhlowExplicitViewExampleAddressEditorId)
]

{ #category : #'private - editing' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> addAgeEditor [
	self addChild: (self newLabelWithText: 'Age:').
	self
		addChild: ((self newEditorWithText: personObject age asString
				onAccept: [:aText | self updateAge: aText])
					id: GtRemotePhlowExplicitViewExampleAgeEditorId)
]

{ #category : #'private - editing' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> addNameEditor [
	self addChild: (self newLabelWithText: 'Name:').
	self
		addChild: ((self newEditorWithText: personObject name
				onAccept: [:aText | self updateName: aText])
					id: GtRemotePhlowExplicitViewExampleNameEditorId)
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> addNotificationLabel [
	notificationLabel := (BrLabel new)
				aptitude: ((BrGlamorousLabelAptitude new)
							italic;
							foreground: Color gray);
				text: '';
				visibility: BlVisibility gone;
				hMatchParent;
				margin: (BlInsets top: 10).
	self addChild: notificationLabel
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> addRefreshButton [
	self addChild: ((BrButton new)
				aptitude: BrGlamorousButtonWithLabelAptitude;
				label: 'Refresh';
				margin: (BlInsets top: 10);
				action: [:aButton | self refreshFromModel])
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> buildUI [
	self removeChildren.
	self addNameEditor.
	self addAgeEditor.
	self addAddressEditor.
	self addRefreshButton.
	self addNotificationLabel
]

{ #category : #initialization }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> initialize [
	super initialize.
	self
		hMatchParent;
		vFitContent;
		padding: (BlInsets all: 20)
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> newEditorWithText: aString onAccept: aBlock [
	^(BrEditableLabel new)
		aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
		text: aString;
		hMatchParent;
		when: BrEditorAcceptWish do: [:aWish | aBlock value: aWish text asString]
]

{ #category : #'private - building' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> newLabelWithText: aString [
	^(BrLabel new)
		aptitude: BrGlamorousLabelAptitude new bold;
		text: aString
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> personObject [
	^personObject
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> personObject: anObject [
	personObject := anObject.
	self buildUI
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> refreshFromModel [
	self buildUI.
	self showNotification: 'Data refreshed from model'
]

{ #category : #'private - notification' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> showNotification: aString [
	notificationLabel text: aString.
	notificationLabel visibility: BlVisibility visible
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> updateAddress: aString [
	personObject address: aString.
	self showNotification: 'Data saved'
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> updateAge: aString [
	personObject age: aString asInteger.
	self showNotification: 'Data saved'
]

{ #category : #'private - updating' }
GtRemotePhlowExplicitViewWithEditableUIPersonElement >> updateName: aString [
	personObject name: aString.
	self showNotification: 'Data saved'
]
