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
GtRemotePhlowListingView >> collectIndividualContextMenuActionsForElement: anElement item: anObject index: anIndex [
	| allInitialPhlowActions |
	
	allInitialPhlowActions := OrderedCollection new.
	self contextMenuActions
			"select: [ :anAction | anAction respondsToItem: item ]"
			do: [ :anAction | 
				anAction 
					collectInvidualActionsOn: allInitialPhlowActions
					forElement: anElement 
					item: anObject
					index: anIndex ].
				
	^ allInitialPhlowActions collect: [ :anAction |
			anAction 
				asItemBoundActionToItem: anObject index: anIndex ]
]

{ #category : #converting }
GtRemotePhlowListingView >> configureListingViewSpecificationOn: aViewSpecification [
	aViewSpecification hasMultipleSelection: self hasMultipleSelection.
	aViewSpecification hasContextActionSpecifications: self contextMenuActions notEmpty.
]

{ #category : #'api - actions' }
GtRemotePhlowListingView >> contextItemLabel: aString action: aBlock [
	self contextMenuActions
		add: (GtRemotePhlowContextMenuAction label: aString action: aBlock)
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
