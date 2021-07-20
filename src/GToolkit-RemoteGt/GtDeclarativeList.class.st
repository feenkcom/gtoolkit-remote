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
		'formattedItems'
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
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: formattedItems ].
	^dictionary
]

{ #category : 'accessing' }
GtDeclarativeList >> data [ 

	^ formattedItems
]

{ #category : 'accessing' }
GtDeclarativeList >> items [
	^ formattedItems ifNil: [ 
		(formattedItems isNil and: [ 
			self isWithLazyLoading ]) 
				ifTrue: [ 
					formattedItems := self retriveFormattedItems  ] ].

]

{ #category : 'accessing' }
GtDeclarativeList >> items: aCollection [
	formattedItems := aCollection
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

{ #category : 'building - graph' }
GtDeclarativeList >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list |

	list := aView list 
		title: title;
		priority: priority;
		items: [ self items ];
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ].
	^list
]
