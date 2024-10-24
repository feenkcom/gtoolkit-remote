Class {
	#name : #LeProxyClassPageTypeDataseKey,
	#superclass : #Object,
	#instVars : [
		'pageClassName',
		'pageProxySide',
		'proxyTypeName'
	],
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #'instance creation' }
LeProxyClassPageTypeDataseKey class >> forPageClassName: aTargetClassName proxyTypeName: aProxyClassName proxySide: aProxySide [
	^ self new 
		initializeForPageClassName: aTargetClassName 
		proxyTypeName: aProxyClassName
		proxySide: aProxySide 
]

{ #category : #comparing }
LeProxyClassPageTypeDataseKey >> = anObject [
	"Answer whether the receiver and anObject represent the same database key."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
		
	^ (pageClassName sameContentAs: anObject pageClassName) and: [
		pageProxySide = anObject pageProxySide and: [
			proxyTypeName = anObject proxyTypeName ] ]
]

{ #category : #comparing }
LeProxyClassPageTypeDataseKey >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ (pageClassName hash 
		bitXor: pageProxySide hash)
		bitXor: proxyTypeName hash
]

{ #category : #initialization }
LeProxyClassPageTypeDataseKey >> initializeForPageClassName: aTargetClassName proxyTypeName: aProxyClassName proxySide: aProxySide [
	"Set the class name for the object referenced by the proxy, as well as the side of the proxy to which the page should be attached."

	pageClassName := aTargetClassName.
	proxyTypeName := aProxyClassName.
	pageProxySide := aProxySide.
]

{ #category : #accessing }
LeProxyClassPageTypeDataseKey >> pageClassName [
	^ pageClassName
]

{ #category : #accessing }
LeProxyClassPageTypeDataseKey >> pageProxySide [
	^ pageProxySide
]

{ #category : #accessing }
LeProxyClassPageTypeDataseKey >> proxyTypeName [
	^ proxyTypeName
]
