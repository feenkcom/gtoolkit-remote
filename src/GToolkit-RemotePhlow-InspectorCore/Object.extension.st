Extension { #name : 'Object' }

{ #category : '*GToolkit-RemotePhlow-InspectorCore' }
Object >> gtDeclarativePhlowViews [
	"Answer a collection of the object's declarative phlow view"
	
	^ self gtViewsInCurrentContext
		select: [ :view | view canBeGtDeclarativeView ]
]
