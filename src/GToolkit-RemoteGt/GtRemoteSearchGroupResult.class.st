Class {
	#name : 'GtRemoteSearchGroupResult',
	#superclass : 'GtSearchGroupResult',
	#category : 'GToolkit-RemoteGt'
}

{ #category : 'accessing' }
GtRemoteSearchGroupResult >> gtItemsFor: aView [

	<gtView>
	self refreshItems.
	^ aView forward
		  title: 'Live';
		  priority: 10;
		  object: [ 
			  filter filter result
				  gtRemoteItems: items;
				  yourself ];
		  view: #gtItemsFor:
]

{ #category : 'accessing' }
GtRemoteSearchGroupResult >> refreshItems [

	| message result |
	filtered ifTrue: [ ^ self ].
	items := OrderedCollection new.
	filter ifNotNil: [ 
		| fuelStream |
		fuelStream := ReadWriteStream on: (ByteArray new: 100).
		FLSerializer serialize: filter filter on: fuelStream.
		fuelStream reset.
		message := String streamContents: [ :stream | 
			           stream nextPutAll: '
			fuelStream := ReadWriteStream on: (ByteArray new: 100).
			Base64MimeConverter new
				mimeStream: '''.
			           Base64MimeConverter mimeEncode: fuelStream to: stream.
			           stream nextPutAll: ''' readStream;
			    dataStream: fuelStream;
			    mimeDecodeToByteArray.
			result := (FLMaterializer materializeFromByteArray: fuelStream contents) result.
			result refreshItems.
			fuelStream := ReadWriteStream on: (ByteArray new: 100).
			FLSerializer serialize: result on: fuelStream.
			fuelStream reset.
			String streamContents: [ :stream | Base64MimeConverter mimeEncode: fuelStream to: stream ]' ].
		result := GtPharoLinkCodeSync default application newCommandFactory
			          << message;
			          sendAndWait.
		fuelStream := ReadWriteStream on: (ByteArray new: 100).
		Base64MimeConverter new
			mimeStream: result readStream;
			dataStream: fuelStream;
			mimeDecodeToByteArray.
		items := (FLMaterializer materializeFromByteArray:
			          fuelStream contents) instVarNamed: #items ].
	filtered := true
]
