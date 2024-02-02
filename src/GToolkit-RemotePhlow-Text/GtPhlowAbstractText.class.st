Class {
	#name : #GtPhlowAbstractText,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Text'
}

{ #category : #attributes }
GtPhlowAbstractText >> addAttribute: aPhlowAttribute [
	 self  
	 	addAttribute: aPhlowAttribute 
	 	from: self startIndex
	 	to: self endIndex
]

{ #category : #attributes }
GtPhlowAbstractText >> addAttribute: aPhlowAttribute from: aStartIndex to: anEndIndex [ 
	self subclassResponsibility
]

{ #category : #accessing }
GtPhlowAbstractText >> endIndex [
	^ self subclassResponsibility
]

{ #category : #'api - text style' }
GtPhlowAbstractText >> fontSize: aNumber [
	self addAttribute: (GtPhlowFontSizeAttribute new 
		sizeValue: aNumber)
]

{ #category : #'api - text style' }
GtPhlowAbstractText >> foreground: aPhlowColor [
	self addAttribute: (GtPhlowTextForegroundAttribute new 
		color: aPhlowColor)
]

{ #category : #'test - accessing' }
GtPhlowAbstractText >> from: aStart to: anEnd [
	"Create and return a subtext of this text form aStart to anEnd."
	<return: #GtPhlowSubText>
	
	^ self subclassResponsibility
]

{ #category : #testing }
GtPhlowAbstractText >> isEmpty [
	^ self size = 0
]

{ #category : #testing }
GtPhlowAbstractText >> notEmpty [
	^ self isEmpty not
]

{ #category : #'test - accessing' }
GtPhlowAbstractText >> size [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtPhlowAbstractText >> startIndex [
	^ self subclassResponsibility
]
