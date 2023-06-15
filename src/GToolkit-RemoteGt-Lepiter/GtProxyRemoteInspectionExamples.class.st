Class {
	#name : #GtProxyRemoteInspectionExamples,
	#superclass : #Object,
	#instVars : [
		'theDatabase',
		'server'
	],
	#category : #'GToolkit-RemoteGt-Lepiter-Examples'
}

{ #category : #asserting }
GtProxyRemoteInspectionExamples >> assertPageCreationForStrategy: aPageStrategy inDatabase: aDatabase onSide: aProxySide [
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
GtProxyRemoteInspectionExamples >> assertPageOnTestProxyFor: aPage [ 
	self assert: aPage type isProxyClassPageType.
	self assert: aPage type pageClassName equals: self remoteObjectTypeName.
	self assert: aPage type proxyTypeName equals: self currentProxyTypeName.
]

{ #category : #asserting }
GtProxyRemoteInspectionExamples >> assertSingleEmptyCodeSnippetOfType: aSnippetType inPage: aPage [ 
	| initialSnippet |
	
	self assert: aPage children size equals: 1.
	
	initialSnippet := aPage children first.
	self assert: initialSnippet class equals: aSnippetType.
	self assert: initialSnippet code isEmpty.
]

{ #category : #'examples - database' }
GtProxyRemoteInspectionExamples >> basicDatabase [
	<gtExample>
	| database |
	database := LeDatabase new.
	database monitor: LeVolatileMonitor new.
	
	self assert: database pageCount equals: 0.
	
	^ database
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> compositeInspectorToolForBothProxySides [
	<gtExample>
	| targetDatabase compositeTool databasesRegistry |
	targetDatabase := self databaseWithMonitor.
	
	databasesRegistry:= LeBasicDatabasesRegistry new 
		defaultLogicalDatabase: (LeLogicalDatabase new 
			primaryDB: targetDatabase).
	
	compositeTool := self targetProxyObjectForInspection gtDefaultInspectorTool.
	compositeTool tools do: [ :aTool |
		aTool databasesRegistry: databasesRegistry ].
	
	^ compositeTool
]

{ #category : #accessing }
GtProxyRemoteInspectionExamples >> currentProxyTypeName [
	^ #GtRemoteInspectionSimulation
]

{ #category : #'examples - database' }
GtProxyRemoteInspectionExamples >> databaseWithMonitor [
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

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> inspectorForBothProxySides [
	<gtExample>
	| targetDatabase scripter inspectorTool |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := self compositeInspectorToolForBothProxySides.
	
	scripter := self scripter.
	scripter
		model: inspectorTool object;
		element: inspectorTool asElement.
	
	self assert: targetDatabase pageCount equals: 1.
	self assertPageOnTestProxyFor: targetDatabase pages first.
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: targetDatabase pages first.
	
	^ scripter
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> inspectorForLocalProxySide [
	<gtExample>
	| targetDatabase scripter inspectorTool |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := self inspectorToolForLocalProxySide.
	
	scripter := self scripter.
	scripter
		model: inspectorTool object;
		element: inspectorTool asElement.
	
	self assert: targetDatabase pageCount equals: 1.
	self assertPageOnTestProxyFor: targetDatabase pages first.
	self 
		assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType 
		inPage: targetDatabase pages first.
		
	scripter assert
		// GtPhlowCompositeViewElementId;
		satisfies: [ :aTabGroup | aTabGroup tabs size > 0 ] ;
		play.
	
	^ scripter
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> inspectorForRemoteProxySide [
	<gtExample>
	| targetDatabase scripter inspectorTool |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := self inspectorToolForRemoteProxySide.
	
	scripter := self scripter.
	scripter
		model: inspectorTool object;
		element: inspectorTool asElement.
	
	self assert: targetDatabase pageCount equals: 1.
	self assertPageOnTestProxyFor: targetDatabase pages first.
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: targetDatabase pages first.
		
	scripter assert
		// GtPhlowCompositeViewElementId;
		value: [ :aTabGroup | aTabGroup tabs size ] 
			equals: self localSideExpectedNumberOfViews ;
		play.
	
	^ scripter
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForLocalProxySide [
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

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForRemoteProxySide [
	<gtExample>
	| targetDatabase inspectorTool |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := (GtInspectorTool 
		forObject: self targetProxyObjectForInspection)
			databasesRegistry: (LeBasicDatabasesRegistry new 
				defaultLogicalDatabase: (LeLogicalDatabase new 
					primaryDB: targetDatabase));
			playgroundPageStrategy: self playgroundProxyPageRemoteStrategy.
	
	^ inspectorTool
]

{ #category : #'accessing - local side' }
GtProxyRemoteInspectionExamples >> localCodeSnippetType [
	^ LePharoSnippet
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> localSideExpectedNumberOfViews [
	^ 4
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy [
	<gtExample>
	| pageStrategy |
	
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forLocalProxySide.
	
	self assert: pageStrategy proxySide isLocalSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.
	
	^ pageStrategy
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_createPage [
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
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_createPageInMonitoredDatabase [
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
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_pageCreation [
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
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy [
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
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_createPage [
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
GtProxyRemoteInspectionExamples >> remoteCodeSnippetType [
	^ LePharoSnippet
]

{ #category : #'accessing - remote side' }
GtProxyRemoteInspectionExamples >> remoteObjectTypeName [
	"Answer the class name of the remote object"

	^ #GtRemotePhlowDeclarativeTestInspectable
]

{ #category : #'examples - server' }
GtProxyRemoteInspectionExamples >> runningServer [
	"Answer a running server.
	No server is required running the examples in a single image.
	Subclasses should overwrite this to start the server"
	<gtExample>
	<after: #stopServer>

]

{ #category : #accessing }
GtProxyRemoteInspectionExamples >> scripter [
	^ BlScripter new
]

{ #category : #'tear down' }
GtProxyRemoteInspectionExamples >> stopDatabaseMonitor [
	theDatabase ifNotNil: [ theDatabase stopMonitoring ]
]

{ #category : #'tear down' }
GtProxyRemoteInspectionExamples >> stopServer [ 

	server ifNotNil: [ 
		server stop.
		server := nil ]
]

{ #category : #examples }
GtProxyRemoteInspectionExamples >> targetProxyObjectForInspection [
	<gtExample>
	
	^ GtRemotePhlowSimulationExamples new 
		simulationOnRemoteObject
]
