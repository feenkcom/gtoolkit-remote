Extension { #name : 'DoItChunk' }

{ #category : '*GToolkit-RemoteGt' }
DoItChunk >> gtIsQuit [

	| sanitized |
	sanitized := contents trimLeft: [ :c | 
		             c == Character null or: [ c == Character cr ] ].
	^ sanitized beginsWith: '----QUIT'
]

{ #category : '*GToolkit-RemoteGt' }
DoItChunk >> gtIsSnapshot [

	| sanitized |
	sanitized := contents trimLeft: [ :c | 
		             c == Character null or: [ c == Character cr ] ].
	^ sanitized beginsWith: '----SNAPSHOT----'
]
