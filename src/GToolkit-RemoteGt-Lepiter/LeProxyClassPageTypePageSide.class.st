Class {
	#name : #LeProxyClassPageTypePageSide,
	#superclass : #LeModel,
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #comparing }
LeProxyClassPageTypePageSide >> = anObject [
	"Answer whether the receiver and anObject represent the same page type."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
		
	^ self id = anObject id 
]

{ #category : #actions }
LeProxyClassPageTypePageSide >> configureExistingPage: aPage forProxyObject: aProxyObject [
	| newSnippet  firstSnippetInPage |
	newSnippet := self 
		initialPlaygroundSnippetForProxyObject: aProxyObject.
	
	aPage children size = 0 ifTrue: [
		aPage addSnippet: newSnippet.
		^ self].
	
	firstSnippetInPage := aPage children first.
	firstSnippetInPage class = newSnippet class ifFalse: [
		aPage addFirstSnippet: newSnippet ]
]

{ #category : #actions }
LeProxyClassPageTypePageSide >> configureNewPage: aPage forProxyObject: aProxyObject [
	aPage addSnippet: (self 
		initialPlaygroundSnippetForProxyObject: aProxyObject)
]

{ #category : #comparing }
LeProxyClassPageTypePageSide >> hash [
	^ self id hash
]

{ #category : #accessing }
LeProxyClassPageTypePageSide >> id [
	^ self subclassResponsibility
]

{ #category : #actions }
LeProxyClassPageTypePageSide >> initialPlaygroundSnippetForProxyObject: aProxyObject [
	^ self subclassResponsibility
]

{ #category : #testing }
LeProxyClassPageTypePageSide >> isLocalSide [
	^ self isRemoteSide not
]

{ #category : #testing }
LeProxyClassPageTypePageSide >> isRemoteSide [
	^ false
]
