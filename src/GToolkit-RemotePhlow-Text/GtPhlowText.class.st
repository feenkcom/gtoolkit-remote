Class {
	#name : #GtPhlowText,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #accessing }
GtPhlowText class >> forString: aString [
	^ GtPhlowRunBasedText new 
		initializeWithString: aString
]

{ #category : #attributes }
GtPhlowText >> addAttribute: aPhlowAttribute [
	 self  
	 	addAttribute: aPhlowAttribute 
	 	from: self startIndex
	 	to: self endIndex
]

{ #category : #attributes }
GtPhlowText >> addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex [ 
	self subclassResponsibility
]

{ #category : #'api - text style' }
GtPhlowText >> bold [
	^ self addAttribute: GtPhlowFontWeightAttribute bold
]

{ #category : #accessing }
GtPhlowText >> endIndex [
	^ self subclassResponsibility
]

{ #category : #'api - text style' }
GtPhlowText >> fontName: aName [
	self addAttribute: (GtPhlowFontNameAttribute new 
		fontName: aName)
]

{ #category : #'api - text style' }
GtPhlowText >> fontSize: aNumber [
	self addAttribute: (GtPhlowFontSizeAttribute new 
		sizeValue: aNumber)
]

{ #category : #'api - text style' }
GtPhlowText >> foreground: aPhlowColor [
	self addAttribute: (GtPhlowTextForegroundAttribute new 
		color: aPhlowColor)
]

{ #category : #'test - accessing' }
GtPhlowText >> from: aStart to: anEnd [
	"Create and return a subtext of this text form aStart to anEnd."
	<return: #GtPhlowSubText>
	
	^ self subclassResponsibility
]

{ #category : #'api - text style' }
GtPhlowText >> glamorousCodeFont [
	self fontName: 'Source Code Pro'
]

{ #category : #'api - text style' }
GtPhlowText >> glamorousRegularFont [
	self fontName: 'Source Sans Pro'
]

{ #category : #'gt - extensions' }
GtPhlowText >> gtDisplayText [
	^ self asRopedText
]

{ #category : #'gt - extensions' }
GtPhlowText >> gtStringFor: aView [
	<gtView>
	self isEmpty ifTrue: [ ^ aView empty ].
	
	^ aView forward 
		title: 'String';
		priority: 5;
		object: [ self asString ];
		view: #gtStringFor:
]

{ #category : #'gt - extensions' }
GtPhlowText >> gtTextFor: aView [
	<gtView>
	
	^ aView text
		title: 'Text';
		priority: 2;
		text: [ self ]
]

{ #category : #'api - text style' }
GtPhlowText >> highlight: aColor [
	self addAttribute: (GtPhlowTextHighlightAttribute new 
		color: aColor)
]

{ #category : #testing }
GtPhlowText >> isEmpty [
	^ self size = 0
]

{ #category : #'api - text style' }
GtPhlowText >> italic [
	^ self addAttribute: GtPhlowFontEmphasisAttribute italic
]

{ #category : #testing }
GtPhlowText >> notEmpty [
	^ self isEmpty not
]

{ #category : #'test - accessing' }
GtPhlowText >> size [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtPhlowText >> startIndex [
	^ self subclassResponsibility
]

{ #category : #'api - text style' }
GtPhlowText >> thin [
	^ self addAttribute: GtPhlowFontWeightAttribute thin
]
