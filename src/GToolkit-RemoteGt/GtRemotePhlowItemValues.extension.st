Extension { #name : #GtRemotePhlowItemValues }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowItemValues class >> fromJSONDictionary: aDictionary [
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		itemText: (aDictionary at: #itemText);
		background: (aDictionary 
			at: #background 
			ifPresent: [ :aBackgroundValue |
				GtPhlowColor fromJSONDictionary: aBackgroundValue ]
			ifAbsent: [ nil ]);
		yourself
]
