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
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		columnValues: (aDictionary 
			at: #columnValues 
			ifPresent: [ :aCollection |
				aCollection collect: [ :anItemValueDictionary |
					GtRemotePhlowItemValue fromJSONDictionary: anItemValueDictionary ] ]
			ifAbsent: [ nil ]);
		yourself
]

{ #category : #converting }
GtRemotePhlowRowValue >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		at: #columnValues put: (self columnValues 
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

{ #category : #accessing }
GtRemotePhlowRowValue >> nodeValue [
	"Temporary hack"
	^ self
]
