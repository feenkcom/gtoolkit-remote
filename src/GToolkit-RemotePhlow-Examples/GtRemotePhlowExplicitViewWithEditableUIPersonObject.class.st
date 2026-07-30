Class {
	#name : #GtRemotePhlowExplicitViewWithEditableUIPersonObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'age',
		'address'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> address [
	^address
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> address: aString [
	address := aString
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> age [
	^age
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> age: anInteger [
	age := anInteger
]

{ #category : #'gt-extension' }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> gtEditableFor: aView [
	<gtView>
	^(aView explicit)
		title: 'Edit';
		priority: 1;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtRemotePhlowExplicitViewWithEditableUIPersonStencil;
				stencilData: self;
				dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy 
					forDirectProxy ]
]

{ #category : #'gt-extension' }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> gtEditableWithNotificationFor: aView [
	<gtView>
	^(aView explicit)
		title: 'Edit with notification';
		priority: 2;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtRemotePhlowExplicitViewWithEditableUIPersonWithNotificationStencil;
				stencilData: self;
				dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy 
					forDirectProxy]
]

{ #category : #initialization }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> initialize [
	super initialize.
	name := 'John Doe'.
	age := 30.
	address := '123 Main Street'
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> name [
	^name
]

{ #category : #accessing }
GtRemotePhlowExplicitViewWithEditableUIPersonObject >> name: aString [
	name := aString
]
