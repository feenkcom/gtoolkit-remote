Extension { #name : #Object }

{ #category : #'*GToolkit-RemotePhlow-InspectorCore' }
Object >> gtDeclarativePhlowActions [
	"Answer a collection of the object's declarative phlow actions"
	
	^ self gtActionsInCurrentContext
		select: [ :aPhlowAction | aPhlowAction canBeGtDeclarativeAction ]
]

{ #category : #'*GToolkit-RemotePhlow-InspectorCore' }
Object >> gtDeclarativePhlowViews [
	"Answer a collection of the object's declarative phlow view"
	
	^ self gtViewsInCurrentContext
		select: [ :view | view canBeGtDeclarativeView ]
]
