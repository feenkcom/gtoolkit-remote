Class {
	#name : #GtPhlowButtonActionSpecification,
	#superclass : #GtPhlowActionSpecification,
	#instVars : [
		'label'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeActions'
}

{ #category : #accessing }
GtPhlowButtonActionSpecification class >> typeLabel [
	^ 'buttonAction'
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> asDictionaryForExport [
	^ super asDictionaryForExport
		at: 'label' put: label;
		yourself
]

{ #category : #initialization }
GtPhlowButtonActionSpecification >> initializeFromInspector: anInspector [
	self phlowDataSource ifNil: [
		self phlowDataSource: (anInspector 
			getDeclarativeActionDataSourceFor: self methodSelector) ]
]

{ #category : #initialization }
GtPhlowButtonActionSpecification >> initializeFromJSONDictionary: aDictionary [
	super initializeFromJSONDictionary: aDictionary.
	
	self
		label: (aDictionary at: 'label' ifAbsent: [ nil ])
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> label [
	^ label
]

{ #category : #accessing }
GtPhlowButtonActionSpecification >> label: aLabel [
	label := aLabel
]
