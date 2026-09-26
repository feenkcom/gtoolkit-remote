Class {
	#name : #GtRemotePhlowListingView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'itemsProviderComputation',
		'transformation',
		'contextMenuActions',
		'multipleSelectionEnabled'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #'api - actions' }
GtRemotePhlowListingView >> collectIndividualContextMenuActionsForElement: anElement item: anObject viewSelection: aViewSelection [
	| allInitialPhlowActions |
	
	allInitialPhlowActions := OrderedCollection new.
	(self contextMenuActions
			select: [ :anAction | 
				anAction shouldShowContextActionOn: anObject viewSelection: aViewSelection ])
			do: [ :anAction | 
				anAction 
					collectInvidualActionsOn: allInitialPhlowActions
					forElement: anElement 
					item: anObject
					index: aViewSelection ].
				
	^ allInitialPhlowActions collect: [ :anAction |
			anAction 
				asItemBoundActionToItem: anObject viewSelection: aViewSelection ]
]

{ #category : #converting }
GtRemotePhlowListingView >> configureListingViewSpecificationOn: aViewSpecification [
	aViewSpecification hasMultipleSelection: self hasMultipleSelection.
	aViewSpecification hasContextActionSpecifications: self contextMenuActions notEmpty.
]

{ #category : #'context menu' }
GtRemotePhlowListingView >> contextActionsForTarget: aGtRemotePhlowActionTarget [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuTargetedObjectActions
			forTarget: aGtRemotePhlowActionTarget)
]

{ #category : #'context menu' }
GtRemotePhlowListingView >> contextActionsForTarget: aSingleTarget groupTarget: aGroupTarget groupWith: aGroupFactory [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuTargetedObjectActions
			forTarget: aSingleTarget groupTarget: aGroupTarget groupWith: aGroupFactory)
]

{ #category : #'context menu' }
GtRemotePhlowListingView >> contextActionsForTarget: aTarget groupWith: aGroupFactory [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuTargetedObjectActions
			forTarget: aTarget groupWith: aGroupFactory)
]

{ #category : #'api - actions' }
GtRemotePhlowListingView >> contextItemLabel: aString action: aBlock [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuAction label: aString action: aBlock)
]

{ #category : #'api - actions' }
GtRemotePhlowListingView >> contextItemLabel: aString action: aBlock showIf: aShowBlock [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuAction 
			label: aString 
			action: aBlock 
			show: aShowBlock)
]

{ #category : #accessing }
GtRemotePhlowListingView >> contextMenuActions [
	^ contextMenuActions ifNil: [ 
			contextMenuActions := OrderedCollection new ]
]

{ #category : #copying }
GtRemotePhlowListingView >> copyTransformationFrom: aTransformation [
	aTransformation ifNil: [ ^ self ].
	self send: aTransformation valuable
]

{ #category : #accessing }
GtRemotePhlowListingView >> defaultItemsComputation [
	^ #() asGPhlowItemsIterator
]

{ #category : #accessing }
GtRemotePhlowListingView >> defaultTransformation [
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
]

{ #category : #'api - actions' }
GtRemotePhlowListingView >> dynamicContextItems: aBlock [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuDynamicActions
			label: 'Dynamic menu items' actions: aBlock )
]

{ #category : #'api - actions' }
GtRemotePhlowListingView >> dynamicPhlowContextItems: aBlock [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuDynamicPhlowActions
			label: 'Dynamic phlow menu items' actions: aBlock )
]

{ #category : #'gt - extensions' }
GtRemotePhlowListingView >> gtViewContextMenuActionsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Context menu actions';
		items: [ self contextMenuActions ];
		column: 'Label' text: [ :each | each label ];
		column: 'Action' text: [ :each | each actionComputation ]
]

{ #category : #testing }
GtRemotePhlowListingView >> hasMultipleSelection [
	^ multipleSelectionEnabled ifNil: [ false ]
]

{ #category : #'api - scripting' }
GtRemotePhlowListingView >> items: aBlockClosure [
	itemsProviderComputation := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowListingView >> itemsProviderComputation [
	^ itemsProviderComputation ifNil: [ 
		itemsProviderComputation := self defaultItemsComputation ]
]

{ #category : #'api - scripting' }
GtRemotePhlowListingView >> send: aBlock [
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
]

{ #category : #accessing }
GtRemotePhlowListingView >> transformation [ 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
]

{ #category : #accessing }
GtRemotePhlowListingView >> transformation: aGtPhlowSendTransformation [
	transformation := aGtPhlowSendTransformation.
]

{ #category : #'api - scripting' }
GtRemotePhlowListingView >> withMultipleSelection [
	multipleSelectionEnabled := true
]

{ #category : #'api - scripting' }
GtRemotePhlowListingView >> withoutMultipleSelection [
	multipleSelectionEnabled := false
]
