"
Shared construction examples for button Phlow actions. Subclasses provide the proto action (local or remote) via createProtoAction.
"
Class {
	#name : #GtRemotePhlowButtonActionAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API - Actions'
}

{ #category : #testing }
GtRemotePhlowButtonActionAbstractExamples class >> isAbstract [
	^ self name = #GtRemotePhlowButtonActionAbstractExamples
]

{ #category : #'examples - action reconstruction' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionFromSpecificationWithIcon [
	<gtExample>
	| specification recreatedAction |
	specification := self buttonActionWithIcon.
	recreatedAction := specification actionFor: GtPhlowAction new.

	self assert: recreatedAction label equals: nil.
	self
		assert: recreatedAction iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: recreatedAction priority equals: 12.
	self assert: recreatedAction tooltipText equals: 'Inspect objects'.

	^ recreatedAction
]

{ #category : #'examples - action reconstruction' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionFromSpecificationWithIconAndLabel [
	<gtExample>
	| specification recreatedAction |
	specification := self buttonActionWithIconAndLabel.
	recreatedAction := specification actionFor: GtPhlowAction new.

	self assert: recreatedAction label equals: 'Inspect'.
	self
		assert: recreatedAction iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: recreatedAction priority equals: 12.
	self assert: recreatedAction tooltipText equals: 'Inspect objects'.

	^ recreatedAction
]

{ #category : #'examples - action reconstruction' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionFromSpecificationWithLabelAndNoTooltip [
	<gtExample>
	| specification recreatedAction |
	specification := self buttonActionWithLabelAndNoTooltip.
	recreatedAction := specification actionFor: GtPhlowAction new.

	self assert: recreatedAction label equals: 'Inspect'.
	self assert: recreatedAction iconStencil equals: nil.
	self assert: recreatedAction priority equals: 12.

	^ recreatedAction
]

{ #category : #'examples - action reconstruction' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionFromSpecificationWithMenuItemGroup [
	<gtExample>
	| specification recreatedAction reExportedSpecification |
	specification := self buttonActionWithMenuItemGroup.
	recreatedAction := specification actionFor: GtPhlowAction new.

	self assert: recreatedAction label equals: 'Inspect'.
	self assert: recreatedAction priority equals: 12.

	reExportedSpecification := recreatedAction asGtDeclarativeAction.
	self
		assert: reExportedSpecification asDictionaryForExport
		equals: self expectedButtonActionWithMenuItemGroupSpecification.

	^ recreatedAction
]

{ #category : #'examples - action reconstruction' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionFromSpecificationWithMultipleMenuOptions [
	<gtExample>
	| specification recreatedAction reExportedSpecification |
	specification := self buttonActionWithMultipleMenuOptions.
	recreatedAction := specification actionFor: GtPhlowAction new.

	self assert: recreatedAction label equals: 'Inspect'.
	self assert: recreatedAction priority equals: 12.

	reExportedSpecification := recreatedAction asGtDeclarativeAction.
	self
		assert: reExportedSpecification asDictionaryForExport
		equals: self expectedButtonActionWithMultipleMenuOptionsSpecification.

	^ recreatedAction
]

{ #category : #'examples - specification' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithIcon [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
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

{ #category : #'examples - specification' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithIconAndLabel [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
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

{ #category : #'examples - specification' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithIconAndLabelAndAction [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification actionBlock |
	actionBlock := [ :anElement | anElement phlow spawnObject: 42 ].
	phlowAction := self createProtoAction button
		tooltip: 'Inspect objects';
		priority: 12;
		label: 'Inspect';
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect);
		action: actionBlock.

	self assert: phlowAction actionBlock equals: actionBlock.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification tooltipText equals: 'Inspect objects'.
	self assert: declarativeSpecification label equals: 'Inspect'.
	self
		assert: declarativeSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: declarativeSpecification priority equals: 12.
	self assert: declarativeSpecification phlowDataSource notNil.
	self
		assert: (declarativeSpecification phlowDataSource
			isKindOf: GtRemotePhlowDeclarativeBlockActionDataSource).

	self
		assert: declarativeSpecification asDictionaryForExport
		equals: self expectedButtonActionWithIconAndLabelSpecification.

	^ declarativeSpecification
]

{ #category : #'examples - specification' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithLabelAndNoTooltip [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
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

{ #category : #'examples - menu options' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithMenuHideOnClick [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
		label: 'Inspect';
		priority: 12;
		menuItemHideOnClick: false.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification label equals: 'Inspect'.
	self assert: declarativeSpecification menuOptions notNil.
	self assert: declarativeSpecification menuOptions menuHideOnClick equals: false.

	^ declarativeSpecification
]

{ #category : #'examples - menu options' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithMenuItemGroup [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
		tooltip: 'Inspect objects';
		priority: 12;
		label: 'Inspect';
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect);
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection.

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

{ #category : #'examples - menu options' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithMenuPinSubmenu [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
		label: 'Inspect';
		priority: 12;
		menuItemPinSubmenu.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification label equals: 'Inspect'.
	self assert: declarativeSpecification menuOptions notNil.
	self assert: declarativeSpecification menuOptions menuPinSubmenu equals: true.

	^ declarativeSpecification
]

{ #category : #'examples - menu options' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithMenuShortcut [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
		label: 'Inspect';
		priority: 12;
		menuShortcut: 'Cmd+I'.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification label equals: 'Inspect'.
	self assert: declarativeSpecification menuOptions notNil.
	self assert: declarativeSpecification menuOptions menuShortcut equals: 'Cmd+I'.

	^ declarativeSpecification
]

{ #category : #'examples - menu options' }
GtRemotePhlowButtonActionAbstractExamples >> buttonActionWithMultipleMenuOptions [
	<gtExample>
	<return: #GtPhlowButtonActionSpecification>
	| phlowAction declarativeSpecification |
	phlowAction := self createProtoAction button
		tooltip: 'Inspect objects';
		priority: 12;
		label: 'Inspect';
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #playinspect);
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		menuShortcut: 'Cmd+I';
		menuItemHideOnClick: false.

	declarativeSpecification := phlowAction asGtDeclarativeAction.

	self assert: declarativeSpecification label equals: 'Inspect'.
	self assert: declarativeSpecification priority equals: 12.
	self assert: declarativeSpecification menuOptions notNil.
	self assert: declarativeSpecification menuOptions menuGroup name equals: #Inspection.
	self assert: declarativeSpecification menuOptions menuShortcut equals: 'Cmd+I'.
	self assert: declarativeSpecification menuOptions menuHideOnClick equals: false.

	self
		assert: declarativeSpecification asDictionaryForExport
		equals: self expectedButtonActionWithMultipleMenuOptionsSpecification.

	^ declarativeSpecification
]

{ #category : #accessing }
GtRemotePhlowButtonActionAbstractExamples >> createProtoAction [
	self subclassResponsibility
]

{ #category : #'private - expected' }
GtRemotePhlowButtonActionAbstractExamples >> expectedButtonActionWithIconAndLabelSpecification [
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
		add: 'target'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowObjectActionTarget;
						add: '__typeLabel' -> 'objectAction';
						yourself);
		yourself
]

{ #category : #'private - expected' }
GtRemotePhlowButtonActionAbstractExamples >> expectedButtonActionWithIconSpecification [
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
		add: 'target'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowObjectActionTarget;
						add: '__typeLabel' -> 'objectAction';
						yourself);
		yourself
]

{ #category : #'private - expected' }
GtRemotePhlowButtonActionAbstractExamples >> expectedButtonActionWithLabelAndNoTooltipSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtPhlowButtonActionSpecification;
		add: '__typeLabel' -> 'phlowButtonActionSpecification';
		add: 'priority' -> 12;
		add: 'methodSelector' -> nil;
		add: 'label' -> 'Inspect';
		add: 'target'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowObjectActionTarget;
						add: '__typeLabel' -> 'objectAction';
						yourself);
		yourself
]

{ #category : #'private - expected' }
GtRemotePhlowButtonActionAbstractExamples >> expectedButtonActionWithMenuItemGroupSpecification [
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
		add: 'target'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowObjectActionTarget;
						add: '__typeLabel' -> 'objectAction';
						yourself);
		add: 'menuOptions'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowMenuOptionsSpecification;
						add: '__typeLabel' -> 'remotePhlowMenuOptions';
						add: 'menuGroup'
								-> (Dictionary new
										add: '__typeName' -> #GtRemotePhlowMenuItemGroupConfiguration;
										add: '__typeLabel' -> 'remotePhlowMenuItemGroupConfiguration';
										add: 'name' -> #Inspection;
										add: 'priority' -> 40;
										yourself);
						yourself);
		yourself
]

{ #category : #'private - expected' }
GtRemotePhlowButtonActionAbstractExamples >> expectedButtonActionWithMultipleMenuOptionsSpecification [
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
		add: 'target'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowObjectActionTarget;
						add: '__typeLabel' -> 'objectAction';
						yourself);
		add: 'menuOptions'
				-> (Dictionary new
						add: '__typeName' -> #GtRemotePhlowMenuOptionsSpecification;
						add: '__typeLabel' -> 'remotePhlowMenuOptions';
						add: 'menuGroup'
								-> (Dictionary new
										add: '__typeName' -> #GtRemotePhlowMenuItemGroupConfiguration;
										add: '__typeLabel' -> 'remotePhlowMenuItemGroupConfiguration';
										add: 'name' -> #Inspection;
										add: 'priority' -> 40;
										yourself);
						add: 'menuShortcut' -> 'Cmd+I';
						add: 'menuHideOnClick' -> false;
						yourself);
		yourself
]
