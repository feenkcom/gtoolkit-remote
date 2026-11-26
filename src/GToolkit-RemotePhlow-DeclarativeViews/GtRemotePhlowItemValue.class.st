Class {
	#name : #GtRemotePhlowItemValue,
	#superclass : #GtRemotePhlowNodeValue,
	#instVars : [
		'background'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowItemValue class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."
	| valueClass |

	valueClass := self valueTypeFrom: aDictionary.
		
	^ valueClass new
		initializeFromJSONDictionary: aDictionary
]

{ #category : #'instance creation' }
GtRemotePhlowItemValue class >> mySubclasses [
	"LW hook"
	^self allSubclasses
]

{ #category : #'instance creation' }
GtRemotePhlowItemValue class >> valueTypeFrom: aDictionary [
	"The keys are Strings when the data was read from JSON, Symbols when it comes from #asDictionaryForExport in memory.
	The type name comes from the other side: compare it by content, it can be a String or a Symbol"
	^(aDictionary at: 'valueTypeName' ifAbsent: [ aDictionary at: #valueTypeName ifAbsent: [ nil ] ])
		ifNotNil: 
			[:aTypeName |
			"We do a manual check for the types that are by default in GT, 
			as it will be faster; this is called for every value in a table.
			If the type is not found we iterate subclasses ."
			| detectedType |
			detectedType := nil.
			(GtRemotePhlowItemTextualValue valueTypeName sameContentAs: aTypeName)
				ifTrue: [detectedType := GtRemotePhlowItemTextualValue].
			(GtRemotePhlowItemErrorValue valueTypeName sameContentAs: aTypeName)
				ifTrue: [detectedType := GtRemotePhlowItemErrorValue].
			detectedType ifNotNil: [^detectedType].
			GtRemotePhlowItemValue mySubclasses
				do: [:aSubclass | (aSubclass valueTypeName sameContentAs: aTypeName) ifTrue: [^aSubclass]].
			GtRemotePhlowItemValue]
		ifNil: [GtRemotePhlowItemValue]
]

{ #category : #accessing }
GtRemotePhlowItemValue class >> valueTypeName [
	^ 'item'
]

{ #category : #comparing }
GtRemotePhlowItemValue >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	
	^ self background = anObject background
]

{ #category : #converting }
GtRemotePhlowItemValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data | 
	
	data := Dictionary new 
		at: 'valueTypeName' put: self class valueTypeName;
		at: '__typeName' put: self class name;
		yourself.
		
	"We check the attribute here instead of using the accessor,
	as subclasses can provide default value in case the background is nil"
	background ifNotNil: [ :aBackground |
		data at: 'background' put: aBackground asDictionaryForExport  ].
	
	^ data
]

{ #category : #accessing }
GtRemotePhlowItemValue >> background [
	^ background
]

{ #category : #accessing }
GtRemotePhlowItemValue >> background: anObject [
	background := anObject
]

{ #category : #printing }
GtRemotePhlowItemValue >> descriptionOn: aStream [ 
	self printBackgroundOn: aStream.
]

{ #category : #comparing }
GtRemotePhlowItemValue >> hash [ 
	^ 31 hash bitXor: self background hash
]

{ #category : #initialization }
GtRemotePhlowItemValue >> initializeFromJSONDictionary: aDictionary [
	"The keys are Strings when the data was read from JSON, Symbols when it comes from #asDictionaryForExport in memory"
	(aDictionary at: 'background' ifAbsent: [ aDictionary at: #background ifAbsent: [ nil ] ])
		ifNotNil: [ :aBackgroundValue |
			self background: (GtPhlowColor fromJSONDictionary: aBackgroundValue) ]
]

{ #category : #testing }
GtRemotePhlowItemValue >> isErrorItemValue [
	^ false
]

{ #category : #printing }
GtRemotePhlowItemValue >> printBackgroundOn: aStream [ 
	self background ifNotNil: [ :aBackground |
		aStream 
			<< ', background: ';
			print: aBackground ]
]
