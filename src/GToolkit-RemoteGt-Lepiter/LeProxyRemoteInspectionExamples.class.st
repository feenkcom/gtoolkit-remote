Class {
	#name : #LeProxyRemoteInspectionExamples,
	#superclass : #Object,
	#instVars : [
		'theDatabase'
	],
	#category : #'GToolkit-RemoteGt-Lepiter'
}

{ #category : #asserting }
LeProxyRemoteInspectionExamples >> assertPageCreationForStrategy: aPageStrategy inDatabase: aDatabase onSide: aProxySide [
	<gtExample>
	| page secondPage |
	
	page := aPageStrategy 
		ensurePlaygroundPageInDatabase: aDatabase 
		forObject: self targetProxyObjectForInspection.
	
	self assert: aDatabase pageCount equals: 1.
	self assert: page identityHash equals: aDatabase pages first identityHash.
	
	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide equals: aProxySide.
	
	secondPage := aPageStrategy 
		ensurePlaygroundPageInDatabase: aDatabase 
		forObject: self targetProxyObjectForInspection.
			
	self assert: aDatabase pageCount equals: 1.
	self assert: page identityHash equals: secondPage identityHash.
	
	^ page
]

{ #category : #asserting }
LeProxyRemoteInspectionExamples >> assertPageOnTestProxyFor: aPage [ 
	self assert: aPage type isProxyClassPageType.
	self assert: aPage type pageClassName equals: #GtRemotePhlowDeclarativeTestInspectable.
	self assert: aPage type proxyTypeName equals: self currentProxyTypeName.
]

{ #category : #asserting }
LeProxyRemoteInspectionExamples >> assertSingleEmptyCodeSnippetOfType: aSnippetType inPage: aPage [ 
	| initialSnippet |
	
	self assert: aPage children size equals: 1.
	
	initialSnippet := aPage children first.
	self assert: initialSnippet class equals: aSnippetType.
	self assert: initialSnippet code isEmpty.
]

{ #category : #'examples - database' }
LeProxyRemoteInspectionExamples >> basicDatabase [
	<gtExample>
	| database |
	database := LeDatabase new.
	database monitor: LeVolatileMonitor new.
	
	self assert: database pageCount equals: 0.
	
	^ database
]

{ #category : #asserting }
LeProxyRemoteInspectionExamples >> currentProxyTypeName [
	^ #GtRemoteInspectionSimulation
]

{ #category : #'examples - database' }
LeProxyRemoteInspectionExamples >> databaseWithMonitor [
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
LeProxyRemoteInspectionExamples >> inspectorToolForLocalProxyPage [
	<gtExample>
	| targetDatabase inspectorTool |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := (GtInspectorTool 
		forObject: self targetProxyObjectForInspection)
			databasesRegistry: (LeBasicDatabasesRegistry new 
				defaultLogicalDatabase: (LeLogicalDatabase new 
					primaryDB: targetDatabase));
			playgroundPageStrategy: self playgroundProxyPageLocalStrategy.
	
	^ inspectorTool
]

{ #category : #accessing }
LeProxyRemoteInspectionExamples >> inspectorWithLocalProxyPage [
	<gtExample>
	| targetDatabase scripter inspectorTool |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := self inspectorToolForLocalProxyPage.
	
	scripter := self scripter.
	scripter
		model: inspectorTool object;
		element: inspectorTool asElement.
	
	self assert: targetDatabase pageCount equals: 1.
	self assertPageOnTestProxyFor: targetDatabase pages first.
	self 
		assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType 
		inPage: targetDatabase pages first.
	
	^ scripter
]

{ #category : #'accessing - local side' }
LeProxyRemoteInspectionExamples >> localCodeSnippetType [
	^ LePharoSnippet
]

{ #category : #'examples - page strategy' }
LeProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy [
	<gtExample>
	| pageStrategy |
	
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forLocalProxySide.
	
	self assert: pageStrategy proxySide isLocalSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.
	
	^ pageStrategy
]

{ #category : #'examples - page strategy' }
LeProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_createPage [
	<gtExample>
	| targetDatabase pageStrategy page |
	
	targetDatabase := self basicDatabase.
	pageStrategy := self playgroundProxyPageLocalStrategy.
	
	page := self 
		assertPageCreationForStrategy: pageStrategy 
		inDatabase: targetDatabase 
		onSide: LeProxyClassPageType localSide.
	
	self 
		assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType 
		inPage: page.
	
	^ targetDatabase
]

{ #category : #'examples - page strategy' }
LeProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_createPageInMonitoredDatabase [
	<gtExample>
	| targetDatabase pageStrategy page |
	
	targetDatabase := self databaseWithMonitor.
	pageStrategy := self playgroundProxyPageLocalStrategy.
	
	page := self 
		assertPageCreationForStrategy: pageStrategy 
		inDatabase: targetDatabase 
		onSide: LeProxyClassPageType localSide.
	
	self 
		assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType
		inPage: page.
	
	^ targetDatabase
]

{ #category : #'examples - page strategy' }
LeProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_pageCreation [
	<gtExample>
	| pageStrategy page |
	
	pageStrategy := self playgroundProxyPageLocalStrategy.
	
	page := pageStrategy 
		createNewPageForObject: self targetProxyObjectForInspection.
	
	self 
		assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType 
		inPage: page.
	
	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isLocalSide.
	
	^ pageStrategy
]

{ #category : #'examples - page strategy' }
LeProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy [
	<gtExample>
	| pageStrategy page |
	
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forRemoteProxySide.
	page := pageStrategy 
		createNewPageForObject: self targetProxyObjectForInspection.
	
	self assert: pageStrategy proxySide isRemoteSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.
	
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: page.
	
	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isRemoteSide.
	
	^ pageStrategy
]

{ #category : #'examples - page strategy' }
LeProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_createPage [
	<gtExample>
	| targetDatabase pageStrategy page |
	
	targetDatabase := self basicDatabase.
	pageStrategy := self playgroundProxyPageRemoteStrategy.
	
	page := self 
		assertPageCreationForStrategy: pageStrategy 
		inDatabase: targetDatabase 
		onSide: LeProxyClassPageType remoteSide.
	
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: page.
	
	^ targetDatabase
]

{ #category : #'accessing - remote side' }
LeProxyRemoteInspectionExamples >> remoteCodeSnippetType [
	^ LePharoSnippet
]

{ #category : #accessing }
LeProxyRemoteInspectionExamples >> scripter [
	^ BlScripter new
]

{ #category : #'examples - tear down' }
LeProxyRemoteInspectionExamples >> stopDatabaseMonitor [
	theDatabase ifNotNil: [ theDatabase stopMonitoring ]
]

{ #category : #examples }
LeProxyRemoteInspectionExamples >> targetProxyObjectForInspection [
	<gtExample>
	^ GtRemotePhlowSimulationExamples new simulationOnRemoteObject
]
