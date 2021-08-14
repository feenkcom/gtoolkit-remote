Class {
	#name : 'GtRemoteSearchMethodGroupResult',
	#superclass : 'GtSearchMethodGroupResult',
	#category : 'GToolkit-RemoteGt'
}

{ #category : 'accessing' }
GtRemoteSearchMethodGroupResult >> refreshItems [
	| message result |
	filtered
		ifTrue: [ ^ self ].
	items := OrderedCollection new.
	filter
		ifNotNil: [ message := String
				streamContents: [ :stream | 
					stream
						nextPutAll:
							'String streamContents: [ :stream | | descriptors |
								descriptors := OrderedCollection new.
								((GtSearchMethodGroupResult forFilter: (FLMaterializer materializeFromByteArray: '.
					(FLSerializer serializeToByteArray: filter) storeOn: stream.
					stream
						nextPutAll:
							')) do: [ :method | descriptors add: method methodClass -> method selector ]).
								 (FLSerializer serializeToByteArray: descriptors) storeOn: stream ]' ].
			result := GtPharoLinkCodeSync default application newCommandFactory
				<< message;
				sendAndWait.
			items := (FLMaterializer
				materializeFromByteArray: (self class compiler evaluate: result))
				collect: [ :e | e key >> e value ] ].
	filtered := true
]
