"
{{gtClass:GtPhlowListViewSpecification}} supports a subset of the possible configurations of {{gtClass:name=GtPhlowListView}}.

 
#Internal Representation and Key Implementation Points.


##Instance Variables

	items:		{{gtClass:Array}} - The formatted items to display (not the raw values held in the list)


##Implementation Points


"
Class {
	#name : #GtPhlowListViewSpecification,
	#superclass : #GtPhlowListingViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'instance creation' }
GtPhlowListViewSpecification class >> fromJSONDictionary: aDictionary [
	| list |

	list := super fromJSONDictionary: aDictionary.
	"list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ]."
	^list
]

{ #category : #converting }
GtPhlowListViewSpecification >> asDictionaryForExport [ 

	| dictionary |

	dictionary := super asDictionaryForExport.
	"self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self retriveFormattedItems ]."
	^dictionary
]
