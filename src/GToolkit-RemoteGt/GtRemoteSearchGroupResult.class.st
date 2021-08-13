Class {
	#name : #GtRemoteSearchGroupResult,
	#superclass : #GtSearchGroupResult,
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
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

{ #category : #accessing }
GtRemoteSearchGroupResult >> refreshItems [

	| message result |
	filtered ifTrue: [ ^ self ].
	items := OrderedCollection new.
	filter ifNotNil: [ 
		message := String streamContents: [ :stream | 
			           stream nextPutAll: 'String streamContents: [ :stream | 
			           		stream nextPutAll: ''OrderedCollection new ''.
							   (FLMaterializer materializeFromByteArray: '.
			           (FLSerializer serializeToByteArray: filter filter) storeOn:
				           stream.
			           stream nextPutAll: ') result do: [ :e |
			            	   stream nextPutAll: ''add: ''.
				           	e gtRemoteStoreOn: stream.
				           	stream nextPut: $; ].
				           stream nextPutAll: ''yourself'' ]' ].
		result := GtPharoLinkCodeSync default application newCommandFactory
			          << message;
			          sendAndWait.
		self flag: 'TODO eval is not optimal...'.
		items := self class compiler evaluate: result ].
	filtered := true
]
