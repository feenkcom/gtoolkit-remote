Class {
	#name : #GtPhlowTextDecoration,
	#superclass : #Object,
	#instVars : [
		'thickness',
		'color',
		'styleName',
		'typeNames'
	],
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #'instance creation' }
GtPhlowTextDecoration class >> fromJSONDictionary: aTextAttributeData [ 
	^ self new
		initializeFromJSONDictionary: aTextAttributeData  
]

{ #category : #comparing }
GtPhlowTextDecoration >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
		
	^ color = anObject color
		and: [ styleName = anObject styleName
				and: [ thickness = anObject thickness 
					and: [ typeNames = anObject typeNames ]  ] ]
]

{ #category : #styling }
GtPhlowTextDecoration >> applyPropertiesTo: aBlTextDecorationAttribute [
	styleName ifNotNil: [
		aBlTextDecorationAttribute perform: styleName asSymbol ].
	typeNames do: [ :aTypeName | 
		aBlTextDecorationAttribute perform: aTypeName asSymbol ].
	color ifNotNil: [ :aColor |
		aBlTextDecorationAttribute color: aColor asColor ].
	thickness ifNotNil: [ :aNumber |
		aBlTextDecorationAttribute thickness: aNumber ].
]

{ #category : #converting }
GtPhlowTextDecoration >> asDictionaryForExport [
	| dictionaryForExport |
	dictionaryForExport := Dictionary new.
	
	dictionaryForExport
		at: 'styleName' put: self styleName;
		at: 'typeNames' put: self typeNames asArray.
		
	self color ifNotNil: [
		dictionaryForExport 
			at: 'color' 
			put: self color asDictionaryForExport ].
	self thickness ifNotNil: [
		dictionaryForExport 
			at: 'thickness' 
			put: self thickness ].
		
	^ dictionaryForExport
]

{ #category : #accessing }
GtPhlowTextDecoration >> color [
	^ color
]

{ #category : #accessing }
GtPhlowTextDecoration >> color: anObject [
	color := anObject
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> dashed [
	styleName := #dashed
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> dotted [
	styleName := #dotted
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> double [
	styleName := #double
]

{ #category : #'gt - extensions' }
GtPhlowTextDecoration >> gtPreviewFor: aView [
	<gtView>

	^ aView text
		title: 'Preview';
		priority: 1;
		text: [
			'Decoration' asRopedText
				fontSize: 20;
				decorationDo: [ :aTextDecorationAttribute | 
					self applyPropertiesTo: aTextDecorationAttribute ] ]
]

{ #category : #comparing }
GtPhlowTextDecoration >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ color hash
		bitXor: (styleName hash 
			bitXor: (thickness hash 
				bitXor: typeNames hash))
]

{ #category : #initialization }
GtPhlowTextDecoration >> initialize [
	super initialize.
	
	typeNames := Set new.
	self solid.
	thickness := 1.
]

{ #category : #initialization }
GtPhlowTextDecoration >> initializeFromJSONDictionary: aTextDecorationData [ 
	styleName := aTextDecorationData at: 'styleName'.
	typeNames := (aTextDecorationData at: 'typeNames') asSet.
	
	aTextDecorationData at: 'color' ifPresent: [ :aColorData |
		color := GtPhlowColor fromJSONDictionary: aColorData ].
	aTextDecorationData at: 'thickness' ifPresent: [ :aNumber |
		thickness := aNumber ].
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> solid [
	styleName := #solid
]

{ #category : #accessing }
GtPhlowTextDecoration >> styleName [
	^ styleName
]

{ #category : #accessing }
GtPhlowTextDecoration >> styleName: anObject [
	styleName := anObject
]

{ #category : #accessing }
GtPhlowTextDecoration >> thickness [
	^ thickness
]

{ #category : #accessing }
GtPhlowTextDecoration >> thickness: anObject [
	thickness := anObject
]

{ #category : #accessing }
GtPhlowTextDecoration >> typeNames [
	^ typeNames
]

{ #category : #accessing }
GtPhlowTextDecoration >> typeNames: anObject [
	typeNames := anObject
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> wavy [
	styleName := #wavy
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> withLineThrough [
	typeNames add: #lineThrough
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> withOverline [
	typeNames add: #overline
]

{ #category : #'api - decoration' }
GtPhlowTextDecoration >> withUnderline [
	typeNames add: #underline
]
