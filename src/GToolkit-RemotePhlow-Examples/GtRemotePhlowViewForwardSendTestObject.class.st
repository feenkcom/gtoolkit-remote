Class {
	#name : #GtRemotePhlowViewForwardSendTestObject,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowViewForwardSendTestObject >> gtForwardListWithBasicContextActionsFor: aView [
	<gtView>
	
	^ aView forward
		title: 'List - Basic actions';
		priority: 15.5;
		object: [ GtRemotePhlowListViewContextActionsBasicTestObject new ];
		view: #gtListWithBasicContextActionsFor:
]

{ #category : #'as yet unclassified' }
GtRemotePhlowViewForwardSendTestObject >> gtForwardListWithBasicContextActionsMultipleSelectionFor: aView [
	<gtView>
	
	^ aView forward
		title: 'List - Basic - multiple selection';
		priority: 15.6;
		object: [ GtRemotePhlowListViewContextActionsBasicTestObject new ];
		view: #gtListWithBasicContextActionsMultipleSelectionFor:
]
