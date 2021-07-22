Class {
	#name : 'GtRemoteSearchMethodGroupResult',
	#superclass : 'GtSearchMethodGroupResult',
	#category : 'GToolkit-RemoteGt'
}

{ #category : 'accessing' }
GtRemoteSearchMethodGroupResult >> refreshItems [
	| application message result |
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
			application := PharoLinkApplication withDefaultSettings
				debugMode: true;
				yourself.
			application start.
			result := application newCommandFactory
				<< message;
				sendAndWait.
			application stop.
			items := (FLMaterializer
				materializeFromByteArray: (self class compiler evaluate: result))
				collect: [ :e | e key >> e value ] ].
	filtered := true
]
