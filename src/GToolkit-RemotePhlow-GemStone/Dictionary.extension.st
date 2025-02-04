Extension { #name : 'Dictionary' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
Dictionary >> gtDisplayOn: aStream [

	GtGemStoneRemotePhlowDictionaryPrinter
		displayStringFor: self 
		on: aStream
]
