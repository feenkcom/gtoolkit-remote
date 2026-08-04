Class {
	#name : #GtRemotePlainInspectionViewedObject,
	#superclass : #GtRemotePhlowViewedObject,
	#category : #'GToolkit-RemoteGt-Development'
}

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> gtActionsInCurrentContextForObject: anObject [ 
	"Answer a collection of the object's declarative actions"

	^ ((self gtDeclarativeActionPragmsForObject: anObject))
		collect: [ :aPragma |
			| methodSelector phlowAction |
			methodSelector := aPragma method selector.
			
			phlowAction := GtRemotePhlowAction new  noAction
				on: anObject 
				perform: methodSelector.
		
			phlowAction definingSelector: methodSelector.
			phlowAction definingClass: anObject class.
			phlowAction ]
]

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> gtDeclarativeActionPragmsForObject: anObject [
	"Answer a collection of the object's declarative action selectors"

	^ Pragma 
		allNamed: #gtAction
		from: anObject class
		to: Object
]

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
			
			phlowView := GtRemotePhlowProtoView new empty 
				on: anObject 
				perform: methodSelector.
		
			phlowView definingSelector: methodSelector.
			phlowView definingClass: anObject class.
			phlowView ]
]

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> phlowDeclarativeActions [
	"Retrieve the object's declarative action using the remote phlow API."
	
	^ self  gtActionsInCurrentContextForObject: object.
]

{ #category : #accessing }
GtRemotePlainInspectionViewedObject >> phlowDeclarativeViews [
	"Retrieve the objects declarative views using the remote phlow API.
	If the default Raw view can't be declarative, provide one that is."
	| views |
	
	views := (self 
		gtViewsInCurrentContextForObject: object
		excludingView: { 
			Object ->#gtRawFor:.
			Object -> #gtPrintFor:}) asOrderedCollection.
	views 
		detect: [ :each | each title = 'Raw' ]
		ifNone: [ views := views , {(object 
			gtRemoteGtRawFor: #GtRemotePhlowProtoView asClass new)} ].
	
	^ views
]
