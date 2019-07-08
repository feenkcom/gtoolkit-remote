Class {
	#name : #GtDeclarativeObjectGtViewAccessor,
	#superclass : #GtDeclarativeObjectViewAccessor,
	#instVars : [
		'viewDeclaration',
		'view'
	],
	#category : #'GToolkit-Remote-Declarative Views'
}

{ #category : #converting }
GtDeclarativeObjectGtViewAccessor >> asJSONForExport [ 

	^self viewDeclaration asJSONForExport
]

{ #category : #printing }
GtDeclarativeObjectGtViewAccessor >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self title;
		nextPut: $)
		 
]

{ #category : #ui }
GtDeclarativeObjectGtViewAccessor >> gtViewJSONStringFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Json';
		text: [self asJSONForExport]
]

{ #category : #accessing }
GtDeclarativeObjectGtViewAccessor >> retrieve: aSymbol [
	"Answer the information named by aSymbol"

	^aSymbol value: object
]

{ #category : #accessing }
GtDeclarativeObjectGtViewAccessor >> sentItemAt: aKey [
	"Answer the receiver's transformed item at aKey.
	This is used by Declarative views to access remote items"

	^self view send cull: (self view itemsBuilder value at: aKey) cull: nil
]

{ #category : #accessing }
GtDeclarativeObjectGtViewAccessor >> view [ 

	^view ifNil: [ view := object perform: selector with: GtPhlowEmptyView new ]
]

{ #category : #accessing }
GtDeclarativeObjectGtViewAccessor >> viewDeclaration [

	^viewDeclaration ifNil: [ viewDeclaration := self view asGtDeclarativeView ]
]
