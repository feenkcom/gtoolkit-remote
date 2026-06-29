"
I provide examples focused on building remote phlow views with button actions.
"
Class {
	#name : #GtRemotePhlowViewActionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #examples }
GtRemotePhlowViewActionExamples >> remoteListViewCollectsButtonActions [
	<gtExample>
	<return: #GtRemotePhlowListView>
	| view |
	view := GtRemotePhlowProtoView new list.
	
	view
		title: 'Buttons';
		priority: 10;
		itemText: [ :each | each asString ].
		
	view actionButtonLabel: 'Inspect' action: [ :button | button ].
	view 
		actionButtonLabel: 'Inspect with tooltip' 
		tooltip: 'Inspect objects' 
		action: [ :button | button ].
		
	view 
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #playinspect) 
		action: [ :button | button ].
		
	view 
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #playinspect) 
		tooltip: 'Inspect with icon' 
		action: [ :button | button ].
		
	view 
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #refresh) 
		label: 'Refresh' 
		action: [ :button | button ].
		
	view 
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #refresh) 
		label: 'Refresh tooltip' 
	tooltip: 'Refresh objects' 
	action: [ :button | button ].

	self assert: view actions size equals: 6.
	self assert: view actions first label equals: 'Inspect'.
	self assert: view actions first tooltipText equals: nil.
	self assert: view actions second label equals: 'Inspect with tooltip'.
	self assert: view actions second tooltipText equals: 'Inspect objects'.
	self assert: view actions third label equals: nil.
	self
		assert: view actions third iconStencil
		equals: (GtPhlowGlamorousVectorIconNameStencil forIconName: #playinspect).
	self assert: view actions fourth tooltipText equals: 'Inspect with icon'.
	self assert: view actions fifth label equals: 'Refresh'.
	self assert: view actions sixth label equals: 'Refresh tooltip'.
	self assert: view actions sixth tooltipText equals: 'Refresh objects'.
	self assert: (view actions collect: [ :each | each priority ]) asArray equals: #(51 52 53 54 55 56).

	^ view
]
