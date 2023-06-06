Class {
	#name : #GtPhlowColor,
	#superclass : #Object,
	#instVars : [
		'name',
		'red',
		'green',
		'blue',
		'alpha'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #'instance creation' }
GtPhlowColor class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		named: (aDictionary at: #name ifAbsent: [ nil ]);
		r: (aDictionary at: #r ifAbsent: [ nil ])
			g: (aDictionary at: #g ifAbsent: [ nil ])
			b: (aDictionary at: #b ifAbsent: [ nil ])
			alpha: (aDictionary at: #a ifAbsent: [ nil ]);
		yourself
]

{ #category : #'instance creation' }
GtPhlowColor class >> named: aColorName [
	^ self new 
		named: aColorName
]

{ #category : #'instance creation' }
GtPhlowColor class >> named: aColorName alpha: anAlpha [
	^ self new 
		named: aColorName alpha: anAlpha
]

{ #category : #'instance creation' }
GtPhlowColor class >> r: r g: g b: b [ 
	^ self new 
		r: r g: g b: b alpha: nil
]

{ #category : #'instance creation' }
GtPhlowColor class >> r: r g: g b: b alpha: alpha [
	^ self new 
		r: r g: g b: b alpha: alpha
]

{ #category : #'accessing - defaults' }
GtPhlowColor class >> transparent [
	^ self named: #transparent
]

{ #category : #accessing }
GtPhlowColor >> asDictionaryForExport [
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		yourself.
		
	name ifNotNil: [ :aValue |
		data at: #name put: aValue ].
	red ifNotNil: [ :aValue |
		data at: #r put: aValue ].
	green ifNotNil: [ :aValue |
		data at: #g put: aValue ].
	blue ifNotNil: [ :aValue |
		data at: #b put: aValue ].
	alpha ifNotNil: [ :aValue |
		data at: #a put: aValue ].
	
	^ data
]

{ #category : #testing }
GtPhlowColor >> isTransparent [
	^ alpha = 0 or: [ name= #transparent ]
]

{ #category : #accessing }
GtPhlowColor >> named: aColorName [
	name := aColorName
]

{ #category : #accessing }
GtPhlowColor >> named: aColorName alpha: anAlpha [
	name := aColorName.
	alpha := anAlpha
]

{ #category : #printing }
GtPhlowColor >> printOn: aStream [
	super printOn: aStream.
	
	aStream parenthesize: [
		self isTransparent ifTrue: [ 
			^ aStream nextPutAll: 'transparent' ].
		name ifNotNil: [
			^ aStream nextPutAll: name ].
			
	aStream
		nextPutAll: ' r: ';
		print: red;
		nextPutAll: ' g: ';
		print: green;
		nextPutAll: ' b: ';
		print: blue;
		nextPutAll: ' alpha: ';
		print: alpha]
]

{ #category : #accessing }
GtPhlowColor >> r: r g: g b: b alpha: anAlpha [
	red := r.
	green := g.
	blue := b.
	alpha := anAlpha
]
