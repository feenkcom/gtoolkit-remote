"
Remote phlow version of GtObjectComparer. Compares objects by inspecting their instance slots.
"
Class {
	#name : #GtRemotePhlowObjectComparer,
	#superclass : #Object,
	#instVars : [
		'parent',
		'values',
		'label'
	],
	#category : #'GToolkit-RemotePhlow-ObjectComparer'
}

{ #category : #'instance creation' }
GtRemotePhlowObjectComparer class >> compareAll: aCollection [
	| comparerValues |
	comparerValues := aCollection
		collect: [ :each | GtRemotePhlowObjectComparerObjectValue new object: each ].
	^ self new
		values: comparerValues
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> childComparers [
	| slotNames |
	slotNames := ((values select: [ :o | o hasValue ])
		flatCollectAsSet: [ :each | each value class allInstVarNames ])
		asSortedCollection.
	^ slotNames
		collect: [ :eachSlotName | 
			| slotValues |
			slotValues := values
				collect: [ :eachValue | 
					(eachValue class ~= GtRemotePhlowObjectComparerNoValue
						and: [ eachValue value class allInstVarNames includes: eachSlotName ])
						ifTrue: [ GtRemotePhlowObjectComparerSlotValue new
								object: eachValue object;
								slotName: eachSlotName;
								value: (eachValue value instVarNamed: eachSlotName) ]
						ifFalse: [ GtRemotePhlowObjectComparerNoValue new object: eachValue object ] ].
			GtRemotePhlowObjectComparer new
				parent: self;
				values: slotValues;
				label: eachSlotName;
				yourself ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowObjectComparer >> gtComparersFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Comparers';
		items: [ self childComparers ];
		column: 'Label' text: [ :each | each label ] width: 150;
		column: 'Values' text: [ :each | (each values collect: [ :v | v textForValue ]) asArray printString ]
]

{ #category : #'gt - extensions' }
GtRemotePhlowObjectComparer >> gtValuesFor: aView [
	<gtView>
	values ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Values';
		items: [ values ];
		column: 'Value' text: [ :each | each textForValue ];
		column: 'Object' text: [ :each | each object printString ]
]

{ #category : #testing }
GtRemotePhlowObjectComparer >> hasDifferences [
	^ values notEmpty and: [ values anySatisfy: [ :each | each value ~= values first value ] ]
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> label [
	^ label ifNil: [ 'object' ]
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> label: aString [
	label := aString
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> parent [
	^ parent
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> parent: anObject [
	parent := anObject
]

{ #category : #printing }
GtRemotePhlowObjectComparer >> printOn: aStream [
	aStream
		nextPutAll: self label;
		nextPutAll: ' (';
		print: self values size;
		nextPutAll: ' values)'
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> textForValueFrom: aComparer ofObject: anObject [
	| aValue index |
	index := self values indexOf: anObject.
	aValue := aComparer values at: index.
	^ aValue textForValue
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> values [
	^ values ifNil: [ #() ]
]

{ #category : #accessing }
GtRemotePhlowObjectComparer >> values: aCollection [
	values := aCollection asArray
]
