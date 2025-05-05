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
GtProxyRemoteInspectionExamples >> assertActionDatasourcesInProxyInspector: aProxyInspector [
	self assert: aProxyInspector rawActionSpecificationsBySelector notNil.
	
	aProxyInspector rawActionSpecificationsBySelector do: [ :anActionSpecification |
		self assert: anActionSpecification phlowDataSource notNil ].
]

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

{ #category : #'asserting - inspection' }
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

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertDatabaseBeforeCompositeToolInspectionFor: aDatabase withTypeName: aTypeName [.
	self assert: aDatabase pageCount equals: 1.
	self assertPageOnTestProxyFor: aDatabase pages first withTypeName: aTypeName.
	self 
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType 
		inPage: aDatabase pages first.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertInspectorTabLabelsUsing: scripter [
	scripter
		assertStep: [ :s | 
			s
				label: 'View Tabs Exist';
				// GtPhlowCompositeViewElementId;
				satisfies: [ :aTabGroup | aTabGroup tabs size > 0 ] ].

	scripter
		assertStep: [ :s | 
			s
				label: 'View Tab Labels Without Error label';
				// GtPhlowCompositeViewElementId;
				satisfies: [ :aTabGroup | 
					aTabGroup tabs noneSatisfy: [ :aTab | 
						aTab tabLabel text asString = 'Error' ] ] ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertInspectorToolLabelUsing: aScripter atIndex: aTabIndex selected: aBoolean equals: aString [
	aScripter
		substeps: 'Check tool tab label'
		do: [ :aStep | 
			aStep
				assertStep: [ :s | 
					s
						label: 'Tab label exists';
						id: #header;
						id: #scrolltabbar;
						id: #tabbar;
						value: [ :aTabBar | aTabBar children size ] equals: 2 ].

			aStep
				assertStep: [ :s | 
					s
						label: 'Tab label is correct';
						id: #header;
						id: #scrolltabbar;
						id: #tabbar;
						onChildAt: aTabIndex;
						value: [ :aTab | aTab label asString ] equals: aString ].
						
			aStep
				assertStep: [ :s | 
					s
						label: 'Tab is selected';
						id: #header;
						id: #scrolltabbar;
						id: #tabbar;
						onChildAt: aTabIndex;
						value: [ :aTab | aTab viewModel isSelected ] equals:aBoolean ] ]
]

{ #category : #'asserting - views' }
GtProxyRemoteInspectionExamples >> assertLocalAndRemotePhlowViewsFor: aProxyObject [.
	self assertObjectPhlowViewsFor: aProxyObject.
	self assertRemoteSideObjectPhlowViewsFor: aProxyObject.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertLocalInspectorToolLabelUsing: aScripter selected: aBoolean [
	self 
		assertInspectorToolLabelUsing: aScripter 
		atIndex: 2 
		selected: aBoolean
		equals: 'Proxy'
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertLocalInspectorToolSelectedUsing: aScripter [ 
	self assertRemoteInspectorToolLabelUsing: aScripter selected: false.
	self assertLocalInspectorToolLabelUsing: aScripter selected: true.
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
GtProxyRemoteInspectionExamples >> assertObjectInspectionFor: codeStringOrBlockClosure withTypeName: anObjectType [
	| proxyObject |
	proxyObject := self createProxyObjectFor: codeStringOrBlockClosure.

	self assertLocalAndRemotePhlowViewsFor: proxyObject.

	^ self assertObjectInspectionForProxy: proxyObject withTypeName: anObjectType
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertObjectInspectionFor: codeStringOrBlockClosure withTypeName: anObjectType inspectorTitle: anInspectorTitle [
	| proxyObject |
	proxyObject := self createProxyObjectFor: codeStringOrBlockClosure.

	self assertLocalAndRemotePhlowViewsFor: proxyObject.
	self 
		assertRemoteInspectorTitle: anInspectorTitle
		for: proxyObject.

	^ self assertObjectInspectionForProxy: proxyObject withTypeName: anObjectType
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertObjectInspectionFor: codeStringOrBlockClosure withTypeName: anObjectType inspectorTitleIncludes: aCollection [
	| proxyObject |
	proxyObject := self createProxyObjectFor: codeStringOrBlockClosure.

	self assertLocalAndRemotePhlowViewsFor: proxyObject.
	self 
		assertRemoteInspectorTitleIncludes: aCollection
		for: proxyObject.

	^ self assertObjectInspectionForProxy: proxyObject withTypeName: anObjectType
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
	aScripter
		assertStep: [ :s | 
			s
				label: 'Is proxy page';
				// GtInspector;
				id: #playground;
				satisfies: [ :aPlaygroundElement | 
					| page |
					page := aPlaygroundElement page.
					page children size = 1
						and: [ page children first class = aSnippetType
								and: [ page children first code isEmpty ] ] ] ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertProxyPlaygroundPageTypeUsing: aScripter [
	aScripter
		assertStep: [ :s | 
			s
				label: 'Is proxy page';
				// GtInspector;
				id: #playground;
				satisfies: [ :aPlaygroundElement | aPlaygroundElement page type isProxyClassPageType ] ].

	aScripter
		assertStep: [ :s | 
			s
				label: 'Proxy type name';
				// GtInspector;
				id: #playground;
				value: [ :aPlaygroundElement | aPlaygroundElement page type proxyTypeName ]
					equals: self currentProxyTypeName ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemoteInspectorTitle: aString for: proxyObject [
	| expectedTitle objectAdapter objectAdapterRemoteTitle |
	
	expectedTitle := aString, ' [<unnamed>:nil]'.
	
	"Check the title at the level of the adaptor"
	objectAdapter := GtRemotePhlowViewedObjectInspectorAdaptor
		forTargetObject:proxyObject.
	objectAdapterRemoteTitle := String streamContents: [ :aStream |
		objectAdapter gtInspectorRemoteSideTitleStringOn: aStream ].
	self assert: objectAdapterRemoteTitle equals: expectedTitle.
		
	"Check the title as returned by the inspector"
	self 
		assert: proxyObject gtRemoteSideInspectorTool objectHolder view newLabel  
		equals:expectedTitle.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemoteInspectorTitleIncludes: aCollection for: proxyObject [
	| expectedTitles objectAdapter objectAdapterRemoteTitle |
	
	expectedTitles := aCollection collect: [ :each | each, ' [<unnamed>:nil]' ].
	
	"Check the title at the level of the adaptor"
	objectAdapter := GtRemotePhlowViewedObjectInspectorAdaptor
		forTargetObject:proxyObject.
	objectAdapterRemoteTitle := String streamContents: [ :aStream |
		objectAdapter gtInspectorRemoteSideTitleStringOn: aStream ].
	self assert: (expectedTitles includes: objectAdapterRemoteTitle).
		
	"Check the title as returned by the inspector"
	self 
		assert: (expectedTitles includes: proxyObject gtRemoteSideInspectorTool objectHolder view newLabel).
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemoteInspectorToolLabelUsing: aScripter selected: aBoolean [
	self 
		assertInspectorToolLabelUsing: aScripter 
		atIndex: 1
		selected: aBoolean
		equals: self remoteInspectorToolLabel
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemoteInspectorToolSelectedUsing: aScripter [ 
	self assertRemoteInspectorToolLabelUsing: aScripter selected: true.
	self assertLocalInspectorToolLabelUsing: aScripter selected: false.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemotePlaygroundPageUsing: aScripter [
	aScripter substeps: 'Check playground page' do: [ :aStep |
		self assertProxyPlaygroundPageTypeUsing: aStep.
		self 
			assertProxyPlaygroundPageContentWithSnippetType: self remoteCodeSnippetType 
			using: aStep ]
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertRemoteSideObjectPhlowViewsFor: aProxyObject [ 
	| objectAdapter |
	objectAdapter := GtRemotePhlowViewedObjectInspectorAdaptor
		forTargetObject: aProxyObject.
	GtPhlowViewTester new 
		assertObject: objectAdapter
		withViewsSelector: #gtViewsForRemoteSideInContext:.
	
	self assert: objectAdapter proxyInspector notNil.
	self assertViewDatasourcesInProxyInspector: objectAdapter proxyInspector.
]

{ #category : #asserting }
GtProxyRemoteInspectionExamples >> assertSingleEmptyCodeSnippetOfType: aSnippetType inPage: aPage [ 
	| initialSnippet |
	
	self assert: aPage children size equals: 1.
	
	initialSnippet := aPage children first.
	self assert: initialSnippet class equals: aSnippetType.
	self assert: initialSnippet code isEmpty.
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> assertViewDatasourcesInProxyInspector: aProxyInspector [
	self assert: aProxyInspector rawViewSpecificationsBySelector notNil.
	aProxyInspector rawViewSpecificationsBySelector do: [ :aViewSpecification |
		self assert: aViewSpecification phlowDataSource notNil ]
]

{ #category : #'examples - database' }
GtProxyRemoteInspectionExamples >> basicDatabase [
	<gtExample>
	<return: #LeDatabase>
	| database |
	database := LeDatabase new.
	database monitor: LeVolatileMonitor new.

	self assert: database pageCount equals: 0.

	^ database
]

{ #category : #'asserting - inspection' }
GtProxyRemoteInspectionExamples >> compositeInspectorSwitchToolUsing: aScripter [
	<gtExample>
	aScripter
		substeps: 'Check Remote Side'
		do: [ :aStep | 
			self assertRemoteInspectorToolSelectedUsing: aStep.
			self assertInspectorTabLabelsUsing: aStep.
			self assertRemotePlaygroundPageUsing: aStep ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Switch to proxy inspector';
				id: #header;
				id: #scrolltabbar;
				id: #tabbar;
				onChildAt: 2 ].

	aScripter
		substeps: 'Check Local Side'
		do: [ :aStep | 
			self assertLocalInspectorToolSelectedUsing: aStep.
			self assertInspectorTabLabelsUsing: aStep.
			self assertLocalPlaygroundPageUsing: aStep ]
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> compositeInspectorToolForBothProxySides [
	<gtExample>
	<return: #GtPhlowCompositeTool>
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

{ #category : #converting }
GtProxyRemoteInspectionExamples >> convertToTargetProxy: anObject [ 
	"Allow subclasses to transform the type of proxy instead of assuming that the server computes the right type."
	^ anObject
]

{ #category : #utils }
GtProxyRemoteInspectionExamples >> createProxyObjectFor: codeStringOrBlockClosure [
	^ self
		convertToTargetProxy: (codeStringOrBlockClosure gtIsBlockClosure
				ifTrue: [ self runningServer evaluateBlockAndWaitReturnProxy: codeStringOrBlockClosure ]
				ifFalse: [ self runningServer evaluateAndWaitReturnProxy: codeStringOrBlockClosure ])
]

{ #category : #accessing }
GtProxyRemoteInspectionExamples >> currentProxyTypeName [
	^ #GtRemoteInspectionSimulation
]

{ #category : #'examples - database' }
GtProxyRemoteInspectionExamples >> databaseWithMonitor [
	<gtExample>
	<after: #stopDatabaseMonitor>
	<return: #LeDatabase>
	| folderReference localStore |
	^ theDatabase
		ifNil: [ folderReference := FileSystem memory / 'storage'.
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
	<return: #BlScripter>
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
	self compositeInspectorSwitchToolUsing: scripter.
	self
		assertDatabaseAfterLocalAndRemoteInspectionFor: targetDatabase
		withTypeName: self remoteObjectTypeName.

	^ scripter
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> inspectorForLocalProxySide [
	<gtExample>
	<return: #BlScripter>
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

	scripter
		assertStep: [ :s | 
			s
				// GtPhlowCompositeViewElementId;
				value: [ :aTabGroup | aTabGroup tabs size ]
					equals: self localSideExpectedNumberOfViews ].

	self assertInspectorTabLabelsUsing: scripter.

	^ scripter
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> inspectorForRemoteProxySide [
	<gtExample>
	<return: #BlScripter>
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

	self assertInspectorTabLabelsUsing: scripter.	"self assertInspectorTabContentsFor: scripter."

	^ scripter
]

{ #category : #'examples - tools' }
GtProxyRemoteInspectionExamples >> inspectorToolForLocalProxySide [
	<gtExample>
	<return: #GtInspectorTool>
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
	<return: #GtInspectorTool>
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
GtProxyRemoteInspectionExamples >> localProxyInspector [
	<gtExample>
	<return: #GtLocalPhlowViewedObject>
	| localProxyInspector |
	localProxyInspector := nil.
	self targetProxyObjectForInspection
		localProxyInspectorDo: [ :aLocalProxyInspector | localProxyInspector := aLocalProxyInspector ].

	self assert: localProxyInspector notNil.
	self assertViewDatasourcesInProxyInspector: localProxyInspector.
	self assertActionDatasourcesInProxyInspector: localProxyInspector.

	^ localProxyInspector
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> localSideExpectedNumberOfViews [
	^ 3
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy [
	<gtExample>
	<return: #LeInspectorPlaygroundProxyClassPageStrategy>
	| pageStrategy |
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forLocalProxySide.

	self assert: pageStrategy proxySide isLocalSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.

	^ pageStrategy
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_createPage [
	<gtExample>
	<return: #LeDatabase>
	| targetDatabase pageStrategy page |
	targetDatabase := self basicDatabase.
	pageStrategy := self playgroundProxyPageLocalStrategy.

	page := self
			assertPageCreationForStrategy: pageStrategy
			inDatabase: targetDatabase
			onSide: LeProxyClassPageType localSide.

	self assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType inPage: page.

	^ targetDatabase
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_createPageInMonitoredDatabase [
	<gtExample>
	<return: #LeDatabase>
	| targetDatabase pageStrategy page |
	targetDatabase := self databaseWithMonitor.
	pageStrategy := self playgroundProxyPageLocalStrategy.

	page := self
			assertPageCreationForStrategy: pageStrategy
			inDatabase: targetDatabase
			onSide: LeProxyClassPageType localSide.

	self assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType inPage: page.

	^ targetDatabase
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageLocalStrategy_pageCreation [
	<gtExample>
	<return: #LeInspectorPlaygroundProxyClassPageStrategy>
	| pageStrategy page |
	pageStrategy := self playgroundProxyPageLocalStrategy.

	page := pageStrategy
			createNewPageForObject: self targetProxyObjectForInspection.

	self assertSingleEmptyCodeSnippetOfType: self localCodeSnippetType inPage: page.

	self assertPageOnTestProxyFor: page.
	self assert: page type pageProxySide isLocalSide.

	^ pageStrategy
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy [
	<gtExample>
	<return: #LeInspectorPlaygroundProxyClassPageStrategy>
	| pageStrategy |
	pageStrategy := LeInspectorPlaygroundProxyClassPageStrategy forRemoteProxySide.

	self assert: pageStrategy proxySide isRemoteSide.
	self assert: pageStrategy playgroundPageType equals: LeProxyClassPageType.

	^ pageStrategy
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_createPage_initialPage [
	<gtExample>
	<return: #LeDatabase>
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
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_createPage_noInitialChildSnippets [
	<gtExample>
	<return: #LeDatabase>
	| targetDatabase pageStrategy currentPage locatedPage |
	targetDatabase := self playgroundProxyPageRemoteStrategy_createPage_initialPage.
	pageStrategy := self playgroundProxyPageRemoteStrategy.
	currentPage := targetDatabase pages first.	"Remove the first snippet so we get a wrongly configured page"
	currentPage removeSnippet: currentPage children first.

	locatedPage := pageStrategy
			ensurePlaygroundPageInDatabase: targetDatabase
			forObject: self targetProxyObjectForInspection.

	self assert: targetDatabase pageCount equals: 1.
	self assert: locatedPage identityHash equals: currentPage identityHash.
	self
		assert: locatedPage identityHash
		equals: targetDatabase pages first identityHash.

	self assertPageOnTestProxyFor: locatedPage.
	self
		assert: locatedPage type pageProxySide
		equals: LeProxyClassPageType remoteSide.

	self
		assertSingleEmptyCodeSnippetOfType: self remoteCodeSnippetType
		inPage: locatedPage.

	^ targetDatabase
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_createPage_wrongFirstSnippet [
	<gtExample>
	<return: #LeDatabase>
	| targetDatabase pageStrategy currentPage locatedPage initialSnippet |
	targetDatabase := self playgroundProxyPageRemoteStrategy_createPage_initialPage.
	pageStrategy := self playgroundProxyPageRemoteStrategy.
	currentPage := targetDatabase pages first.	"Remove the existing snippet and add another one first
	that is of the wrong type"
	currentPage removeSnippet: currentPage children first.
	currentPage addSnippet: (LeTextSnippet string: 'hello').

	locatedPage := pageStrategy
			ensurePlaygroundPageInDatabase: targetDatabase
			forObject: self targetProxyObjectForInspection.

	self assert: targetDatabase pageCount equals: 1.
	self assert: locatedPage identityHash equals: currentPage identityHash.
	self
		assert: locatedPage identityHash
		equals: targetDatabase pages first identityHash.

	self assertPageOnTestProxyFor: locatedPage.
	self
		assert: locatedPage type pageProxySide
		equals: LeProxyClassPageType remoteSide.

	self assert: locatedPage children size equals: 2.

	initialSnippet := locatedPage children first.
	self assert: initialSnippet class equals: self remoteCodeSnippetType.
	self assert: initialSnippet code isEmpty.

	^ targetDatabase
]

{ #category : #'examples - page strategy' }
GtProxyRemoteInspectionExamples >> playgroundProxyPageRemoteStrategy_pageCreation [
	<gtExample>
	<return: #LeInspectorPlaygroundProxyClassPageStrategy>
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

{ #category : #accessing }
GtProxyRemoteInspectionExamples >> remoteInspectorToolLabel [
	^ 'Remote'
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
	<return: #GtProxyRemoteInspectionExamples>
	
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
	<return: #GtRemoteInspectionSimulation>
	^ GtRemotePhlowSimulationExamples new simulationOnRemoteObject
]

{ #category : #'examples - inspection' }
GtProxyRemoteInspectionExamples >> targetProxyObjectForInspection_viewsAreOk [
	<gtExample>
	<return: #GtProxyRemoteInspectionExamples>
	^ self assertLocalAndRemotePhlowViewsFor: self targetProxyObjectForInspection
]
