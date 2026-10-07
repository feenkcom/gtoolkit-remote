Class {
	#name : #GtRemotePhlowActionTargetTestItemGroup,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowActionTargetTestItemGroup class >> withAll: aCollection [
	^ self new items: aCollection
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItemGroup >> gtBasicGroupContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		label: 'Basic group action';
		priority: 5;
		action: [ :anElement | 
			anElement phlow spawnObject: self ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItemGroup >> gtDisabledGroupContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #cancel);
		label: 'Disabled group action';
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		menuDisable: [ true ];
		priority: 4;
		action: [ :anElement | ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItemGroup >> gtInspectGroupContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #inspect);
		label: 'Inspect group';
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		menuShortcut: 'g';
		priority: 1;
		action: [ :anElement | 
			anElement phlow spawnObject: self ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItemGroup >> gtInspectGroupItemsContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #inspect);
		label: 'Inspect group items';
		menuItemPreview: self items size printString, ' items';
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		priority: 2;
		action: [ :anElement | 
			anElement phlow spawnObject: self items ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItemGroup >> gtPrintGroupContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		label: 'Print group';
		menuItemPreview: self printString;
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration printing;
		menuItemHideOnClick: false;
		priority: 3;
		action: [ :anElement | 
			anElement phlow spawnObject: self printString ]
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItemGroup >> items [
	^ items
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItemGroup >> items: aCollection [
	items := aCollection
]

{ #category : #printing }
GtRemotePhlowActionTargetTestItemGroup >> printOn: aStream [
	aStream
		nextPutAll: 'Group(';
		print: items size;
		nextPutAll: ' items)'
]
