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
	<return: #LePage>
	| page |
	page := LePage
			proxyClassName: #GtRemotePhlowDeclarativeTestInspectable
			proxyTypeName: #GtRemoteInspectionSimulation
			proxySide: LeProxyClassPageType localSide.

	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isLocalSide.

	^ page
]

{ #category : #'examples - database key' }
LeProxyClassPageTypeExamples >> basicProxyPageLocalSide_reloadedPageFoundByLiveKey [
	"After a database is read back, the inspector finds the playground page of a proxy with the key it builds for the live proxy"

	<gtExample>
	<return: #LeDatabase>
	| deserializedPage database liveKey stringKey |
	deserializedPage := LeJsonV4 default
			deserialize: (LeJsonV4 default serialize: self basicProxyPageLocalSide) readStream.
	database := LeDatabase new.
	database addPage: deserializedPage.

	liveKey := LeProxyClassPageTypeDataseKey
			forPageClassName: #GtRemotePhlowDeclarativeTestInspectable
			proxyTypeName: #GtRemoteInspectionSimulation
			proxySide: LeProxyClassPageType localSide.
	stringKey := LeProxyClassPageTypeDataseKey
			forPageClassName: 'GtRemotePhlowDeclarativeTestInspectable'
			proxyTypeName: #GtRemoteInspectionSimulation
			proxySide: LeProxyClassPageType localSide.

	self
		assert: (database
				at: liveKey
				ifPresent: [ :aPage | aPage ]
				ifAbsent: [ nil ]
				forPageType: LeProxyClassPageType) == deserializedPage.
	self
		assert: (database
				at: stringKey
				ifPresent: [ :aPage | aPage ]
				ifAbsent: [ nil ]
				forPageType: LeProxyClassPageType) == deserializedPage.

	^ database
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageLocalSide_reloadedTypeEqualsOriginalType [
	"A page type read back from a database equals the type of the page that was stored"

	<gtExample>
	<return: #LePage>
	| page deserializedPage |
	page := self basicProxyPageLocalSide.
	deserializedPage := LeJsonV4 default
			deserialize: (LeJsonV4 default serialize: page) readStream.

	self assert: deserializedPage type equals: page type.
	self assert: deserializedPage type hash equals: page type hash.
	self assert: deserializedPage type databaseKey equals: page type databaseKey.

	^ deserializedPage
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageLocalSide_serialisation [
	<gtExample>
	<return: #LePage>
	| page |
	page := self basicProxyPageLocalSide.

	self assertPageSerializationFor: page onSide: LeProxyClassPageType localSide.

	^ page
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageRemoteSide [
	<gtExample>
	<return: #LePage>
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
	<return: #LePage>
	| page |
	page := self basicProxyPageRemoteSide.

	self assertPageSerializationFor: page onSide: LeProxyClassPageType remoteSide.

	^ page
]

{ #category : #'examples - database key' }
LeProxyClassPageTypeExamples >> databaseKeysWithStringAndSymbolNames [
	"Database keys compare the class names by content: the remote class of a proxy is a Symbol or a String, depending on the remote side"

	<gtExample>
	<return: #LeProxyClassPageTypeDataseKey>
	| symbolKey stringKey otherKey |
	symbolKey := LeProxyClassPageTypeDataseKey
			forPageClassName: #GtRemotePhlowDeclarativeTestInspectable
			proxyTypeName: #GtRemoteInspectionSimulation
			proxySide: LeProxyClassPageType localSide.
	stringKey := LeProxyClassPageTypeDataseKey
			forPageClassName: 'GtRemotePhlowDeclarativeTestInspectable'
			proxyTypeName: 'GtRemoteInspectionSimulation'
			proxySide: LeProxyClassPageType localSide.
	otherKey := LeProxyClassPageTypeDataseKey
			forPageClassName: #GtRemotePhlowDeclarativeTestInspectable
			proxyTypeName: #GtRemoteInspectionSimulation
			proxySide: LeProxyClassPageType remoteSide.

	self assert: stringKey equals: symbolKey.
	self assert: symbolKey equals: stringKey.
	self assert: stringKey hash equals: symbolKey hash.
	self assert: (otherKey = symbolKey) not.

	^ symbolKey
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> proxyPageWithStringNames [
	"Names read from a database file are Strings; the page type keeps them as Symbols"

	<gtExample>
	<return: #LePage>
	| page |
	page := LePage
			proxyClassName: 'GtRemotePhlowDeclarativeTestInspectable'
			proxyTypeName: 'GtRemoteInspectionSimulation'
			proxySide: LeProxyClassPageType localSide.

	self assertPageOnTestProxyFor: page.
	self assert: page type pageClassName isSymbol.
	self assert: page type proxyTypeName isSymbol.

	^ page
]
