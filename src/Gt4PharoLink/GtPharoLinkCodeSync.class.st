"
inspired by EpApplyVisitor

ClassAdded
	compiler >> #evaluate:
ClassCommented
	Class >> #classComment:stamp:
ClassModifiedClassDefinition
	compiler >> #evaluate:
ClassRecategorized
	Class >> #category:
ClassRenamed
	Class >> #rename:
ClassRemoved
	Class >> #removeFromSystem

MethodAdded
	ClassDescription >> #compile:classified:
MethodModified
	ClassDescription >> #compile:classified:
MethodRecategorized
	ClassOrganization >> #classify:under:
MethodRemoved
	Behavior >> #removeSelector:
	
CategoryAdded
	SystemOrganizer >> #addCategory:
CategoryRemoved
	SystemOrganizer >> #removeCategory:
CategoryRenamed
	SystemOrganizer >> #renameCategory:toBe:
	
ProtocolAdded
	ClassOrganization >> #addCategory:
ProtocolRemoved
	ClassOrganization >> #removeCategory:
ProtocolRenamed
	ClassOrganization >> #renameCategory:toBe:
	
##get things

ClassOrganization
	ClassDescription >> #organization
SystemOrganizer
	SystemOrganizer class >> #default

##ignored for now

ClassModificationApplied
	ignore, superfluous
ClassParentRenamed
	ignore, superfluous
ClassReorganized
	ignore, covered by protocol announcements
ClassRepackaged
	ignore, ?
MethodRepackaged
	ignore, covered by MethodRecategorized
ClassTagAdded
	RPackage addClassTag:
ClassTagRemoved
	RPackage removeClassTag:
ClassTagRenamed
	RPackageTag renameTo:

##old epicea approach

EpMonitor current log announcer
    subscribe: EpEntryAdded
    send: #remoteSyncChange:
    to: self

remoteSyncChange: anEvent
    | entry |
    entry := anEvent entry.
    ^ remotePeer
        evaluate: [ EpLogBrowserOperationFactory new
                logBrowserModel: (EpLogBrowserPresenter newWithLog: EpLogBrowserPresenter defaultLog);
                entries: {entry asLocalDeepCopy};
                errorHandlerBlock: [ :e | ('error on operation: ' , e asString) logCr ];
                newApplyPreviewLog;
                applyCodeChanges ]

"
Class {
	#name : #GtPharoLinkCodeSync,
	#superclass : #Object,
	#instVars : [
		'application',
		'events',
		'log'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Gt4PharoLink-CodeSync'
}

{ #category : #accessing }
GtPharoLinkCodeSync class >> default [

	^ default ifNil: [ 
		  default := self new
			             application: PharoLinkApplication withDefaultSettings;
			             log: EpMonitor current log;
			             yourself ]
]

{ #category : #accessing }
GtPharoLinkCodeSync class >> reset [

	default ifNotNil: #stop.
	default := nil
]

{ #category : #accessing }
GtPharoLinkCodeSync >> application [
	^ application
]

{ #category : #accessing }
GtPharoLinkCodeSync >> application: anPharoLinkApplication [
	application := anPharoLinkApplication
]

{ #category : #accessing }
GtPharoLinkCodeSync >> do: aBlockString with: anObject [

	| message promise |
	message := String streamContents: [ :stream | 
		           stream nextPutAll: '
						object := LanguageLinkUtils base64Decode: '''.
		           LanguageLinkUtils base64Encode: anObject to: stream.
		           stream
			           nextPutAll: ''' readStream.
						block := ';
			           nextPutAll: aBlockString;
			           nextPutAll: '.
						result := String streamContents: [ :stream |
							LanguageLinkUtils base64Encode: (block value: object) to: stream ].
						result' ].
	promise := application newCommandFactory send: message.
	promise transformBlock: [ :r | LanguageLinkUtils base64Decode: r readStream ].
	^ promise "waitForValue"
]

{ #category : #accessing }
GtPharoLinkCodeSync >> entryAdded: anEntryAddedEvent [
	anEntryAddedEvent entry content isCodeChange
		ifFalse: [ "only capture code changes" ^ self ].
	events nextPut: anEntryAddedEvent entry content.
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> flush [

	| buffer |
	application isRunning ifFalse: [ "nothing to send, if nothing connected" 
		^ self ].
	buffer := OrderedCollection new.
	events flush: [ :event | buffer add: event ].
	buffer ifEmpty: [ "nothing to send, ignore" ^ self ].
	self
		do: '[ :b | 
			b do: #applyCodeChange.
			true ]'
		with: buffer
]

{ #category : #accessing }
GtPharoLinkCodeSync >> flushAsync [
	[ self flush ] asAsyncFuture await
]

{ #category : #accessing }
GtPharoLinkCodeSync >> gtRemotePlayground: aView [

	<gtView>
	^ aView forward
		  title: 'Playground';
		  priority: 10;
		  object: [ application ];
		  view: #gtPlaygroundFor:
]

{ #category : #accessing }
GtPharoLinkCodeSync >> gtRemoteProperties: aView [
	<gtView>
	^ aView columnedList
		title: 'Properties';
		priority: 8;
		items: [ 
			| items |
			items := { 
				'Is running' -> self isRunning asString.
				'Server directory' -> application serverPath.
				'Working directory' -> application settings workingDirectory
				
				} asOrderedCollection. 
			self isRunning ifTrue: [
				items add: ('Changes file' ->
					(application newCommandFactory
						<< 'SourceFiles changesFileStream path asString';
						sendAndWait)).
				items add: ('Epicea log' ->
					  (application newCommandFactory
						   << 'EpMonitor current log store asString';
						   sendAndWait)) ].
			items ];
		  column: 'Name' text: #key width: 100;
		  column: 'Value' text: #value;
		send: #value
]

{ #category : #accessing }
GtPharoLinkCodeSync >> gtRemoteStatus: aView [

	<gtView>
	^ aView forward
		  title: 'Status';
		  priority: 9;
		  object: [ application ];
		  view: #gtStatusFor:
]

{ #category : #accessing }
GtPharoLinkCodeSync >> initialize [
	super initialize.
	events := WaitfreeQueue new
]

{ #category : #testing }
GtPharoLinkCodeSync >> isRunning [

	^ application
		  ifNil: [ false ]
		  ifNotNil: [ :theApp | theApp isRunning ]
]

{ #category : #accessing }
GtPharoLinkCodeSync >> log [
	^ log
]

{ #category : #accessing }
GtPharoLinkCodeSync >> log: anEpLog [
	log := anEpLog
]

{ #category : #accessing }
GtPharoLinkCodeSync >> runExamples: anExampleGroup [

	^ self
		  do: '[ :e |
					e runAll.
					e examples do: [ :f | f hasResult
						ifTrue: [ f result beSimplifiedExampleResultValue ] ].
					e ]'
		  with: anExampleGroup
]

{ #category : #accessing }
GtPharoLinkCodeSync >> runSearch: aFilter [

	^ self do: '[ :f | f result refreshItems ]' with: aFilter
]

{ #category : #accessing }
GtPharoLinkCodeSync >> runTests: aSuite [

	^ self do: '[ :e | e run ]' with: aSuite
]

{ #category : #accessing }
GtPharoLinkCodeSync >> start [

	log announcer when: EpEntryAdded send: #entryAdded: to: self.
	events flush.
	application start
]

{ #category : #accessing }
GtPharoLinkCodeSync >> stop [
	log announcer unsubscribe: self.
	events flush.
	application stop
]
