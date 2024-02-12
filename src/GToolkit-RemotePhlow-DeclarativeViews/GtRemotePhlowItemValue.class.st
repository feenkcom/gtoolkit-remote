Class {
	#name : #GtRemotePhlowItemValue,
	#superclass : #GtRemotePhlowNodeValue,
	#instVars : [
		'background',
		'itemText'
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
GtRemotePhlowItemValue class >> valueTypeFrom: aDictionary [ 
	^ (aDictionary 
		at: #valueTypeName 
		ifPresent: [ :aTypeName |
			| detectedType |
			"We do a manual check for the types that are by default in GT, 
			as it will be faster; this is called for every value in a table.
			If the type is not found we iterate subclasses ."
			detectedType := nil.
			aTypeName = GtRemotePhlowItemTextualValue valueTypeName
				ifTrue: [ detectedType := GtRemotePhlowItemTextualValue ].
			aTypeName = GtRemotePhlowItemErrorValue valueTypeName
				ifTrue: [ detectedType := GtRemotePhlowItemErrorValue ].
				
			detectedType ifNil: [
				GtRemotePhlowItemValue allSubclasses do: [ :aSubclass |
					aSubclass valueTypeName = aTypeName ifTrue: [ ^ aSubclass] ] ].
					
			GtRemotePhlowItemValue ]
		ifAbsent: [ GtRemotePhlowItemValue ])
]

{ #category : #accessing }
GtRemotePhlowItemValue class >> valueTypeName [
	^ 'item'
]

{ #category : #converting }
GtRemotePhlowItemValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data | 
	
	data := Dictionary new 
		at: #valueTypeName put: self class valueTypeName;
		yourself.
		
	"We check the attribute here instead of using the accessor,
	as subclasses can provide default value in case the background is nil"
	background ifNotNil: [ :aBackground |
		data at: #background put: aBackground asDictionaryForExport  ].
	
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

{ #category : #initialization }
GtRemotePhlowItemValue >> initializeFromJSONDictionary: aDictionary [
	aDictionary 
		at: #background 
		ifPresent: [ :aBackgroundValue |
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

{ #category : #printing }
GtRemotePhlowItemValue >> printOn: aStream [ 
	super printOn: aStream .
	
	aStream parenthesize: [
		self descriptionOn: aStream ]
]
