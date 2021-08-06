Extension { #name : 'Object' }

{ #category : '*GToolkit-RemotePhlow-InspectorCore' }
Object >> gtDeclarativePhlowViews [
	"Answer a collection of the object's declarative phlow view"
	
	^Array streamContents: [ :stream |
		(self gtViewsInContext: GtPhlowContext null)
			select: [ :view | view canBeGtDeclarativeView ] ].
]
