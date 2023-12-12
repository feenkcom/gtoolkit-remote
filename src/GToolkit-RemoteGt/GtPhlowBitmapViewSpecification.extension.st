Extension { #name : #GtPhlowBitmapViewSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowBitmapViewSpecification >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^ aView explicit 
		title: title;
		priority: priority;
		stencil: [ self bitmap asForm asElement asScrollableElement ];
		actionButtonIcon: BrGlamorousVectorIcons inspect
			label: 'Bitmap'
			action: [ :aBrButton | aBrButton phlow spawnObject: bitmap ]
]
