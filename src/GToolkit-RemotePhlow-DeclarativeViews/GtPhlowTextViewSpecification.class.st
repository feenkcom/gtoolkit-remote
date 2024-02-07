Class {
	#name : #GtPhlowTextViewSpecification,
	#superclass : #GtPhlowTextualViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowTextViewSpecification class >> fromJSONDictionary: aDictionary [
	| textViewSpecification |
	
	textViewSpecification := super fromJSONDictionary: aDictionary.
	
	textViewSpecification dataTransport = self dataLazy
		ifTrue: [ 
			(aDictionary includesKey: 'dataSource') ifTrue: [
				textViewSpecification phlowDataSource: (aDictionary at: 'dataSource')] ].
	
	^ textViewSpecification
]
