Class {
	#name : #GtRemotePhlowTreeNodeExpander,
	#superclass : #GtPhlowDeclarativeSpecification,
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #testing }
GtRemotePhlowTreeNodeExpander class >> isAbstract [
	^ self name = #GtRemotePhlowTreeNodeExpander
]

{ #category : #'api - instance creation' }
GtRemotePhlowTreeNodeExpander class >> null [
	^ GtRemotePhlowTreeNodeNoExpander new
]

{ #category : #'api - instance creation' }
GtRemotePhlowTreeNodeExpander class >> suchThat: aBlock [
	^ GtRemotePhlowTreeNodeConditionalExpander new condition: aBlock
]

{ #category : #'api - instance creation' }
GtRemotePhlowTreeNodeExpander class >> upTo: aLevelIndex [
	^ GtRemotePhlowTreeNodeUpToExpander new level: aLevelIndex
]

{ #category : #'api - configuration' }
GtRemotePhlowTreeNodeExpander >> configurePhlowView: aPhlowView [
	
]
