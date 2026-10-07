"
Shared construction examples for context menu Phlow actions. Subclasses provide the proto action (local or remote) via createProtoAction.
"
Class {
	#name : #GtRemotePhlowContextMenuActionAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API - Actions'
}

{ #category : #testing }
GtRemotePhlowContextMenuActionAbstractExamples class >> isAbstract [
	^ self name = #GtRemotePhlowContextMenuActionAbstractExamples
]

{ #category : #'examples - actionFor' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionFromSpecificationWithIconAndLabel [
	<gtExample>
	<return: #GtPhlowButtonAction>
	| specification recreatedAction |
	specification := self contextMenuActionWithIconAndLabel.
	recreatedAction := specification actionFor: GtPhlowAction new.
	self assert: recreatedAction label equals: 'Inspect item'.
	self assert: recreatedAction iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #inspect).
	self assert: recreatedAction priority equals: 50.
	^ recreatedAction
]

{ #category : #'examples - actionFor' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionFromSpecificationWithIconLabelAndTooltip [
	<gtExample>
	<return: #GtPhlowButtonAction>
	| specification recreatedAction |
	specification := self contextMenuActionWithIconLabelAndTooltip.
	recreatedAction := specification actionFor: GtPhlowAction new.
	self assert: recreatedAction label equals: 'Inspect item'.
	self assert: recreatedAction iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #inspect).
	self assert: recreatedAction tooltipText equals: 'Inspect the selected item'.
	self assert: recreatedAction priority equals: 50.
	^ recreatedAction
]

{ #category : #'examples - actionFor' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionFromSpecificationWithLabel [
	<gtExample>
	<return: #GtPhlowButtonAction>
	| specification recreatedAction |
	specification := self contextMenuActionWithLabel.
	recreatedAction := specification actionFor: GtPhlowAction new.
	self assert: recreatedAction label equals: 'Print value'.
	self assert: recreatedAction iconStencil equals: nil.
	self assert: recreatedAction priority equals: 50.
	^ recreatedAction
]

{ #category : #'examples - specification' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionWithIconAndLabel [
	<gtExample>
	<return: #GtRemotePhlowContextMenuItemBoundActionSpecification>
	| contextMenuAction boundAction declarativeSpecification |
	contextMenuAction := self createProtoAction contextMenuAction
		label: 'Inspect item';
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #inspect);
		action: [ :anElement :anObject | 
			anElement phlow spawnObject: anObject ].
	boundAction := contextMenuAction 
		asItemBoundActionToItem: 42 
		viewSelection: {1}.
	declarativeSpecification := boundAction asGtDeclarativeAction.
	self assert: declarativeSpecification label equals: 'Inspect item'.
	self assert: declarativeSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #inspect).
	self assert: declarativeSpecification tooltipText equals: nil.
	self assert: declarativeSpecification asDictionaryForExport
		equals: self expectedContextMenuActionWithIconAndLabelSpecification.
	^ declarativeSpecification
]

{ #category : #'examples - specification' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionWithIconLabelAndTooltip [
	<gtExample>
	<return: #GtRemotePhlowContextMenuItemBoundActionSpecification>
	| contextMenuAction boundAction declarativeSpecification |
	contextMenuAction := self createProtoAction contextMenuAction
		label: 'Inspect item';
		icon: (GtPhlowGlamorousVectorIconNameStencil new iconName: #inspect);
		tooltip: 'Inspect the selected item';
		action: [ :anElement :anObject | 
			anElement phlow spawnObject: anObject ].
	boundAction := contextMenuAction 
		asItemBoundActionToItem: 42 
		viewSelection: {1}.
	declarativeSpecification := boundAction asGtDeclarativeAction.
	self assert: declarativeSpecification label equals: 'Inspect item'.
	self assert: declarativeSpecification iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #inspect).
	self assert: declarativeSpecification tooltipText equals: 'Inspect the selected item'.
	self assert: declarativeSpecification asDictionaryForExport
		equals: self expectedContextMenuActionWithIconLabelAndTooltipSpecification.
	^ declarativeSpecification
]

{ #category : #'examples - specification' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionWithLabel [
	<gtExample>
	<return: #GtRemotePhlowContextMenuItemBoundActionSpecification>
	| contextMenuAction boundAction declarativeSpecification |
	contextMenuAction := self createProtoAction contextMenuAction
		label: 'Print value';
		action: [ :anElement :anObject | 
			anElement phlow spawnObject: anObject printString ].
	boundAction := contextMenuAction 
		asItemBoundActionToItem: 42 
		viewSelection: {1}.
	declarativeSpecification := boundAction asGtDeclarativeAction.
	self assert: declarativeSpecification label equals: 'Print value'.
	self assert: declarativeSpecification iconStencil equals: nil.
	self assert: declarativeSpecification tooltipText equals: nil.
	self assert: declarativeSpecification asDictionaryForExport
		equals: self expectedContextMenuActionWithLabelSpecification.
	^ declarativeSpecification
]

{ #category : #'examples - show condition' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionWithShowCondition [
	<gtExample>
	| action |
	action := self createProtoAction contextMenuAction
		label: 'Show if greater than 10';
		action: [ :anElement :anObject | anElement phlow spawnObject: anObject ];
		showIf: [ :anObject :aSelection | anObject > 10 ].
	self assert: (action shouldShowContextActionOn: 42 viewSelection: {1}).
	self assert: (action shouldShowContextActionOn: 5 viewSelection: {1}) not.
	^ action
]

{ #category : #'examples - show condition' }
GtRemotePhlowContextMenuActionAbstractExamples >> contextMenuActionWithoutShowCondition [
	<gtExample>
	| action |
	action := self createProtoAction contextMenuAction
		label: 'Always visible';
		action: [ :anElement | anElement phlow spawnObject: anElement ].
	self assert: (action shouldShowContextActionOn: 42 viewSelection: {1}).
	self assert: (action shouldShowContextActionOn: 5 viewSelection: {1}).
	^ action
]

{ #category : #accessing }
GtRemotePhlowContextMenuActionAbstractExamples >> createProtoAction [
	self subclassResponsibility
]

{ #category : #'examples - expected' }
GtRemotePhlowContextMenuActionAbstractExamples >> expectedContextMenuActionWithIconAndLabelSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtRemotePhlowContextMenuItemBoundActionSpecification;
		add: '__typeLabel' -> 'phlowContextMenuActionSpecification';
		add: 'priority' -> nil;
		add: 'methodSelector' -> nil;
		add: 'label' -> 'Inspect item';
		add: 'iconStencil' -> (Dictionary new
			add: 'iconName' -> #inspect;
			add: '__typeName' -> #GtPhlowGlamorousVectorIconNameStencil;
			add: '__typeLabel' -> 'phlowGlamorousVectorIconNameStencil';
			yourself);
		yourself
]

{ #category : #'examples - expected' }
GtRemotePhlowContextMenuActionAbstractExamples >> expectedContextMenuActionWithIconLabelAndTooltipSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtRemotePhlowContextMenuItemBoundActionSpecification;
		add: '__typeLabel' -> 'phlowContextMenuActionSpecification';
		add: 'priority' -> nil;
		add: 'methodSelector' -> nil;
		add: 'label' -> 'Inspect item';
		add: 'tooltipText' -> 'Inspect the selected item';
		add: 'iconStencil' -> (Dictionary new
			add: 'iconName' -> #inspect;
			add: '__typeName' -> #GtPhlowGlamorousVectorIconNameStencil;
			add: '__typeLabel' -> 'phlowGlamorousVectorIconNameStencil';
			yourself);
		yourself
]

{ #category : #'examples - expected' }
GtRemotePhlowContextMenuActionAbstractExamples >> expectedContextMenuActionWithLabelSpecification [
	^ Dictionary new
		add: '__typeName' -> #GtRemotePhlowContextMenuItemBoundActionSpecification;
		add: '__typeLabel' -> 'phlowContextMenuActionSpecification';
		add: 'priority' -> nil;
		add: 'methodSelector' -> nil;
		add: 'label' -> 'Print value';
		yourself
]
