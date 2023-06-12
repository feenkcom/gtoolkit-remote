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
LeInspectorPlaygroundProxyClassPageStrategy >> createInitialSnippet [
	^ self proxySide isRemoteSide 
		ifTrue: [ LeGemStoneSnippet new ] 
		ifFalse: [ LePharoSnippet new ]
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> createNewPageForObject: aProxyObject [
	| page |
	
	page := LePage 
		proxyClassName: aProxyObject remoteClass
		proxyTypeName: aProxyObject class name
		proxySide: self proxySide .
	
	page addSnippet: self createInitialSnippet.
	
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
		proxyTypeName: aProxyObject class name
		proxySide: self proxySide
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> playgroundPageType [
	^ LeProxyClassPageType
]

{ #category : #accessing }
LeInspectorPlaygroundProxyClassPageStrategy >> proxySide [
	^ proxySide
]
