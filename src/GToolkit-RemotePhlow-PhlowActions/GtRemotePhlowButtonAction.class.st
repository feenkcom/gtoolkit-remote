Class {
	#name : #GtRemotePhlowButtonAction,
	#superclass : #GtRemotePhlowAction,
	#instVars : [
		'actionBlock',
		'label'
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
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionBlock)
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
