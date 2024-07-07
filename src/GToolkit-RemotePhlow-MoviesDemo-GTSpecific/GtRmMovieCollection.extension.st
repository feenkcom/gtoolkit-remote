Extension { #name : #GtRmMovieCollection }

{ #category : #'*GToolkit-RemotePhlow-MoviesDemo-GTSpecific' }
GtRmMovieCollection class >> fromDataFile: aFile [
	| fullData |
	fullData := aFile readStreamDo: [ :aStream |
		(NeoCSVReader on: aStream)
		upToEnd ].
		
	^ self 
		fromRawData:  fullData copyWithoutFirst
		withProperties: fullData first
]
