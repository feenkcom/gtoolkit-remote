Class {
	#name : #GtRemotePhlowActionTargetTestItem,
	#superclass : #Object,
	#instVars : [
		'label',
		'value',
		'children'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowActionTargetTestItem class >> label: aLabel value: aValue [
	^ self new
		label: aLabel;
		value: aValue
]

{ #category : #'instance creation' }
GtRemotePhlowActionTargetTestItem class >> label: aLabel value: aValue children: aCollection [
	^ self new
		label: aLabel;
		value: aValue;
		children: aCollection
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItem >> children [
	^ children ifNil: [ #() ]
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItem >> children: aCollection [
	children := aCollection
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItem >> gtBasicContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		label: 'Basic action';
		priority: 6;
		action: [ :anElement | 
			anElement phlow spawnObject: self ]
]

{ #category : #'gt - extensions - object actions' }
GtRemotePhlowActionTargetTestItem >> gtBrowseActionFor: anAction [
	<gtAction>

	^ anAction button
		target: GtRemotePhlowObjectActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #browse);
		label: 'Browse';
		priority: 3;
		action: [ :anElement | 
			anElement phlow spawnObject: self class ]
]

{ #category : #'gt - extensions - view actions' }
GtRemotePhlowActionTargetTestItem >> gtCopyDetailsActionFor: anAction [
	<gtAction>
	
	^ anAction button
		forViewDefinedIn: #gtDetailsFor:;
		label: 'Copy details';
		priority: 10;
		action: [ :anElement | 
			anElement phlow 
				copyToClipboard: self label , ': ' , self value printString ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestItem >> gtCopyLabelContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		id: GtRemotePhlowExampleCopyLabelActionId new;
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #clipboard);
		label: 'Copy label';
		menuItemPreview: self label;
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration editing;
		priority: 7;
		action: [ :anElement | 
			anElement phlow copyToClipboard: self label ]
]

{ #category : #'gt - extensions - views' }
GtRemotePhlowActionTargetTestItem >> gtDetailsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Details';
		priority: 10;
		items: [ { 'Label' -> self label. 'Value' -> self value } ];
		column: 'Property' text: [ :anAssoc | anAssoc key ];
		column: 'Value' text: [ :anAssoc | anAssoc value ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItem >> gtDisabledContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #cancel);
		label: 'Disabled action';
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		menuDisable: [ true ];
		priority: 5;
		action: [ :anElement | ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestItem >> gtInspectItemContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		id: GtRemotePhlowExampleInspectItemActionId new;
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #inspect);
		label: 'Inspect item';
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		menuShortcut: 'i';
		priority: 1;
		action: [ :anElement | 
			anElement phlow spawnObject: self ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowActionTargetTestItem >> gtInspectObjectContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		id: GtRemotePhlowExampleCustomInspectActionId new;
		target: GtRemotePhlowObjectContextMenuTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #inspect);
		label: 'Custom inspect item';
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		priority: 8;
		action: [ :anElement | 
			anElement phlow spawnObject: self ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItem >> gtInspectValueContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		icon: (GtPhlowGlamorousVectorIconNameStencil new 
			iconName: #inspect);
		label: 'Inspect value';
		menuItemPreview: self value printString;
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration inspection;
		menuDisable: [ self value isNil ];
		priority: 2;
		action: [ :anElement | 
			anElement phlow spawnObject: self value ]
]

{ #category : #'gt - extensions - object actions' }
GtRemotePhlowActionTargetTestItem >> gtPrintActionFor: anAction [
	<gtAction>
	
	^ anAction button
		label: 'Print';
		priority: 5;
		action: [ :anElement | 
			anElement phlow spawnObject: self printString ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItem >> gtPrintItemContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		label: 'Print item';
		menuItemPreview: self printString;
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration printing;
		menuItemHideOnClick: false;
		priority: 3;
		action: [ :anElement | 
			anElement phlow spawnObject: self printString ]
]

{ #category : #'gt - extensions - context menu actions' }
GtRemotePhlowActionTargetTestItem >> gtPrintLabelContextMenuActionFor: anAction [
	<gtAction>
	
	^ anAction button
		target: GtRemotePhlowExampleItemActionTarget;
		label: 'Print label';
		menuItemPreview: self label;
		menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration printing;
		menuItemPinSubmenu;
		priority: 4;
		action: [ :anElement | 
			anElement phlow spawnObject: self label ]
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItem >> label [
	^ label
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItem >> label: aString [
	label := aString
]

{ #category : #printing }
GtRemotePhlowActionTargetTestItem >> printOn: aStream [
	aStream parenthesize: [
		aStream
			nextPutAll: (label ifNil: [ '' ]);
			nextPutAll: ': ';
			print: value ]
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItem >> value [
	^ value
]

{ #category : #accessing }
GtRemotePhlowActionTargetTestItem >> value: anObject [
	value := anObject
]
