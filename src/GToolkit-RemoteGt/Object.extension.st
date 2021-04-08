Extension { #name : #Object }

{ #category : #'*GToolkit-RemoteGt' }
Object >> gtDeclarativeViewSelectors [
	"Answer a collection of the object's declarative view selectors"

	^Array streamContents: [ :stream |
		(self gtViewsInContext: GtPhlowContext null) do: [ :view | 
			view canBeGtDeclarativeView ifTrue: [
				stream nextPut: view definingMethod selector ] ] ].

]
