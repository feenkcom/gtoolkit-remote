Extension { #name : 'GtPhlowDeclarativeColumnedListView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowDeclarativeColumnedListView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"
	| list column |

	list := aView columnedList 
		title: title;
		priority: priority;
		items: [ GtRemoteInspectorListingBufferedStream declarativeView: self ].
	columnTitles withIndexDo: [ :cTitle :aColumnIndex |
		| columnSpawnsObject |
		
		column := list column.
		column 
			title: cTitle.
		
		columnSpawnsObject := columnSpawnsObjects at: aColumnIndex.
		columnSpawnsObject
			ifTrue: [ 			
				(columnTypes at: aColumnIndex) = #icon 
					ifTrue: [
						column iconName: [ :anArray | anArray at: aColumnIndex ] ]
					ifFalse: [ 
						column
							text: [ :anArray | anArray at: aColumnIndex ]
							spawn: [ :anArray :aRowIndex | self retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex ] ] ]
			ifFalse: [
				(columnTypes at: aColumnIndex) = #icon 
					ifTrue: [
						column iconName: [ :anArray | anArray at: aColumnIndex ] ]
					ifFalse: [ 
						column text: [ :anArray | anArray at: aColumnIndex ] ].
					].
		
		(columnWidths at: aColumnIndex) ifNotNil: [ :width |
			column width: width ] ].
	list
		send: [ :arg :selection | 
			self retriveSentItemAt: selection first ].
	^ list
]
