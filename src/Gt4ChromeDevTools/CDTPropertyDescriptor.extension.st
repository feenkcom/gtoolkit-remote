Extension { #name : #CDTPropertyDescriptor }

{ #category : #'*Gt4ChromeDevTools' }
CDTPropertyDescriptor >> gtPropertiesDictionary [

	^ { 
		#configurable -> self configurable.
		#enumerable -> self enumerable.
		#isOwn -> self isOwn.
		#name -> self name.
		#value -> self value. } asDictionary 
]

{ #category : #'*Gt4ChromeDevTools' }
CDTPropertyDescriptor >> gtPropertiesFor: aView [
	<gtView>

	rawData ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ self gtPropertiesDictionary ];
		view: #gtItemsFor:
]
