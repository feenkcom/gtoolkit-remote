Extension { #name : 'GtRemotePhlowViewedObject' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowViewedObject >> addRawSelfNodeTo: variableNodes [

	^ self "TBS"
]

{ #category : '*GToolkit-RemotePhlow-Gemstone' }
GtRemotePhlowViewedObject class >> new [

	^ super new initialize
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
GtRemotePhlowViewedObject >> rawViewData [
	"Answer the data for the raw view"
	| "icon name value" instVarNames indexedVarsSize |


	"GemStone doesn't have GTInspectorSelfNode.  The call to #addRawSelfNodeTo: will allow the platform specific code to be added.
	variableNodes add: (GTInspectorSelfNode hostObject: object)."

    instVarNames := object class allInstVarNames.
    indexedVarsSize := object basicSize - instVarNames size.
    

	^ Array streamContents: [ :stream |
		stream nextPut: { #classicon. 'self'. object printString. }.

        instVarNames doWithIndex: [ :each :index | 
			stream nextPut: { #classicon. each. (object instVarAt: index) printString. } ].
    
		1 to: (indexedVarsSize min: 21) do: [ :index | 
			stream nextPut: { #classicon. index asString. (object _at: index) printString. } ].
    
		((indexedVarsSize - 20) max: 22) to: indexedVarsSize do: [ :index | 
			stream nextPut: { #classicon. index asString. (object _at: index) printString. } ] ].
]
