Class {
	#name : #GtPhlowIconStencil,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #views }
GtPhlowIconStencil >> gtViewLiveIconFor: aView [
	<gtView>
	^ aView forward
		title: 'Icon';
		priority: 10;
		object: [ self asElement ];
		view: #gtLiveFor:
]
