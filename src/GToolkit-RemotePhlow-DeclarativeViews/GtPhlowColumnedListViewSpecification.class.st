"
GtDeclarativeColumnedList supports a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported

# Internal Representation and Key Implementation Points.


## Instance Variables

	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send


"
Class {
	#name : #GtPhlowColumnedListViewSpecification,
	#superclass : #GtPhlowBasicColumnedViewSpecification,
	#instVars : [
		'horizontalScrollingEnabled'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowColumnedListViewSpecification class >> fromJSONDictionary: aDictionary [
	^ (super fromJSONDictionary: aDictionary)
		horizontalScrollingEnabled: (aDictionary 
			at: 'horizontalScrollingEnabled' 
			ifAbsent: [ nil ])
]

{ #category : #converting }
GtPhlowColumnedListViewSpecification >> asDictionaryForExport [ 
	^ super asDictionaryForExport 
		at: 'horizontalScrollingEnabled' put: horizontalScrollingEnabled;
		yourself
]

{ #category : #accessing }
GtPhlowColumnedListViewSpecification >> horizontalScrollingEnabled [
	^ horizontalScrollingEnabled
]

{ #category : #accessing }
GtPhlowColumnedListViewSpecification >> horizontalScrollingEnabled: aBoolean [
	horizontalScrollingEnabled := aBoolean
]

{ #category : #accessing }
GtPhlowColumnedListViewSpecification >> isHorizontalScrollingEnabled [
	^ self horizontalScrollingEnabled ifNil: [ false ]
]
