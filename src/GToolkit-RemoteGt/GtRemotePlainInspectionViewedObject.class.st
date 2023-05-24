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
GtRemotePlainInspectionViewedObject >> gtViewsInCurrentContextForObject: anObject excludingView: aCollection [
	"Answer a collection of the object's declarative views"

	^ ((self gtDeclarativeViewPragmsForObject: anObject) 
		reject: [ :aPragma |
			aCollection anySatisfy: [:assoc |
				assoc key = aPragma methodClass and: [
					assoc value = aPragma methodSelector ] ] ])
		collect: [ :aPragma |
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
	
	views := (self 
		gtViewsInCurrentContextForObject: object
		excludingView: { 
			Object ->#gtRawFor:.
			Object -> #gtPrintFor:}) asOrderedCollection.
	views 
		detect: [ :each | each title = 'Raw' ]
		ifNone: [ views add: (object 
			gtRemoteGtRawFor: #GtRemotePhlowDeclarativeProtoView asClass new) ].
	
	^ views
]
