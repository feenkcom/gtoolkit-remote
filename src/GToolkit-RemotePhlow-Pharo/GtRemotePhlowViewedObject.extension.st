Extension { #name : 'GtRemotePhlowViewedObject' }

{ #category : '*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowViewedObject >> addRawSelfNodeTo: variableNodes [
	^ variableNodes add: (GTInspectorSelfNode hostObject: object).
	
]

{ #category : '*GToolkit-RemotePhlow-Pharo' }
GtRemotePhlowViewedObject >> rawViewData [
	"Answer the data for the raw view"
	| variableNodes icon name value |

	variableNodes := OrderedCollection new: object class allSlots size.
	"GemStone doesn't have GTInspectorSelfNode.  The call to #addRawSelfNodeTo: will allow the platform specific code to be added.
	variableNodes add: (GTInspectorSelfNode hostObject: object)."
	self addRawSelfNodeTo: variableNodes.
	object gtInspectorVariableNodesIn: variableNodes.

	^ Array streamContents: [ :stream |
		variableNodes do: [ :node |
			icon := ([ node rawValue class systemIconName ]
					on: Error 
					do: [ :error | #smallWarningIcon ]).
			name := node label.
			value := node rawValue.
			stream nextPut: { icon. name. value. } ] ].

]
