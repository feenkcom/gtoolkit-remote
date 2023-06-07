Class {
	#name : #GtRemotePhlowDeclarativeForwardViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#instVars : [
		'cachedViewSpecification'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #api }
GtRemotePhlowDeclarativeForwardViewDataSource >> getDeclarativeViewFor: aViewSelector [
	"This mimics the API provided by the inspecotr proxy to initialize views.
	In this case foe forwarded views, we allways return the datasource for 
	the target views, as this is the only view the client will request.
	
	We do not check right now if the selector matches, as in some
	cases the method selector is not set correctly in the specification."

	^ self retrieveForwardTargetDataSource
]

{ #category : #api }
GtRemotePhlowDeclarativeForwardViewDataSource >> retrieveForwardTargetDataSource [
	^ cachedViewSpecification phlowDataSource
]

{ #category : #api }
GtRemotePhlowDeclarativeForwardViewDataSource >> retrieveViewSpecificationForForwarding [
	| computedPhlowView |
	computedPhlowView := self phlowView computeForwardedView.
	self phlowView hasTransformation ifTrue: [ 
		computedPhlowView 
			copyTransformationFrom: self phlowView transformation ].
			
	cachedViewSpecification := computedPhlowView asGtDeclarativeView.
	cachedViewSpecification methodSelector: computedPhlowView definingSelector.
	
	^ cachedViewSpecification asDictionaryForExport
]
