Extension { #name : #GtRmMovieCollection }

{ #category : #'*GToolkit-RemotePhlow-MoviesDemo-GTSpecific' }
GtRmMovieCollection class >> basicData [
	| dataFile fullData |
	dataFile := FileLocator gtResource 
		/ 'feenkcom' 
		/ 'gtoolkit-demos' 
		/ 'data' 
		/ 'imdb' 
		/ 'Movies.csv'.
		
	fullData := dataFile readStreamDo: [ :aStream |
		(NeoCSVReader on: aStream)
			upToEnd ].
	
	^ fullData first: 10
]

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
