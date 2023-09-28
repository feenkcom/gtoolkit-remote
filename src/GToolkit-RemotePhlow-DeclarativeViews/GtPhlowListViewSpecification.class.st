"
{{gtClass:GtPhlowListViewSpecification}}  provides the data needed to instantiate a local {{gtClass:name=GtPhlowListView}} used to show the items in a remote list view.

The `phlowDataSource` for a list view should provide the following API:
	- `retrieveItems:fromIndex:` returns  the concrete data for displaying a number of items from a certain index
	- `retrieveSentItemAt:` returns a proxy to the item at the given position

When the remote side is Glamorous Toolkit, GemStone or Pharo, in the local instane of the specification `phlowDataSource` is a proxy to an instance of type {{gtClass:GtRemotePhlowDeclarativeViewListDataSource}}. When using the simulation we get directly an instance of type {{gtClass:GtRemotePhlowDeclarativeViewListDataSource}} as the data source.
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
