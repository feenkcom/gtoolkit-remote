Class {
	#name : #GtRmMovieCollectionGemstoneImporter,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-MoviesDemo-GTSpecific'
}

{ #category : #accessing }
GtRmMovieCollectionGemstoneImporter >> currentInstance [
	^ (self gemStoneSession evaluateBlockAndWait: [
		GtRmMovieCollection defaultInstance ]) asGtBareProxyObject
]

{ #category : #accessing }
GtRmMovieCollectionGemstoneImporter >> gemStoneSession [
	^ GtGemStoneSessionRegistry default defaultSession
]

{ #category : #accessing }
GtRmMovieCollectionGemstoneImporter >> importFromCsvFile: aDataCsvFile [
	| fullData |
	
	fullData := aDataCsvFile readStreamDo: [ :aStream |
		(NeoCSVReader on: aStream)
			upToEnd ].
			
	self currentInstance
		initializeFromData: fullData copyWithoutFirst 
		propertyNames: fullData first.
		
	self gemStoneSession commitTransactionWithErrorChecking
]
