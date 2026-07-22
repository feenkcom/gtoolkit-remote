"
I provide dedicated remote phlow declarative example views that exercise button actions through the view API.
"
Class {
	#name : #GtRemotePhlowDeclarativeActionsInspectableForExamples,
	#superclass : #Object,
	#instVars : [
		'collectionOfObjects',
		'string'
	],
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'instance creation' }
GtRemotePhlowDeclarativeActionsInspectableForExamples class >> new [
	^ self basicNew initialize
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> collectionOfObjects [
	^ collectionOfObjects
]

{ #category : #'gt-extensions' }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> gtListViewWithAllButtonActionsFor: aView [
	<gtView>

	^ aView list
		title: 'List with all button actions';
		priority: 23;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ];
		actionButtonLabel: 'Inspect' action: [ :aButton |
			aButton phlow spawnObject: 1 ];
		actionButtonLabel: 'Inspect (tooltip)' tooltip: 'Inspect objects' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #playinspect) action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects first ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #playinspect) tooltip: 'Inspect with icon' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects second ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #refresh) label: 'Inspect' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects third ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #refresh) label: 'Inspect (tooltip)' tooltip: 'Inspect objects' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects ]
]

{ #category : #'gt-extensions' }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> gtListViewWithIconActionsFor: aView [
	<gtView>

	^ aView list
		title: 'List with icon actions';
		priority: 21;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #playinspect) action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects first ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #playinspect) tooltip: 'Inspect with icon' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects second ]
]

{ #category : #'gt-extensions' }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> gtListViewWithLabelActionsFor: aView [
	<gtView>

	^ aView list
		title: 'List with label actions';
		priority: 20;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ];
		actionButtonLabel: 'Inspect' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects first ];
		actionButtonLabel: 'Inspect (tooltip)' tooltip: 'Inspect objects' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects second ]
]

{ #category : #'gt-extensions' }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> gtListViewWithLabelAndIconActionsFor: aView [
	<gtView>

	^ aView list
		title: 'List with label and icon actions';
		priority: 22;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #refresh) label: 'Inspect' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects third ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #refresh) label: 'Inspect (tooltip)' tooltip: 'Inspect objects' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects ]
]

{ #category : #'gt-extensions' }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> gtTextViewWithButtonActionsFor: aView [
	<gtView>

	^ aView text
		title: 'Text with button actions';
		priority: 24;
		text: [ string asRopedText ];
		actionButtonLabel: 'Inspect text' action: [ :aButton |
			aButton phlow spawnObject: string ];
		actionButtonIcon: (GtPhlowGlamorousVectorIconNameStencil new
			iconName: #playinspect) tooltip: 'Inspect collection' action: [ :aButton |
			aButton phlow spawnObject: collectionOfObjects ]
]

{ #category : #initialization }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> initialize [
	super initialize.
	
	string := 'hello world'.
	collectionOfObjects := #(42 'Hello World' 7)
]

{ #category : #accessing }
GtRemotePhlowDeclarativeActionsInspectableForExamples >> string [
	^ string
]
