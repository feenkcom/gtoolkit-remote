Extension { #name : #Object }

{ #category : #'*GToolkit-Remote' }
Object >> gtDeclarativeViewAccessors [
	"Answer a collection of the objects view titles and associated initial priorities"

	^Array streamContents: [ :stream |
		(self gtViewsInContext: nil) do: [ :view | 
			view canBeGtDeclarativeView ifTrue: [
				stream nextPut: 
					(GtDeclarativeObjectGtViewAccessor new
						title: view title;
						priority: view priority;
						object: self;
						selector: view definingMethod selector) ] ] ].

]
