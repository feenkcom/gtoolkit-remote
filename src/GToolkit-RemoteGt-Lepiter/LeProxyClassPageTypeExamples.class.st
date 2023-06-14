Class {
	#name : #LeProxyClassPageTypeExamples,
	#superclass : #Object,
	#instVars : [
		'theDatabase'
	],
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #asserting }
LeProxyClassPageTypeExamples >> assertPageOnTestProxyFor: aPage [ 
	self assert: aPage type isProxyClassPageType.
	self assert: aPage type pageClassName equals: #GtRemotePhlowDeclarativeTestInspectable.
	self assert: aPage type proxyTypeName equals:  #GtRemoteInspectionSimulation.
]

{ #category : #asserting }
LeProxyClassPageTypeExamples >> assertPageSerializationFor: aPage onSide: aProxySide [

	| serialised deserializedPage |
	serialised := LeJsonV4 default serialize: aPage.
	deserializedPage := LeJsonV4 default 
		deserialize: serialised readStream.
		
	self assertPageOnTestProxyFor: deserializedPage.
	self assert: deserializedPage type pageProxySide equals: aProxySide. 
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageLocalSide [
	<gtExample>
	| page |
	
	page := LePage 
		proxyClassName: #GtRemotePhlowDeclarativeTestInspectable 
		proxyTypeName: #GtRemoteInspectionSimulation  
		proxySide: LeProxyClassPageType localSide.
		
	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isLocalSide.
		
	^ page
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageLocalSide_serialisation [
	<gtExample>
	| page |
	
	page := self basicProxyPageLocalSide.
	
	self 
		assertPageSerializationFor: page 
		onSide: LeProxyClassPageType localSide.
		
	^ page
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageRemoteSide [
	<gtExample>
	| page |
	
	page := LePage 
		proxyClassName: #GtRemotePhlowDeclarativeTestInspectable 
		proxyTypeName: #GtRemoteInspectionSimulation  
		proxySide: LeProxyClassPageType remoteSide.
		
	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isRemoteSide.
		
	^ page
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageRemoteSide_serialisation [
	<gtExample>
	| page |
	
	page := self basicProxyPageRemoteSide.
	
	self 
		assertPageSerializationFor: page 
		onSide: LeProxyClassPageType remoteSide.
		
	^ page
]
