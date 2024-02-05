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

{ #category : #accessing }
GtPhlowText >> endIndex [
	^ self subclassResponsibility
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

{ #category : #testing }
GtPhlowText >> isEmpty [
	^ self size = 0
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
