Extension { #name : #GtPhlowColor }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColor >> asBlBackground [
	^ self asColor asBlBackground
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColor >> asColor [
	| newColor |
	newColor:= name 
		ifNil: [
			Color r: red g: green b: blue]
		ifNotNil: [
			Color named: name ].
	alpha ifNotNil: [
		newColor := newColor alpha: alpha ].
	
	^ newColor
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColor >> asSpartaPaintOn: aSpartaCanvas [
	^ aSpartaCanvas paint color: self asColor
]

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColor >> gtPreviewFor: aView [
	<gtView>
	
	^ aView forward 
		title: 'Preview';
		object: [ self asColor ];
		view: #gtPreviewFor:
]
