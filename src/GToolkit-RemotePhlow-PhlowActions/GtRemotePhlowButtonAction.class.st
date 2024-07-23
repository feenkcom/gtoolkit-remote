Class {
	#name : #GtRemotePhlowButtonAction,
	#superclass : #GtRemotePhlowAction,
	#instVars : [
		'actionBlock',
		'label',
		'iconStencil'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
GtRemotePhlowButtonAction >> action: aValuable [
	actionBlock := aValuable
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> actionBlock [
	^ actionBlock
]

{ #category : #converting }
GtRemotePhlowButtonAction >> asGtDeclarativeAction [
	^ GtPhlowButtonActionSpecification new
		priority: self priority;
		tooltipText: self tooltipText;
		label: self label;
		iconStencil: self iconStencil;
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionBlock)
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> icon: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> iconStencil [
	^ iconStencil
]

{ #category : #initialization }
GtRemotePhlowButtonAction >> initialize [
	super initialize.

	actionBlock := [ :aButton | 
		"do nothing" ].
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> label [
	^ label
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> label: aStringOrText [
	label := aStringOrText
]
