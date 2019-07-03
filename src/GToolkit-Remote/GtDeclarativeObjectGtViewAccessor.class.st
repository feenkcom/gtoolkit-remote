Class {
	#name : #GtDeclarativeObjectGtViewAccessor,
	#superclass : #GtDeclarativeObjectViewAccessor,
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #converting }
GtDeclarativeObjectGtViewAccessor >> asJSONForExport [ 

	^(object perform: selector with: GtPhlowEmptyView new) asGtDeclarativeView asJSONForExport
]

{ #category : #accessing }
GtDeclarativeObjectGtViewAccessor >> viewItemAt: anInteger [
	"Answer the receiver's view item at anInteger.
	This is used by Declarative views to access remote items"

	^(object perform: selector with: GtPhlowEmptyView new) itemsBuilder value at: anInteger
]
