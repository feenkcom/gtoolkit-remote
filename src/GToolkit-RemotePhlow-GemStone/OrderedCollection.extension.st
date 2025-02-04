Extension { #name : 'OrderedCollection' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
OrderedCollection >> gtDisplayOn: aStream [

	GtGemStoneRemotePhlowCollectionPrinter
		displayStringFor: self 
		on: aStream
]
