Class {
	#name : #GtRemotePhlowDataNode,
	#superclass : #Object,
	#instVars : [
		'targetObject',
		'nodeId',
		'nodeValue'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDataNode class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	The keys are Strings when the data was read from JSON, Symbols when it comes from #asDictionaryForExport in memory"

	^self new 
		nodeId: (aDictionary at: 'nodeId' ifAbsent: [ aDictionary at: #nodeId ifAbsent: [ nil ] ]);
		nodeValue: ((aDictionary at: 'nodeValue' ifAbsent: [ aDictionary at: #nodeValue ifAbsent: [ nil ] ])
			ifNotNil: [ :aNodeValueDictionary |
				self valueType fromJSONDictionary: aNodeValueDictionary ]);
		yourself
]

{ #category : #serialization }
GtRemotePhlowDataNode class >> replicationSpec [
	^#(#(#targetObject #forwarder))
]

{ #category : #accessing }
GtRemotePhlowDataNode class >> valueType [
	^ GtRemotePhlowItemValue
]

{ #category : #accessing }
GtRemotePhlowDataNode >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	
	data := Dictionary new 
		at: 'nodeId' put: self nodeId;
		at: 'nodeValue' put: self nodeValue asDictionaryForExport;
		yourself.
	
	^ data
]

{ #category : #accessing }
GtRemotePhlowDataNode >> createNodeIdentifier [
	^ GtRemotePhlowIndexNodeIdentifier new
			nodeIndex: self nodeId
]

{ #category : #accessing }
GtRemotePhlowDataNode >> createSelectionItem [
	^ GtRemotePhlowListingViewListSelectionItem new
			nodeIdentifier: self createNodeIdentifier
]

{ #category : #comparing }
GtRemotePhlowDataNode >> matchesNodeContentWith: aNode [
	self class = aNode class ifFalse: [ ^ false].
	
	^ (self nodeId = aNode nodeId) and: [
		self nodeValue = aNode nodeValue and: [
			self targetObject = aNode targetObject ] ] 
]

{ #category : #accessing }
GtRemotePhlowDataNode >> nodeId [
	^ nodeId
]

{ #category : #accessing }
GtRemotePhlowDataNode >> nodeId: anObject [
	nodeId := anObject
]

{ #category : #accessing }
GtRemotePhlowDataNode >> nodePath [
	^ Array with: self nodeId
]

{ #category : #accessing }
GtRemotePhlowDataNode >> nodeValue [
	^ nodeValue
]

{ #category : #accessing }
GtRemotePhlowDataNode >> nodeValue: anObject [
	nodeValue := anObject
]

{ #category : #accessing }
GtRemotePhlowDataNode >> targetObject [
	^ targetObject
]

{ #category : #accessing }
GtRemotePhlowDataNode >> targetObject: anObject [
	targetObject := anObject
]
