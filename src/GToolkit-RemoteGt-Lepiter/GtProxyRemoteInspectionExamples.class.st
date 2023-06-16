Class {
	#name : #GtProxyRemoteInspectionExamples,
	#superclass : #Object,
	#instVars : [
		'theDatabase',
		'server'
	],
	#category : #'GToolkit-RemoteGt-Lepiter-Examples'
}

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertBothSidesInspectionForProxy: aProxyObject withTypeName: aTypeName [
	| targetDatabase inspectorTool scripter |
	targetDatabase := self databaseWithMonitor.
	
	inspectorTool := self 
		compositeInspectorToolForBothProxySidesForProxy: aProxyObject 
		withDatabase: targetDatabase.
		
	scripter := self scripter.
	scripter
		model: inspectorTool object;
		element: inspectorTool asElement.
	
	self 
		assertDatabaseBeforeCompositeToolInspectionFor: targetDatabase
		withTypeName: aTypeName.
	self 
		compositeInspectorSwitchToolUsing: scripter.
	self 
		assertDatabaseAfterLocalAndRemoteInspectionFor: targetDatabase
		withTypeName: aTypeName.
	
	^ scripter
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> assertDatabaseAfterLocalAndRemoteInspectionFor: aDatabase withTypeName: aTypeName [.
	self assert: aDatabase pageCount equals: 2.
	self assertPageOnTestProxyFor: aDatabase pages first withTypeName: aTypeName.
	self assertPageOnTestProxyFor: aDatabase pages second withTypeName: aTypeName.
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: aDatabase pagesByDate second.
	self 
		assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType 
		inPage: aDatabase pagesByDate first.
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> assertDatabaseBeforeCompositeToolInspectionFor: aDatabase withTypeName: aTypeName [.
	self assert: aDatabase pageCount equals: 1.
	self assertPageOnTestProxyFor: aDatabase pages first withTypeName: aTypeName.
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: aDatabase pages first.
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> assertInspectorTabContentsUsing: aScripter [ 
	| queryResult tabGroup |
	
	queryResult := (aScripter element query 
		// GtPhlowCompositeViewElementId) result.
	self assert: queryResult size equals: 1.
	tabGroup := queryResult first.
	
	aScripter substeps: 'Check tabs content' do: [ :aStep |
	
		tabGroup tabs withIndexDo: [ :aTab :anIndex |
			"aStep do
				label: 'Select Tab';
				// GtPhlowCompositeViewElementId;
				block: [ :aTabGroup | 
					self halt.
					aTabGroup viewModel 
						selectTab: (aTabGroup tabs 
							at: anIndex) ];
				play."
			
			aStep click 
				label: 'Click tab ', aTab tabLabel text asString;
				// GtPhlowCompositeViewElementId;
				@1;
				id: #header;
				id: ##scrolltabbar;
				id: #tabbar;
				onChildAt: anIndex;
				play.
				
			aStep check
				label: 'Clicked tab selected';
				// GtPhlowCompositeViewElementId;
				@1;
				value: [ :aTabGroup | 
					aTabGroup viewModel 
						indexOf: aTabGroup viewModel selectedTab ] equals: anIndex;
				play ] ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertInspectorTabLabelsUsing: scripter [ 
	scripter assert
		label: 'View Tabs Exist';
		// GtPhlowCompositeViewElementId;
		satisfies: [ :aTabGroup | aTabGroup tabs size > 0 ] ;
		play.
	
	scripter assert
		label: 'View Tab Labels Without Error label';
		// GtPhlowCompositeViewElementId;
		satisfies: [ :aTabGroup | 
			aTabGroup tabs noneSatisfy: [ :aTab |
				aTab tabLabel text asString = 'Error' ] ];
		play.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertInspectorToolLabelUsing: aScripter equals: aString [

	aScripter substeps: 'Check tool tab label' do: [ :aStep |
	
		aStep assert
			label: 'Tab label exists';
			id: #header;
			id: #scrolltabbar;
			id: #tabbar;
			value: [ :aTabBar | aTabBar children size ] equals: 1;
			play.
		
		aStep assert
			label: 'Tab label is correct';
			id: #header;
			id: #scrolltabbar;
			id: #tabbar;
			onChildAt: 1;
			value: [ :aTab | aTab label asString ] equals: aString;
			play ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertLocalInspectorToolLabelUsing: aScripter [ 
	self assertInspectorToolLabelUsing: aScripter equals: 'Proxy'
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertLocalPlaygroundPageUsing: aScripter [
	aScripter substeps: 'Check playground page' do: [ :aStep |
		self assertProxyPlaygroundPageTypeUsing: aStep.
		self 
			assertProxyPlaygroundPageContentWithSnippetType: self localCodeSnippetType 
			using: aStep ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertObjectInspectionFor: codeString withTypeName: anObjectType [
	| proxyObject |
	
	proxyObject := self convertToTargetProxy: (self runningServer 
		evaluateAndWait: codeString).
	
	^ self 
		assertObjectInspectionForProxy: proxyObject
		withTypeName: anObjectType
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertObjectInspectionForProxy: aProxyObject withTypeName: anObjectType [
	^ self 
		assertBothSidesInspectionForProxy: aProxyObject
		withTypeName: anObjectType
]

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
	self 
		assertPageOnTestProxyFor: aPage 
		withTypeName: self remoteObjectTypeName
]

{ #category : #asserting }
GtProxyRemoteInspectionExamples >> assertPageOnTestProxyFor: aPage assertPageOnTestProxyFor: aTypeName [
	self assert: aPage type isProxyClassPageType.
	self assert: aPage type pageClassName equals: aTypeName.
	self assert: aPage type proxyTypeName equals: self currentProxyTypeName.
]

{ #category : #asserting }
GtProxyRemoteInspectionExamples >> assertPageOnTestProxyFor: aPage withTypeName: aTypeName [
	self assert: aPage type isProxyClassPageType.
	self assert: aPage type pageClassName equals: aTypeName.
	self assert: aPage type proxyTypeName equals: self currentProxyTypeName.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertProxyPlaygroundPageContentWithSnippetType: aSnippetType using: aScripter [ 
	aScripter assert
		label: 'Is proxy page';
		// GtInspector;
		id: #playground;
		satisfies: [ :aPlaygroundElement | 
			| page |
			page := aPlaygroundElement page.
			page children size = 1 and: [ 
				page children first class = aSnippetType and: [
					page children first code isEmpty ] ] ];
		play.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertProxyPlaygroundPageTypeUsing: aScripter [
	
	aScripter assert
		label: 'Is proxy page';
		// GtInspector;
		id: #playground;
		satisfies: [ :aPlaygroundElement | 
			aPlaygroundElement page type isProxyClassPageType ];
		play.
		
	aScripter assert
		label: 'Proxy type name';
		// GtInspector;
		id: #playground;
		value: [ :aPlaygroundElement | aPlaygroundElement page type proxyTypeName ] 
			equals: self currentProxyTypeName;
		play 
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemoteInspectorToolLabelUsing: aScripter [ 
	self assertInspectorToolLabelUsing: aScripter equals: 'Remote'
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemotePlaygroundPageUsing: aScripter [
	aScripter substeps: 'Check playground page' do: [ :aStep |
		self assertProxyPlaygroundPageTypeUsing: aStep.
		self 
			assertProxyPlaygroundPageContentWithSnippetType: self remoteCodeSnippetType 
			using: aStep ]
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

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> compositeInspectorSwitchToolUsing: aScripter [ 
	<gtExample>
	
	aScripter substeps: 'Check Remote Side' do: [ :aStep |
		self assertLocalInspectorToolLabelUsing: aStep .
		self assertInspectorTabLabelsUsing: aStep.
		self assertRemotePlaygroundPageUsing: aStep.  ].
	
	aScripter click
		label: 'Switch to proxy inspector';
		id: #header;
		id: #scrolltabbar;
		id: #tabbar;
		play.
	
	aScripter substeps: 'Check Local Side' do: [ :aStep |
		self assertRemoteInspectorToolLabelUsing: aStep .
		self assertInspectorTabLabelsUsing: aStep.
		self assertLocalPlaygroundPageUsing: aStep. ].
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> compositeInspectorToolForBothProxySides [
	<gtExample>
	| targetDatabase |
	targetDatabase := self databaseWithMonitor.
	
	^ self
		compositeInspectorToolForBothProxySidesForProxy: self targetProxyObjectForInspection 
		withDatabase: targetDatabase
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> compositeInspectorToolForBothProxySidesForProxy: aProxy withDatabase: aDatabase [
	<gtExample>
	| compositeTool databasesRegistry |
	
	databasesRegistry:= LeBasicDatabasesRegistry new 
		defaultLogicalDatabase: (LeLogicalDatabase new 
			primaryDB: aDatabase).
	
	compositeTool := aProxy gtDefaultInspectorTool.
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
	
	self 
		assertDatabaseBeforeCompositeToolInspectionFor: targetDatabase
		withTypeName: self remoteObjectTypeName.
	self 
		compositeInspectorSwitchToolUsing: scripter.
	self 
		assertDatabaseAfterLocalAndRemoteInspectionFor: targetDatabase
		withTypeName: self remoteObjectTypeName.
	
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
		value: [ :aTabGroup | aTabGroup tabs size ] 
			equals: self localSideExpectedNumberOfViews ;
		play.
		
	self assertInspectorTabLabelsUsing: scripter.
	
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
		
	self assertInspectorTabLabelsUsing: scripter.
	"self assertInspectorTabContentsFor: scripter."
	
	^ scripter
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForLocalProxySide [
	<gtExample>
	| targetDatabase |
	targetDatabase := self databaseWithMonitor.
	
	^ self
		inspectorToolForLocalProxySideForProxy: self targetProxyObjectForInspection 
		withDatabase: self databaseWithMonitor 
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForLocalProxySideForProxy: aProxy withDatabase: aDatabase [
	<gtExample>
	|  inspectorTool |
	
	inspectorTool := (GtInspectorTool forObject: aProxy)
		databasesRegistry: (LeBasicDatabasesRegistry new 
			defaultLogicalDatabase: (LeLogicalDatabase new 
				primaryDB: aDatabase));
		playgroundPageStrategy: self playgroundProxyPageLocalStrategy.
	
	^ inspectorTool
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForRemoteProxySide [
	<gtExample>
	| targetDatabase |
	targetDatabase := self databaseWithMonitor.
	^ self 
		inspectorToolForRemoteProxySideForProxy: self targetProxyObjectForInspection 
		withDatabase: self databaseWithMonitor
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForRemoteProxySideForProxy: aProxy withDatabase: aDatabase [
	<gtExample>
	| inspectorTool |
	
	inspectorTool := aProxy gtRemoteSideInspectorTool
		databasesRegistry: (LeBasicDatabasesRegistry new 
			defaultLogicalDatabase: (LeLogicalDatabase new 
				primaryDB: aDatabase));
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
	| pageStrategy  |
	
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forRemoteProxySide.
	
	self assert: pageStrategy proxySide isRemoteSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.
	
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

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_pageCreation [
	<gtExample>
	| pageStrategy page |
	
	pageStrategy := self playgroundProxyPageRemoteStrategy.
	page := pageStrategy 
		createNewPageForObject: self targetProxyObjectForInspection.
	
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: page.
	
	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isRemoteSide.
	
	^ pageStrategy
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
