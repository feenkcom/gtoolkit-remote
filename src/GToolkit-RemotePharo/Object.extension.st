Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePharo' }
Object >> gtDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtDeclarativeView
		from: self class
		to: Object) collect: [ :each | each method selector ] as: Set) asArray
]
