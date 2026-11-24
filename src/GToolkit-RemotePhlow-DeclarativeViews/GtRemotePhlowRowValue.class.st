Class {
	#name : #GtRemotePhlowRowValue,
	#superclass : #GtRemotePhlowNodeValue,
	#instVars : [
		'columnValues'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtRemotePhlowRowValue class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary.
	The keys are Strings when the data was read from JSON, Symbols when it comes from #asDictionaryForExport in memory"

	^self new 
		columnValues: ((aDictionary at: 'columnValues' ifAbsent: [ aDictionary at: #columnValues ifAbsent: [ nil ] ])
			ifNotNil: [ :aCollection |
				aCollection collect: [ :anItemValueDictionary |
					GtRemotePhlowItemValue fromJSONDictionary: anItemValueDictionary ] ]);
		yourself
]

{ #category : #comparing }
GtRemotePhlowRowValue >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	
	^ self columnValues = anObject columnValues
]

{ #category : #converting }
GtRemotePhlowRowValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		at: 'columnValues' put: (self columnValues 
			collect: [ :aColumnValue | aColumnValue asDictionaryForExport ]);
		yourself.
	
	^ data
]

{ #category : #accessing }
GtRemotePhlowRowValue >> columnValueAt: anIndex [
	^ self columnValues at: anIndex
]

{ #category : #accessing }
GtRemotePhlowRowValue >> columnValues [
	^ columnValues
]

{ #category : #accessing }
GtRemotePhlowRowValue >> columnValues: anObject [
	columnValues := anObject
]

{ #category : #printing }
GtRemotePhlowRowValue >> descriptionOn: aStream [ 
	aStream 
		print: self columnValues size;
		<< ' columns'
]

{ #category : #'gt - extensions' }
GtRemotePhlowRowValue >> gtViewColumnValuesFor: aView [
	<gtView>
	
	^ aView list
		title: 'Column Values';
		priority: 10;
		items: [ self columnValues]
]

{ #category : #comparing }
GtRemotePhlowRowValue >> hash [ 
	^ self columnValues hash
]
