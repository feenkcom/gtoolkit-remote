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
	#name : 'GtPharoLinkCodeSync',
	#superclass : 'Object',
	#instVars : [
		'application',
		'events',
		'log'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Gt4PharoLink-CodeSync'
}

{ #category : 'accessing' }
GtPharoLinkCodeSync class >> default [
	^ default
		ifNil: [ default := self new
				application:
					(PharoLinkApplication withDefaultSettings
						debugMode: true;
						yourself);
				log: EpMonitor current log;
				yourself ]
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> application [
	^ application
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> application: anPharoLinkApplication [
	application := anPharoLinkApplication
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> base64Decode: aCharacterStream [

	| fuelStream |
	fuelStream := ReadWriteStream on: (ByteArray new: 100).
	Base64MimeConverter new
		mimeStream: aCharacterStream;
		dataStream: fuelStream;
		mimeDecodeToByteArray.
	^ FLMaterializer materializeFromByteArray: fuelStream contents
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> base64Encode: anObject to: aCharacterStream [

	| fuelStream |
	fuelStream := ReadWriteStream on: (ByteArray new: 100).
	FLSerializer serialize: anObject on: fuelStream.
	fuelStream reset.
	Base64MimeConverter mimeEncode: fuelStream to: aCharacterStream
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> do: aBlock with: anObject [

	| message result |
	message := String streamContents: [ :stream | 
		           stream nextPutAll: '
						object := GtPharoLinkCodeSync base64Decode: '''.
		           self base64Encode: anObject to: stream.
		           stream nextPutAll: ''' readStream.
						block := '.
		           aBlock printOn: stream.
		           stream nextPutAll: '.
						result := block value: object.
						String streamContents: [ :stream |
							GtPharoLinkCodeSync base64Encode: result to: stream ]' ].
	result := application newCommandFactory
		          << message;
		          sendAndWait.
	^ self base64Decode: result readStream
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> entryAdded: anEntryAddedEvent [
	anEntryAddedEvent entry content isCodeChange
		ifFalse: [ "only capture code changes" ^ self ].
	events nextPut: anEntryAddedEvent entry content.
	self flushAsync
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> flush [
	| message |
	application isRunning
		ifFalse: [ "nothing to send, if nothing connected" ^ self ].
	message := String
		streamContents: [ :stream | 
			events
				flush: [ :event | 
					stream nextPutAll: '(FLMaterializer materializeFromByteArray: '.
					(FLSerializer serializeToByteArray: event) storeOn: stream.
					stream
						nextPutAll: ') applyCodeChange.';
						nextPut: Character cr ] ].
	message ifEmpty: [ "nothing to send, ignore" ^ self ].
	application newCommandFactory
		<< message;
		sendAndWait
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> flushAsync [
	BlTktWorkerProvider nonUISinglePool
		schedule:
			([ self flush ] asBlTktCommand
				name: 'CodeSync flush';
				yourself)
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> gtRemotePlayground: aView [

	<gtView>
	^ aView forward
		  title: 'Playground';
		  priority: 10;
		  object: [ application ];
		  view: #gtPlaygroundFor:
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> gtRemoteProperties: aView [

	<gtView>
	application isRunning ifFalse: [ ^ aView empty ].
	^ aView columnedList
		  title: 'Properties';
		  priority: 8;
		  items: [ 
			  { 
				  { 
					  'Changes file'.
					  (application newCommandFactory
						   << 'SourceFiles changesFileStream path asString';
						   sendAndWait) }.
				  { 
					  'Epicea log'.
					  (application newCommandFactory
						   << 'EpMonitor current log store asString';
						   sendAndWait) } } ];
		  column: 'Name' item: #first width: 100;
		  column: 'Value' item: #second
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> gtRemoteStatus: aView [

	<gtView>
	^ aView forward
		  title: 'Status';
		  priority: 9;
		  object: [ application ];
		  view: #gtStatusFor:
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> initialize [
	super initialize.
	events := WaitfreeQueue new
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> log [
	^ log
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> log: anEpLog [
	log := anEpLog
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> start [

	log announcer when: EpEntryAdded send: #entryAdded: to: self.
	events flush.
	application start.
	"detach file log"
	application newCommandFactory
		<< '
	realChanges := SourceFiles changesFileStream path asFileReference.
	realSources := SourceFiles sourcesFileStream path asFileReference.
	virtualFs := FileSystem memory.
	virtualChanges := virtualFs workingDirectory / realChanges basename.
	realChanges copyTo: virtualChanges.
	SourceFiles close.
	SourceFiles changesFileStream: ((SourceFile
			  on: virtualChanges
			  potentialLocations: { virtualChanges parent })
			 tryOpenReadOnly: false;
			 yourself).
	SourceFiles sourcesFileStream: ((SourceFile
			  on: realSources
			  potentialLocations: { realSources parent })
			 tryOpenReadOnly: true;
			 yourself).
	EpMonitor current log initializeWith: OmMemoryStore new.
	"FIXME catchup seems to cause problems (CodeImporter fileStream: virtualChanges readStream)
		gtReduceToUnsavedChunks;
		evaluate."
	true';
		sendAndWait
]

{ #category : 'accessing' }
GtPharoLinkCodeSync >> stop [
	log announcer unsubscribe: self.
	events flush.
	application stop
]
