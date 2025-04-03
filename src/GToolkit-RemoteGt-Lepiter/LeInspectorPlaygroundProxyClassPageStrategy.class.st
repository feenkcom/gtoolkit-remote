Class {
	#name : #LeInspectorPlaygroundProxyClassPageStrategy,
	#superclass : #LeInspectorPlaygroundPageStrategy,
	#instVars : [
		'proxySide'
	],
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #'instance creation' }
LeInspectorPlaygroundProxyClassPageStrategy class >> forLocalProxySide [
	 ^ self new
	 	initializeForProxySide: LeProxyClassPageType localSide
]

{ #category : #'instance creation' }
LeInspectorPlaygroundProxyClassPageStrategy class >> forRemoteProxySide [
	 ^ self new
	 	initializeForProxySide: LeProxyClassPageType remoteSide
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> configureExistingPage: aPage forObject: aProxyObject [
	self proxySide
		configureExistingPage: aPage 
		forProxyObject: aProxyObject.
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> configureNewPage: aPage forProxyObject: aProxyObject [ 
	self proxySide
		configureNewPage: aPage 
		forProxyObject: aProxyObject.
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> createNewPageForObject: aProxyObject [
	| page |
	
	page := LePage 
		proxyClassName: aProxyObject remoteClass
		proxyTypeName: (self playgroundPageProxyTypeNameFor: aProxyObject)
		proxySide: self proxySide .
	
	self 
		configureNewPage: page 
		forProxyObject: aProxyObject.

	^ page
]

{ #category : #initialization }
LeInspectorPlaygroundProxyClassPageStrategy >> initializeForProxySide: aProxySide [
	proxySide := aProxySide.
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> pageDatabaseKeyBasedOnObject: aProxyObject [
	^ LeProxyClassPageTypeDataseKey
		forPageClassName: aProxyObject remoteClass
		proxyTypeName: (self playgroundPageProxyTypeNameFor: aProxyObject)
		proxySide: self proxySide
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> playgroundPageProxyTypeNameFor: aProxyObject [
	^ aProxyObject class leProxyTypeForPlaygroundPage name
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> playgroundPageType [
	^ LeProxyClassPageType
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> proxySide [
	^ proxySide
]
