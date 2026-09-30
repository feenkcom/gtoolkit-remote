"
Examples testing canBeGtDeclarativeAction for remote GtRemotePhlowButtonAction.
"
Class {
	#name : #GtRemotePhlowButtonActionCanBeDeclarativeExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API - Actions'
}

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionDefault [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithIconStencil [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect);
		label: 'Inspect'.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithLabelOnly [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button
		label: 'Inspect';
		priority: 10.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithNilIcon [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button
		label: 'Inspect'.
	self assert: action iconStencil isNil.
	self assert: action canBeGtDeclarativeAction.
	^ action
]

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithNonIconStencilIcon [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button
		icon: Object new;
		label: 'Inspect'.
	self assert: action canBeGtDeclarativeAction not.
	^ action
]

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithNonRemoteId [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button
		label: 'Inspect';
		id: #testId asBlocElementId.
	self assert: action canBeGtDeclarativeAction not.
	^ action
]

{ #category : #examples }
GtRemotePhlowButtonActionCanBeDeclarativeExamples >> buttonActionWithRemoteId [
	<gtExample>
	| action |
	action := GtRemotePhlowAction noAction button
		label: 'Inspect';
		id: (GtRemotePhlowNamedId named: #testId).
	self assert: action canBeGtDeclarativeAction.
	^ action
]
