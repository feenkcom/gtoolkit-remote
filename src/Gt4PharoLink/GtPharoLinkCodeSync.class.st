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
		'statements'
	],
	#category : 'Gt4PharoLink-CodeSync'
}

{ #category : #accessing }
GtPharoLinkCodeSync >> flush [
	| message |
	application isRunning
		ifFalse: [ "nothing to send, if nothing connected" ^ self ].
	message := String
		streamContents: [ :stream | 
			statements
				flush: [ :statement | 
					stream
						nextPutAll: statement;
						nextPut: Character cr ] ].
	message ifEmpty: [ "nothing to send, ignore" ^ self ].
	application newCommandFactory
		<< message;
		sendAndWait
]

{ #category : #accessing }
GtPharoLinkCodeSync >> flushAsync [
	BlTktWorkerProvider nonUISinglePool
		schedule:
			([ self flush ] asBlTktCommand
				name: 'CodeSync flush';
				yourself)
]

{ #category : #accessing }
GtPharoLinkCodeSync >> initialize [
	super initialize.
	application := PharoLinkApplication withDefaultSettings.
	application debugMode: true.
	statements := WaitfreeQueue new
]

{ #category : #accessing }
GtPharoLinkCodeSync >> start [
	statements flush.
	SystemAnnouncer uniqueInstance
		when: ClassAdded
		send: #whenClassAdded:
		to: self;
		when: ClassCommented
		send: #whenClassCommented:
		to: self;
		when: ClassModificationApplied
		send: #whenClassModificationApplied:
		to: self;
		when: ClassModifiedClassDefinition
		send: #whenClassModifiedClassDefinition:
		to: self;
		when: ClassRecategorized
		send: #whenClassRecategorized:
		to: self;
		when: ClassRenamed
		send: #whenClassRenamed:
		to: self;
		when: MethodModified
		send: #whenMethodModified:
		to: self;
		when: MethodRecategorized
		send: #whenMethodRecategorized:
		to: self;
		when: MethodRemoved
		send: #whenMethodRemoved:
		to: self;
		when: CategoryAdded
		send: #whenCategoryAdded:
		to: self;
		when: CategoryRemoved
		send: #whenCategoryRemoved:
		to: self;
		when: CategoryRenamed
		send: #whenCategoryRenamed:
		to: self;
		when: ProtocolAdded
		send: #whenProtocolAdded:
		to: self;
		when: ProtocolRemoved
		send: #whenProtocolRemoved:
		to: self;
		when: ProtocolRenamed
		send: #whenProtocolRenamed:
		to: self.
	application start
]

{ #category : #accessing }
GtPharoLinkCodeSync >> stop [
	SystemAnnouncer uniqueInstance unsubscribe: self.
	statements flush.
	application stop.
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenCategoryAdded: aCategoryAdded [
	statements
		nextPut:
			('SystemOrganizer default addCategory: {1}.'
				format: {aCategoryAdded categoryName storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenCategoryRemoved: aCategoryRemoved [
	statements
		nextPut:
			('SystemOrganizer default removeCategory: {1}.'
				format: {aCategoryRemoved categoryName storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenCategoryRenamed: aCategoryRenamed [
	statements
		nextPut:
			('SystemOrganizer default renameCategory: {1} toBe: {2}.'
				format:
					{aCategoryRenamed oldCategoryName storeString.
					aCategoryRenamed newCategoryName storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassAdded: aClassAdded [
	statements
		nextPut:
			('Class compiler evaluate: {1}; evaluate: {2}.'
				format:
					{aClassAdded classAdded definitionSource storeString.
					aClassAdded classAdded classSide definitionSource storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassCommented: aClassCommented [
	statements
		nextPut:
			('{1} classComment: {2} stamp: {3}.'
				format:
					{aClassCommented classCommented name.
					aClassCommented newComment storeString.
					aClassCommented newStamp storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassModificationApplied: aClassModificationApplied [
	statements
		nextPut:
			('Class compiler evaluate: {1}; evaluate: {2}.'
				format:
					{aClassModificationApplied classAffected definitionSource
						storeString.
					aClassModificationApplied classAffected classSide
						definitionSource storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassModifiedClassDefinition: aClassModifiedClassDefinition [
	statements
		nextPut:
			('Class compiler evaluate: {1}; evaluate: {2}.'
				format:
					{aClassModifiedClassDefinition newClassDefinition definitionSource
						storeString.
					aClassModifiedClassDefinition newClassDefinition classSide
						definitionSource storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassRecategorized: aClassRecategorized [
	statements
		nextPut:
			('{1} category: {2}.'
				format:
					{aClassRecategorized classRecategorized name.
					aClassRecategorized newCategory storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassRemoved: aClassRemoved [
	statements
		nextPut:
			('{1} removeFromSystem.' format: {aClassRemoved classRemoved name}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenClassRenamed: aClassRenamed [
	statements
		nextPut:
			('{1} rename: {2}.'
				format:
					{aClassRenamed classRenamed name.
					aClassRenamed newName storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenMethodAdded: aMethodAdded [
	statements
		nextPut:
			('{1} compile: {2} classified: {3}.'
				format:
					{aMethodAdded methodAdded origin name.
					aMethodAdded methodAdded sourceCode storeString.
					aMethodAdded methodAdded protocol storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenMethodModified: aMethodModified [
	statements
		nextPut:
			('{1} compile: {2} classified: {3}.'
				format:
					{aMethodModified newMethod origin name.
					aMethodModified newMethod sourceCode storeString.
					aMethodModified newMethod protocol storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenMethodRecategorized: aMethodRecategorized [
	statements
		nextPut:
			('{1} organization classify: {2} under: {3}.'
				format:
					{aMethodRecategorized methodRecategorized origin name.
					aMethodRecategorized methodRecategorized selector storeString.
					aMethodRecategorized newProtocol storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenMethodRemoved: aMethodRemoved [
	statements
		nextPut:
			('{1} removeSelector: {2}.'
				format:
					{aMethodRemoved methodRemoved origin name.
					aMethodRemoved methodRemoved selector storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenProtocolAdded: aProtocolAdded [
	statements
		nextPut:
			('{1} organization addCategory: {2}.'
				format:
					{aProtocolAdded classReorganized name.
					aProtocolAdded protocol storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenProtocolRemoved: aProtocolRemoved [
	statements
		nextPut:
			('{1} organization removeCategory: {2}.'
				format:
					{aProtocolRemoved classReorganized name.
					aProtocolRemoved protocol storeString}).
	self flushAsync
]

{ #category : #accessing }
GtPharoLinkCodeSync >> whenProtocolRenamed: aProtocolRenamed [
	statements
		nextPut:
			('{1} organization renameCategory: {2} toBe: {3}.'
				format:
					{aProtocolRenamed classReorganized name.
					aProtocolRenamed oldProtocolName storeString.
					aProtocolRenamed newProtocolName storeString}).
	self flushAsync
]
