Class {
	#name : #GtRemotePhlowButtonActionLocalExamples,
	#superclass : #GtRemotePhlowButtonActionAbstractExamples,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API - Actions'
}

{ #category : #'examples - local menu options' }
GtRemotePhlowButtonActionLocalExamples >> buttonActionFromSpecificationWithLocalMenuItemGroup [
	<gtExample>
	| specification recreatedAction reExportedSpecification |
	specification := self buttonActionWithLocalMenuItemGroup.
	recreatedAction := specification actionFor: self createProtoAction.

	self assert: recreatedAction label equals: 'Inspect'.
	self assert: recreatedAction priority equals: 12.

	reExportedSpecification := recreatedAction asGtDeclarativeAction.
	self
		assert: reExportedSpecification asDictionaryForExport
		equals: self expectedButtonActionWithMenuItemGroupSpecification.

	^ recreatedAction
]

{ #category : #'examples - local menu options' }
GtRemotePhlowButtonActionLocalExamples >> buttonActionWithLocalMenuItemGroup [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
		tooltip: 'Inspect objects';
		priority: 12;
		label: 'Inspect';
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect);
		menuItemGroup: BrMenuItemGroupConfiguration inspection.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification label equals: 'Inspect'.
	self assert: declarativeSpecification priority equals: 12.
	self assert: declarativeSpecification menuOptions notNil.
	self assert: declarativeSpecification menuOptions menuGroup name equals: #Inspection.
	self assert: declarativeSpecification menuOptions menuGroup priority equals: 40.

	self
		assert: declarativeSpecification asDictionaryForExport
		equals: self expectedButtonActionWithMenuItemGroupSpecification.

	^ declarativeSpecification
]

{ #category : #accessing }
GtRemotePhlowButtonActionLocalExamples >> createProtoAction [
	^ GtPhlowAction new
]
