Extension { #name : 'GtPhlowTreeView' }

{ #category : '*GToolkit-RemoteGt' }
GtPhlowTreeView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtDeclarativeTree new 
		title: self title;
		priority: self priority;
		items: (Array streamContents: [ :stream |
			itemsBuilder value doWithIndex: [ :item :i |
				self gtDeclarativeViewAdd: item index: { i } to: stream ] ]);
		dataTransport: GtDeclarativeView dataIncluded.

]

{ #category : '*GToolkit-RemoteGt' }
GtPhlowTreeView >> gtDeclarativeViewAdd: item index: anArray to: stream [
	"Add the supplied item and its children to the stream"

	stream nextPut: { 
		(itemTextBlock value: item) asString. 
		anArray.
		Array streamContents: [ :childStream | 
			(childrenBuilder value: item) doWithIndex: [ :child :i |
				self gtDeclarativeViewAdd: child index: anArray, { i } to: childStream ] ] }
]
