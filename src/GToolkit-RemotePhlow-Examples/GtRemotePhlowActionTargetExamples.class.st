Class {
	#name : #GtRemotePhlowActionTargetExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> compositeTarget [
	<gtExample>
	| target objectTarget exampleTarget |
	objectTarget := self objectActionTarget.
	exampleTarget := self exampleItemActionTarget.
	target := objectTarget , exampleTarget.
	self assert: target class equals: GtRemotePhlowCompositeActionTarget.
	self assert: target targets size equals: 2.
	^ target
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> compositeTargetIsForTarget [
	<gtExample>
	| target |
	target := self compositeTarget.
	self assert: (target isForTarget: GtRemotePhlowObjectActionTarget new).
	self assert: (target isForTarget: GtRemotePhlowExampleItemActionTarget new).
	self assert: (target isForTarget: (GtRemotePhlowViewActionTarget forSelector: #foo)) not.
	^ target
]

{ #category : #'examples - serialization' }
GtRemotePhlowActionTargetExamples >> compositeTargetSerialization [
	<gtExample>
	| target dict restored |
	target := self compositeTarget.
	dict := target asDictionaryForExport.
	self assert: (dict at: '__typeName') equals: 'GtRemotePhlowCompositeActionTarget'.
	self assert: (dict at: 'targets') size equals: 2.
	restored := GtPhlowDeclarativeSpecification fromDictionary: dict.
	self assert: restored equals: target.
	^ dict
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> contextMenuActionsForGroup [
	<gtExample>
	| group target actions |
	group := self testItemGroup.
	target := GtRemotePhlowExampleItemActionTarget new.
	actions := target phlowActionsForObject: group.
	self assert: actions size equals: 2.
	self assert: (actions allSatisfy: [ :each | each target isForTarget: target ]).
	^ actions
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> contextMenuActionsForItem [
	<gtExample>
	| item target actions |
	item := self testItem.
	target := GtRemotePhlowExampleItemActionTarget new.
	actions := target phlowActionsForObject: item.
	self assert: actions size equals: 4.
	self assert: (actions allSatisfy: [ :each | each target isForTarget: target ]).
	^ actions
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> exampleItemActionTarget [
	<gtExample>
	| target |
	target := GtRemotePhlowExampleItemActionTarget new.
	self assert: target asPhlowTarget == target.
	self assert: target class typeLabel equals: 'exampleItemAction'.
	^ target
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> forwardActionTarget [
	<gtExample>
	| target |
	target := GtRemotePhlowForwardActionTarget forClassName: 'GtRemotePhlowActionTargetTestItem'.
	self assert: target targetClassName equals: 'GtRemotePhlowActionTargetTestItem'.
	self assert: target class typeLabel equals: 'forwardAction'.
	^ target
]

{ #category : #'examples - equality' }
GtRemotePhlowActionTargetExamples >> forwardActionTargetEquality [
	<gtExample>
	| target1 target2 target3 |
	target1 := GtRemotePhlowForwardActionTarget forClassName: 'ClassA'.
	target2 := GtRemotePhlowForwardActionTarget forClassName: 'ClassA'.
	target3 := GtRemotePhlowForwardActionTarget forClassName: 'ClassB'.
	self assert: target1 equals: target2.
	self assert: target1 hash equals: target2 hash.
	self assert: (target1 = target3) not.
	^ target1
]

{ #category : #'examples - serialization' }
GtRemotePhlowActionTargetExamples >> forwardActionTargetSerialization [
	<gtExample>
	| target dict restored |
	target := self forwardActionTarget.
	dict := target asDictionaryForExport.
	self assert: (dict at: '__typeName') equals: 'GtRemotePhlowForwardActionTarget'.
	self assert: (dict at: 'targetClassName') equals: 'GtRemotePhlowActionTargetTestItem'.
	restored := GtPhlowDeclarativeSpecification fromDictionary: dict.
	self assert: restored equals: target.
	^ dict
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> objectActionTarget [
	<gtExample>
	| target |
	target := GtRemotePhlowObjectActionTarget new.
	self assert: target asPhlowTarget == target.
	self assert: target class typeLabel equals: 'objectAction'.
	^ target
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> objectActionTargetEquality [
	<gtExample>
	| target1 target2 |
	target1 := GtRemotePhlowObjectActionTarget new.
	target2 := GtRemotePhlowObjectActionTarget new.
	self assert: target1 equals: target2.
	self assert: target1 hash equals: target2 hash.
	self assert: (target1 = GtRemotePhlowExampleItemActionTarget new) not.
	^ target1
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> objectActionTargetIsForTarget [
	<gtExample>
	| target |
	target := self objectActionTarget.
	self assert: (target isForTarget: GtRemotePhlowObjectActionTarget new).
	self assert: (target isForTarget: GtRemotePhlowExampleItemActionTarget new) not.
	^ target
]

{ #category : #'examples - serialization' }
GtRemotePhlowActionTargetExamples >> objectActionTargetSerialization [
	<gtExample>
	| target dict restored |
	target := self objectActionTarget.
	dict := target asDictionaryForExport.
	self assert: (dict at: '__typeName') equals: 'GtRemotePhlowObjectActionTarget'.
	restored := GtPhlowDeclarativeSpecification fromDictionary: dict.
	self assert: restored equals: target.
	^ dict
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> objectActionsForItem [
	<gtExample>
	| item target actions |
	item := self testItem.
	target := GtRemotePhlowObjectActionTarget new.
	actions := target phlowActionsForObject: item.
	self assert: actions size equals: 1.
	self assert: actions first target equals: target.
	^ actions
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> objectContextMenuTarget [
	<gtExample>
	| target |
	target := GtRemotePhlowObjectContextMenuTarget new.
	self assert: target asPhlowTarget == target.
	self assert: target class typeLabel equals: 'objectContextMenu'.
	^ target
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> targetedActionsWithGroupFactory [
	<gtExample>
	| targeted singleItem items singleActions groupActions |
	targeted := GtRemotePhlowContextMenuTargetedObjectActions
		forTarget: GtRemotePhlowExampleItemActionTarget
		groupWith: [ :aCollection | GtRemotePhlowActionTargetTestItemGroup withAll: aCollection ].
	singleItem := GtRemotePhlowActionTargetTestItem label: 'Test' value: 42.
	singleActions := OrderedCollection new.
	targeted collectInvidualActionsOn: singleActions forElement: nil item: { singleItem } index: { 1 }.
	self assert: singleActions size equals: 2.
	items := {
		GtRemotePhlowActionTargetTestItem label: 'A' value: 1.
		GtRemotePhlowActionTargetTestItem label: 'B' value: 2 }.
	groupActions := OrderedCollection new.
	targeted collectInvidualActionsOn: groupActions forElement: nil item: items index: { 1. 2 }.
	self assert: groupActions size equals: 2.
	^ targeted
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> testContainer [
	<gtExample>
	| container |
	container := GtRemotePhlowActionTargetTestContainer new.
	self assert: container items size equals: 5.
	^ container
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> testDynamicContainer [
	<gtExample>
	| container |
	container := GtRemotePhlowActionTargetDynamicTestContainer new.
	self assert: container items size equals: 5.
	^ container
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> testItem [
	<gtExample>
	| item |
	item := GtRemotePhlowActionTargetTestItem label: 'Test' value: 42.
	self assert: item label equals: 'Test'.
	self assert: item value equals: 42.
	^ item
]

{ #category : #'examples - actions' }
GtRemotePhlowActionTargetExamples >> testItemGroup [
	<gtExample>
	| group |
	group := GtRemotePhlowActionTargetTestItemGroup withAll: {
		GtRemotePhlowActionTargetTestItem label: 'A' value: 1.
		GtRemotePhlowActionTargetTestItem label: 'B' value: 2 }.
	self assert: group items size equals: 2.
	^ group
]

{ #category : #'examples - targets' }
GtRemotePhlowActionTargetExamples >> viewActionTarget [
	<gtExample>
	| target |
	target := GtRemotePhlowViewActionTarget forSelector: #gtListFor:.
	self assert: target definingMethodSelector equals: #gtListFor:.
	self assert: target class typeLabel equals: 'viewAction'.
	^ target
]

{ #category : #'examples - equality' }
GtRemotePhlowActionTargetExamples >> viewActionTargetEquality [
	<gtExample>
	| target1 target2 target3 |
	target1 := GtRemotePhlowViewActionTarget forSelector: #gtListFor:.
	target2 := GtRemotePhlowViewActionTarget forSelector: #gtListFor:.
	target3 := GtRemotePhlowViewActionTarget forSelector: #gtTreeFor:.
	self assert: target1 equals: target2.
	self assert: target1 hash equals: target2 hash.
	self assert: (target1 = target3) not.
	^ target1
]

{ #category : #'examples - serialization' }
GtRemotePhlowActionTargetExamples >> viewActionTargetSerialization [
	<gtExample>
	| target dict restored |
	target := self viewActionTarget.
	dict := target asDictionaryForExport.
	self assert: (dict at: '__typeName') equals: 'GtRemotePhlowViewActionTarget'.
	self assert: (dict at: 'definingMethodSelector') equals: #gtListFor:.
	restored := GtPhlowDeclarativeSpecification fromDictionary: dict.
	self assert: restored equals: target.
	^ dict
]
