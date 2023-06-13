Class {
	#name : #LeProxyClassPageType,
	#superclass : #LePageType,
	#instVars : [
		'pageClassName',
		'pageProxySide',
		'proxyTypeName'
	],
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #'instance creation' }
LeProxyClassPageType class >> forPageClassName: aTargetClassName proxyTypeName: aProxyClassName proxySide: aProxySide page: aPage [
	^ self new 
		initializeForPageClassName: aTargetClassName 
		proxyTypeName: aProxyClassName
		proxySide: aProxySide 
		page: aPage
]

{ #category : #serialization }
LeProxyClassPageType class >> leJsonV4AttributeMapping [

	^ super leJsonV4AttributeMapping
		add: (#pageClassName -> #pageClassName);
		add: (#pageProxySide -> #pageProxySide);
		add: (#proxyTypeName -> #proxyTypeName);
		yourself
]

{ #category : #serialization }
LeProxyClassPageType class >> leJsonV4Name [

	^ 'proxyClassPageType'
]

{ #category : #accessing }
LeProxyClassPageType class >> localSide [
	^ LeProxyClassPageTypeLocalPageSide new
]

{ #category : #accessing }
LeProxyClassPageType class >> remoteSide [
	^ LeProxyClassPageTypeRemotePageSide new
]

{ #category : #comparing }
LeProxyClassPageType >> = anObject [
	"Answer whether the receiver and anObject represent the same page type."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
		
	^ pageClassName = anObject pageClassName and: [
		pageProxySide = anObject pageProxySide and: [
			proxyTypeName = anObject proxyTypeName ] ]
]

{ #category : #accessing }
LeProxyClassPageType >> databaseKey [
	"Answer the attribute used to index a page of the receiver's type in the database."

	^ LeProxyClassPageTypeDataseKey 
		forPageClassName: self pageClassName 
		proxyTypeName: self proxyTypeName
		proxySide: self pageProxySide
]

{ #category : #comparing }
LeProxyClassPageType >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ (pageClassName hash 
		bitXor: pageProxySide hash)
		bitXor: proxyTypeName hash
]

{ #category : #initialization }
LeProxyClassPageType >> initializeForPageClassName: aTargetClassName proxyTypeName: aProxyClassName proxySide: aProxySide page: aPage [
	"Set the class name for the object referenced by the proxy, as well as the side of the proxy to which the page should be attached."

	self pageClassName: aTargetClassName.
	self proxyTypeName: aProxyClassName.
	self pageProxySide: aProxySide.
	
	self page: aPage
]

{ #category : #testing }
LeProxyClassPageType >> isProxyClassPageType [
	^ true
]

{ #category : #accessing }
LeProxyClassPageType >> pageClassName [
	<return: #Symbol>

	^ pageClassName
]

{ #category : #accessing }
LeProxyClassPageType >> pageClassName: aClassName [
	pageClassName := aClassName
]

{ #category : #accessing }
LeProxyClassPageType >> pageProxySide [
	<return: #Symbol>

	^ pageProxySide
]

{ #category : #accessing }
LeProxyClassPageType >> pageProxySide: aProxySide [
	pageProxySide := aProxySide
]

{ #category : #printing }
LeProxyClassPageType >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [ 
		aStream 
			<< self pageClassName;
			<< ' type; ';
			<< self proxyTypeName;
			<< ' proxy; ';
			<< self pageProxySide id;
			<< ' side' ]
]

{ #category : #accessing }
LeProxyClassPageType >> proxyTypeName [
	<return: #Symbol>

	^ proxyTypeName
]

{ #category : #accessing }
LeProxyClassPageType >> proxyTypeName: aProxyClassName [
	proxyTypeName := aProxyClassName
]

{ #category : #accessing }
LeProxyClassPageType >> title [

	^ String streamContents: [ :aStream |
		aStream 
			<< 'Proxy to ';
			<< self pageClassName;
			<< ' of type ';
			<< self proxyTypeName;
			<< ' side ';
			<< self pageProxySide id;
			<< ' Page' ]
]
