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
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		nodeId: (aDictionary at: #nodeId ifAbsent: [ nil ]);
		nodeValue: (aDictionary 
			at: #nodeValue 
			ifPresent: [ :aNodeValueDictionary |
				self valueType fromJSONDictionary: aNodeValueDictionary ]
			ifAbsent: [ nil ]);
		yourself
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
		at: #nodeId put: self nodeId;
		at: #nodeValue put: self nodeValue asDictionaryForExport;
		yourself.
	
	^ data
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
