Class {
	#name : #LeProxyClassPageTypeExamples,
	#superclass : #Object,
	#instVars : [
		'theDatabase'
	],
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #asserting }
LeProxyClassPageTypeExamples >> assertPageCreationForStrategy: aPageStrategy inDatabase: aDatabase onSide: aProxySide [
	<gtExample>
	| page secondPage |
	
	page := aPageStrategy 
		ensurePlaygroundPageInDatabase: aDatabase 
		forObject: self targetProxyObjectForInspection.
	
	self assert: aDatabase pageCount equals: 1.
	self assert: page identityHash equals: aDatabase pages first identityHash.
	
	self assertPageOnTestProxtFor: page.
	self assert: page type pageProxySide equals: aProxySide.
	
	secondPage := aPageStrategy 
		ensurePlaygroundPageInDatabase: aDatabase 
		forObject: GtRemotePhlowSimulationExamples new 
			simulationOnRemoteObject.
			
	self assert: aDatabase pageCount equals: 1.
	self assert: page identityHash equals: secondPage identityHash.
	
	^ page
]

{ #category : #asserting }
LeProxyClassPageTypeExamples >> assertPageOnTestProxtFor: aPage [ 
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
		
	self assertPageOnTestProxtFor: deserializedPage.
	self assert: deserializedPage type pageProxySide equals: aProxySide. 
]

{ #category : #asserting }
LeProxyClassPageTypeExamples >> assertSingleEmptyCodeSnippetOfType: aSnippetType inPage: aPage [ 
	| initialSnippet |
	
	self assert: aPage children size equals: 1.
	
	initialSnippet := aPage children first.
	self assert: initialSnippet class equals: aSnippetType.
	self assert: initialSnippet code isEmpty.
]

{ #category : #'examples - database' }
LeProxyClassPageTypeExamples >> basicDatabase [
	<gtExample>
	| database |
	database := LeDatabase new.
	database monitor: LeVolatileMonitor new.
	
	self assert: database pageCount equals: 0.
	
	^ database
]

{ #category : #'examples - basic page' }
LeProxyClassPageTypeExamples >> basicProxyPageLocalSide [
	<gtExample>
	| page |
	
	page := LePage 
		proxyClassName: #GtRemotePhlowDeclarativeTestInspectable 
		proxyTypeName: #GtRemoteInspectionSimulation  
		proxySide: LeProxyClassPageType localSide.
		
	self assertPageOnTestProxtFor: page.
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
		
	self assertPageOnTestProxtFor: page.
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

{ #category : #'examples - database' }
LeProxyClassPageTypeExamples >> databaseWithMonitor [
	<gtExample>
	<after: #stopDatabaseMonitor>
	| folderReference localStore |
	
	^ theDatabase ifNil: [ 
		folderReference := FileSystem memory / 'storage'.
		folderReference ensureCreateDirectory.
		
		localStore := LeLocalStoreLoad current.
		localStore localRoot: folderReference.
		theDatabase := localStore loadAndMonitorFrom: folderReference.
		
		self assert: theDatabase explicitLinks size equals: 0.
		self assert: theDatabase pageCount equals: 0.
			
		theDatabase ]
]

{ #category : #accessing }
LeProxyClassPageTypeExamples >> inspectorWithLocalProxyPage [
	"<gtExample>"
	| inspectorTool inspector |
	inspectorTool := (GtInspectorTool forObject: self)
		playgroundPageStrategy: self playgroundProxyPageLocalStrategy.
		
	inspector := inspectorTool asElement.
	
	^ inspector
]

{ #category : #'examples - page strategy' }
LeProxyClassPageTypeExamples >> playgroundProxyPageLocalStrategy [
	<gtExample>
	| pageStrategy initialSnippet page |
	
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forLocalProxySide.
	initialSnippet := pageStrategy createInitialSnippet.
	page := pageStrategy 
		createNewPageForObject: self targetProxyObjectForInspection.
	
	self assert: pageStrategy proxySide isLocalSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.
	
	self assert: initialSnippet class equals: LePharoSnippet.
	self assert: initialSnippet code isEmpty.
	
	self assertPageOnTestProxtFor: page.
	self assert: page type pageProxySide isLocalSide.
	
	^ pageStrategy
]

{ #category : #'examples - page strategy' }
LeProxyClassPageTypeExamples >> playgroundProxyPageLocalStrategy_createPage [
	<gtExample>
	| targetDatabase pageStrategy page |
	
	targetDatabase := self basicDatabase.
	pageStrategy := self playgroundProxyPageLocalStrategy.
	
	page := self 
		assertPageCreationForStrategy: pageStrategy 
		inDatabase: targetDatabase 
		onSide: LeProxyClassPageType localSide.
	
	self 
		assertSingleEmptyCodeSnippetOfType: LePharoSnippet 
		inPage: page.
	
	^ targetDatabase
]

{ #category : #'examples - page strategy' }
LeProxyClassPageTypeExamples >> playgroundProxyPageLocalStrategy_createPageInMonitoredDatabase [
	<gtExample>
	| targetDatabase pageStrategy page |
	
	targetDatabase := self databaseWithMonitor.
	pageStrategy := self playgroundProxyPageLocalStrategy.
	
	page := self 
		assertPageCreationForStrategy: pageStrategy 
		inDatabase: targetDatabase 
		onSide: LeProxyClassPageType localSide.
	
	self 
		assertSingleEmptyCodeSnippetOfType: LePharoSnippet 
		inPage: page.
	
	^ targetDatabase
]

{ #category : #'examples - page strategy' }
LeProxyClassPageTypeExamples >> playgroundProxyPageRemoteStrategy [
	<gtExample>
	| pageStrategy initialSnippet page |
	
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forRemoteProxySide.
	initialSnippet := pageStrategy createInitialSnippet.
	page := pageStrategy 
		createNewPageForObject: self targetProxyObjectForInspection.
	
	self assert: pageStrategy proxySide isRemoteSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.
	
	self assert: initialSnippet class equals: LeGemStoneSnippet.
	self assert: initialSnippet code isEmpty.
	
	self assertPageOnTestProxtFor: page.
	self assert: page type pageProxySide isRemoteSide.
	
	^ pageStrategy
]

{ #category : #'examples - page strategy' }
LeProxyClassPageTypeExamples >> playgroundProxyPageRemoteStrategy_createPage [
	<gtExample>
	| targetDatabase pageStrategy page |
	
	targetDatabase := self basicDatabase.
	pageStrategy := self playgroundProxyPageRemoteStrategy.
	
	page := self 
		assertPageCreationForStrategy: pageStrategy 
		inDatabase: targetDatabase 
		onSide: LeProxyClassPageType remoteSide.
	
	self 
		assertSingleEmptyCodeSnippetOfType: LeGemStoneSnippet 
		inPage: page.
	
	^ targetDatabase
]

{ #category : #'examples - tear down' }
LeProxyClassPageTypeExamples >> stopDatabaseMonitor [
	theDatabase ifNotNil: [ theDatabase stopMonitoring ]
]

{ #category : #examples }
LeProxyClassPageTypeExamples >> targetProxyObjectForInspection [
	<gtExample>
	^ GtRemotePhlowSimulationExamples new simulationOnRemoteObject
]
