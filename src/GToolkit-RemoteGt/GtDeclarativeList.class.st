"
GtDeclarativeList supports a subset of the possible configurations of ${class:name=GtPhlowListView}.

 
1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables

	items:		<Array> - The formatted items to display (not the raw values held in the list)


1. ## Implementation Points


"
Class {
	#name : 'GtDeclarativeList',
	#superclass : 'GtDeclarativeView',
	#instVars : [
		'totalItemsCount'
	],
	#category : 'GToolkit-RemoteGt-Declarative Views'
}

{ #category : 'instance creation' }
GtDeclarativeList class >> fromJSONDictionary: aDictionary [
	| list |

	list := super fromJSONDictionary: aDictionary.
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
]

{ #category : 'converting' }
GtDeclarativeList >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	"self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self retriveFormattedItems ]."
	^dictionary
]

{ #category : 'api - accessing' }
GtDeclarativeList >> retrieveItemsFromIndex: anIndex [		
	(GtLoadItemsStackSignal new
		startIndex: anIndex;
		chunkSize: 1000) emit.
	
	^ self accessor 
		retrieveItemsCount: 100
		fromIndex: anIndex 
		forViewSelector: self methodName
]

{ #category : 'accessing' }
GtDeclarativeList >> retrieveTotalItemsCount [
	^ self accessor
		retrieveTotalItemsCountForViewSelector: self methodName
]

{ #category : 'accessing' }
GtDeclarativeList >> retriveFormattedItems [
	^ self accessor 
			retriveFormattedItemsForViewSelector: self methodName
]

{ #category : 'accessing' }
GtDeclarativeList >> retriveSentItemAt: aSelectionIndex [
	^  self accessor 
			retriveSentItemForViewSelector: self methodName
			atIndex: aSelectionIndex
]

{ #category : 'accessing' }
GtDeclarativeList >> sentItemAt: selection [ 
	"Answer the raw value at the supplied index"

	^ accessor itemsBuilder value at: selection.
]

{ #category : 'accessing' }
GtDeclarativeList >> totalItemsCount [
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self retrieveTotalItemsCount ]
]

{ #category : 'building - graph' }
GtDeclarativeList >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView lazyList 
		title: title;
		priority: priority;
		itemsProvider: [ self ];
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ].
	^list
]
