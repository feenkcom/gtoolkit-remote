Extension { #name : 'GtPhlowDeclarativeColumnedListView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowDeclarativeColumnedListView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	| list column |

	list := aView columnedList 
		title: title;
		priority: priority;
		items: [ GtRemoteInspectorListingBufferedStream declarativeView: self ].
	columnTitles withIndexDo: [ :cTitle :index |
		column := list column.
		column 
			title: cTitle.
		(columnTypes at: index) = #icon 
			ifTrue: [
				column iconName: [ :anArray | anArray at: index ] ]
			ifFalse: [ 
				column text: [ :anArray | anArray at: index ] ].
		(columnWidths at: index) ifNotNil: [ :width |
			column width: width ] ].
	list
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ].
	^list
]
