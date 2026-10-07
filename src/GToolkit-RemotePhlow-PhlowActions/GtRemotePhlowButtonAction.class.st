Class {
	#name : #GtRemotePhlowButtonAction,
	#superclass : #GtRemotePhlowAction,
	#instVars : [
		'label',
		'iconStencil',
		'actionComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowActions'
}

{ #category : #accessing }
GtRemotePhlowButtonAction >> action: aValuable [
	actionComputation := aValuable
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> actionBlock [
	^ self actionComputation
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> actionComputation [
	^ actionComputation
]

{ #category : #converting }
GtRemotePhlowButtonAction >> asGtDeclarativeAction [
	| specification |
	
	specification := GtPhlowButtonActionSpecification new
		priority: self priority;
		tooltipText: self tooltipText;
		target: self target asRemotePhlowActionTarget;
		label: self label;
		iconStencil: self iconStencil;
		phlowDataSource: (GtRemotePhlowDeclarativeBlockActionDataSource new
			phlowAction: self;
			targetBlock: self actionComputation).
	self hasMenuOptions ifTrue: [
		specification menuOptions: self menuOptions asMenuOptionsSpecification ].
		
	self id ifNotNil: [ :anId |
		specification id: anId asBlocElementId ].
		
	^ specification
]

{ #category : #converting }
GtRemotePhlowButtonAction >> asItemBoundActionToItem: anItem viewSelection: anIndex [
	"Normal phlow actions do no get the item or the selection as parameters.
	They are bound already to them when they are created."
	^ self
]

{ #category : #testing }
GtRemotePhlowButtonAction >> canBeGtDeclarativeAction [
	^ self 
			gtDo: [
				super canBeGtDeclarativeAction and: [
					self canBeGtDeclarativeActionOnTheGtSide ] ] 
			gemstoneDo: [ 
				super canBeGtDeclarativeAction]
]

{ #category : #converting }
GtRemotePhlowButtonAction >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 1;
		declarativeStencil: [
			GtPhlowNamedStencil new
				stencilClassName: #GtLocalPhlowActionStencil;
				stencilData: (self asGtDeclarativeAction 
					asDictionaryForExportWithPhlowDataSource);
				dataSerializationStrategy: GtPhlowStencilDataSerializationStrategy 
					forMixedProxyDataEncoding  ];
		actionButtonIcon: GtPhlowGlamorousVectorIconNameStencil play
			action: [ :aButton | 
				self actionComputation cull:  aButton ]
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> icon: anIconStencil [
	iconStencil := anIconStencil
]

{ #category : #accessing }
GtRemotePhlowButtonAction >> iconStencil [
	^ iconStencil
]

{ #category : #initialization }
GtRemotePhlowButtonAction >> initialize [
	super initialize.

	actionComputation := [ :aButton | 
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

{ #category : #testing }
GtRemotePhlowButtonAction >> shouldShowContextActionOn: anItem viewSelection: aSelectionIndex [ 
	^ true
]
