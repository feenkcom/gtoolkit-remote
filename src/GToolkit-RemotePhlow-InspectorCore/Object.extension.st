Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-InspectorCore' }
Object >> gtDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtView
		from: self class
		to: Object) collect: [ :each | each method selector ]) asSet asArray
]
