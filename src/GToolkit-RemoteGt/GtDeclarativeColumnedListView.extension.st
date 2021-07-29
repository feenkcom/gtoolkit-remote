Extension { #name : 'GtDeclarativeColumnedListView' }

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeColumnedListView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list column |

	list := aView lazyColumnedList 
		title: title;
		priority: priority;
		itemsProvider: [ self "phlowDataSource" ].
	columnTitles withIndexDo: [ :cTitle :index |
		column := list column.
		column 
			title: cTitle;
			item: [ :anArray | anArray at: index ].
		(columnWidths at: index) ifNotNil: [ :width |
			column width: width ] ].
	list
		send: [ :arg :selection | 
			self "phlowDataSource" retriveSentItemAt: selection first ].
	^list
]
