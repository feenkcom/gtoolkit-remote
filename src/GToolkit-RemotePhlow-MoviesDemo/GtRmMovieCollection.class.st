Class {
	#name : #GtRmMovieCollection,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'propertyNames'
	],
	#classVars : [
		'DEFAULT'
	],
	#category : #'GToolkit-RemotePhlow-MoviesDemo'
}

{ #category : #accessing }
GtRmMovieCollection class >> defaultInstance [
	^ DEFAULT ifNil: [
		DEFAULT := self new ]
]

{ #category : #'instance creation' }
GtRmMovieCollection class >> fromFullData: anArray [ 
	^ self new 
		initializeFromFullData: anArray 
]

{ #category : #'instance creation' }
GtRmMovieCollection class >> fromRawData: aRawData withProperties: aCollectionOfPropertyNames [
	^ self new 
		initializeFromData: aRawData
		propertyNames:aCollectionOfPropertyNames
]

{ #category : #accessing }
GtRmMovieCollection class >> resetDefaultInstance [
	DEFAULT := nil
]

{ #category : #accessing }
GtRmMovieCollection >> directors [
	^ self groupedByPropertyNamed: 'Directors'
]

{ #category : #accessing }
GtRmMovieCollection >> groupDataBy: aBlock [
	| groups |
	groups := Dictionary new.
	rawData do: [ :each |
		| key |
		key := aBlock value: each.
		key ifNotNil: [
		(groups 
			at: key
			ifAbsentPut: [ OrderedCollection new ]) add: each ] ].
	^ groups
]

{ #category : #accessing }
GtRmMovieCollection >> groupedByPropertyNamed: aPropertyName [ 
	^ ((self groupDataBy: [ :aRow | 
		self 
			propertyNamed: aPropertyName
			inData: aRow ]) asGPhlowAssociationsIterator retrieveAllItems
		collect: [ :assoc | 
			assoc key -> (self movieCollectionFrom: assoc value)])
		sort: [ :a :b | 
			a key asString < b key asString ]
]

{ #category : #'gt - extensions' }
GtRmMovieCollection >> gtViewDirectorsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Directors';
		priority: 20;
		items: [ self directors ];
		column: 'Director' text: [ :each | 
			each key  ];
		column: 'Count' text: [ :each | 
			each value size ];
		send: [ :each | each value ]
]

{ #category : #'gt - extensions' }
GtRmMovieCollection >> gtViewMoviesFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Movies';
		priority: 40;
		items: [ 1 to: self rawData size ];
		column: 'Title' text: [ :anIndex | 
			self 
				propertyNamed: 'Title' 
				atDataIndex: anIndex ];
		column: 'Release Date' text: [ :anIndex | 
			self 
				propertyNamed: 'Release Date' 
				atDataIndex: anIndex ];
		column: 'Directors' text: [ :anIndex |
			self 
				propertyNamed: 'Release Date' 
				atDataIndex: anIndex  ];
		column: 'Genres' text: [ :anIndex | 
			self 
				propertyNamed: 'Genres' 
				atDataIndex: anIndex ];
		send: [ :anIndex |
			self movieAtIndex: anIndex ]
]

{ #category : #'gt - extensions' }
GtRmMovieCollection >> gtViewMoviesWithDetailsFor: aView [
	<gtView>
	| currentView |
	
	currentView := aView columnedList 
		title: 'Movies with details';
		priority: 45;
		items: [ 1 to: self rawData size ].
		
	propertyNames do: [ :aPropertyName |
		currentView 
			column: aPropertyName 
			text: [ :anIndex |
				self 
					propertyNamed: aPropertyName
					atDataIndex: anIndex ] ].
	currentView send: [ :anIndex |
		self movieAtIndex: anIndex ].
	
	^ currentView
]

{ #category : #'gt - extensions' }
GtRmMovieCollection >> gtViewYearsFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Years';
		priority: 30;
		items: [ self years ];
		column: 'Year' text: [ :each | 
			each key  ];
		column: 'Count' text: [ :each | 
			each value size ];
		send: [ :each | each value ]
]

{ #category : #initialization }
GtRmMovieCollection >> initializeFromData: aRawData propertyNames: aCollectionOfPropertyNames [ 
	self
		rawData: aRawData;
		propertyNames:aCollectionOfPropertyNames
]

{ #category : #initialization }
GtRmMovieCollection >> initializeFromFullData: fullData [ 
	self 
		initializeFromData:  fullData copyWithoutFirst
		propertyNames: (fullData copyFrom: 1 to: fullData size + 1)
]

{ #category : #accessing }
GtRmMovieCollection >> movieAtIndex: anIndex [ 
	^ GtRmMovie 
		fromRawData: (rawData at: anIndex)
		withProperties: propertyNames
]

{ #category : #accessing }
GtRmMovieCollection >> movieCollectionFrom: aCollectionOfMoviesData [
	^ GtRmMovieCollection
		 fromRawData: aCollectionOfMoviesData 
		 withProperties: propertyNames 
]

{ #category : #'accessing - properties' }
GtRmMovieCollection >> propertyNamed: aPropertyName atDataIndex: anIndex [ 
	^ self 
		propertyNamed: aPropertyName 
		inData: (rawData at: anIndex).
]

{ #category : #'accessing - properties' }
GtRmMovieCollection >> propertyNamed: aPropertyName inData: aDataRow [
	^ aDataRow at: (propertyNames indexOf: aPropertyName)
]

{ #category : #accessing }
GtRmMovieCollection >> propertyNames [
	^ propertyNames
]

{ #category : #accessing }
GtRmMovieCollection >> propertyNames: aCollectionOfPropertyNames [
	propertyNames := aCollectionOfPropertyNames
]

{ #category : #accessing }
GtRmMovieCollection >> rawData [
	^ rawData
]

{ #category : #accessing }
GtRmMovieCollection >> rawData: anObject [
	rawData := anObject
]

{ #category : #accessing }
GtRmMovieCollection >> size [
	^ rawData size
]

{ #category : #accessing }
GtRmMovieCollection >> years [
	^ self groupedByPropertyNamed: 'Year'
]
