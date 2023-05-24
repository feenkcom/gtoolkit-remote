Class {
	#name : #GtRemotePlainInspectionViewedObject,
	#superclass : #GtRemotePhlowViewedObject,
	#category : #'GToolkit-RemoteGt-Development'
}

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> gtDeclarativeViewPragmsForObject: anObject [
	"Answer a collection of the object's declarative view selectors"

	^ Pragma 
		allNamed: #gtView
		from: anObject class
		to: Object
]

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> gtViewsInCurrentContextForObject: anObject [
	"Answer a collection of the object's declarative views"

	^ (self gtDeclarativeViewPragmsForObject: anObject) collect: [ :aPragma |
		| methodSelector phlowView |
		methodSelector := aPragma method selector.
		phlowView := anObject  
			perform: methodSelector
			with: GtRemotePhlowDeclarativeProtoView new.
		phlowView definingSelector: methodSelector.
		phlowView ]
]

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> phlowDeclarativeViews [
	"Retrieve the objects declarative views.
	If the default Raw view can't be declarative, provide one that is."
	| views |

	views := (self gtViewsInCurrentContextForObject: object).
	views 
		detect: [ :each | each title = 'Raw' ]
		ifNone: [ views add: (object gtRemoteGtRawFor: #GtPhlowView asClass empty) ].
	
	^ views
]
