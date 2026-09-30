"
Examples testing canBeGtDeclarativeAction for local GtPhlowButtonAction.
"
Class {
	#name : #GtPhlowButtonActionCanBeDeclarativeExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API - Actions'
}

{ #category : #examples }
GtPhlowButtonActionCanBeDeclarativeExamples >> buttonActionDefault [
	<gtExample>
	| action |
	action := GtPhlowAction noAction button.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtPhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithIconStencil [
	<gtExample>
	| action |
	action := GtPhlowAction noAction button
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect);
		label: 'Inspect'.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtPhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithLabelOnly [
	<gtExample>
	| action |
	action := GtPhlowAction noAction button
		label: 'Inspect';
		priority: 10.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtPhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithNonRemoteId [
	<gtExample>
	| action |
	action := GtPhlowAction noAction button
		label: 'Inspect';
		id: #testId asBlocElementId.
	self assert: action canBeGtDeclarativeAction not.
	^ action
]

{ #category : #examples }
GtPhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithRemoteId [
	<gtExample>
	| action |
	action := GtPhlowAction noAction button
		label: 'Inspect';
		id: (GtRemotePhlowNamedId named: #testId).
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtPhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithViewTarget [
	<gtExample>
	| action |
	action := GtPhlowAction noAction button
		label: 'Inspect';
		target: (GtPhlowViewActionTarget new
			definingMethodSelector: #gtViewsFor:).
	self assert: action canBeGtDeclarativeAction.
	^ action
]
