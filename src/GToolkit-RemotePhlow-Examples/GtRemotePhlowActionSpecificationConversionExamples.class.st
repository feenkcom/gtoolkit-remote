Class {
	#name : #GtRemotePhlowActionSpecificationConversionExamples,
	#superclass : #GtRemotePhlowSpecificationConversionExamples,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #examples }
GtRemotePhlowActionSpecificationConversionExamples >> convertButtonActionWithIcon [
	"Demonstrate converting a button action to a declarative specification"

	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoActions button
			tooltip: 'Inspect objects';
			priority: 12;
			icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect).

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification tooltipText equals: 'Inspect objects'.
	self assert: declarativeSpecification label equals: nil.
	self
		assert: declarativeSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: declarativeSpecification priority equals: 12.

	self
		assert: declarativeSpecification asDictionaryForExport
		equals: self expectedButtonActionWithIconSpecification.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowActionSpecificationConversionExamples >> convertButtonActionWithIconAndLabel [
	"Demonstrate converting a button action to a declarative specification"

	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoActions button
			tooltip: 'Inspect objects';
			priority: 12;
			label: 'Inspect';
			icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect).

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification tooltipText equals: 'Inspect objects'.
	self assert: declarativeSpecification label equals: 'Inspect'.
	self
		assert: declarativeSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: declarativeSpecification priority equals: 12.

	self
		assert: declarativeSpecification asDictionaryForExport
		equals: self expectedButtonActionWithIconAndLabelSpecification.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowActionSpecificationConversionExamples >> convertButtonActionWithLabelAndNoTooltip [
	"Demonstrate converting a button action to a declarative specification"

	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoActions button
			label: 'Inspect';
			priority: 12.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification tooltipText equals: nil.
	self assert: declarativeSpecification label equals: 'Inspect'.
	self assert: declarativeSpecification iconStencil equals: nil.
	self assert: declarativeSpecification priority equals: 12.

	self
		assert: declarativeSpecification asDictionaryForExport
		equals: self expectedButtonActionWithLabelAndNoTooltipSpecification.

	^ declarativeSpecification
]

{ #category : #accessing }
GtRemotePhlowActionSpecificationConversionExamples >> createProtoActions [
	^ GtRemotePhlowAction new
]

{ #category : #data }
GtRemotePhlowActionSpecificationConversionExamples >> expectedButtonActionWithIconAndLabelSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtPhlowButtonActionSpecification;
		add: '__typeLabel' -> 'phlowButtonActionSpecification';
		add: 'iconStencil'
				-> (Dictionary new
						add: '__typeName' -> #GtPhlowGlamorousVectorIconNameStencil;
						add: '__typeLabel' -> 'phlowGlamorousVectorIconNameStencil';
						add: 'iconName' -> #playinspect;
						yourself);
		add: 'priority' -> 12;
		add: 'tooltipText' -> 'Inspect objects';
		add: 'methodSelector' -> nil;
		add: 'label' -> 'Inspect';
		yourself
]

{ #category : #data }
GtRemotePhlowActionSpecificationConversionExamples >> expectedButtonActionWithIconSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtPhlowButtonActionSpecification;
		add: '__typeLabel' -> 'phlowButtonActionSpecification';
		add: 'iconStencil'
				-> (Dictionary new
						add: 'iconName' -> #playinspect;
						add: '__typeName' -> #GtPhlowGlamorousVectorIconNameStencil;
						add: '__typeLabel' -> 'phlowGlamorousVectorIconNameStencil';
						yourself);
		add: 'priority' -> 12;
		add: 'tooltipText' -> 'Inspect objects';
		add: 'methodSelector' -> nil;
		yourself
]

{ #category : #data }
GtRemotePhlowActionSpecificationConversionExamples >> expectedButtonActionWithLabelAndNoTooltipSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtPhlowButtonActionSpecification;
		add: '__typeLabel' -> 'phlowButtonActionSpecification';
		add: 'priority' -> 12;
		add: 'methodSelector' -> nil;
		add: 'label' -> 'Inspect';
		yourself
]
