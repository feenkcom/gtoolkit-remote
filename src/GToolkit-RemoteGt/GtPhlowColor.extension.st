Extension { #name : #GtPhlowColor }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowColor >> asBlBackground [
	| newColor |
	newColor:= name 
		ifNil: [
			Color r: red g: green b: blue]
		ifNotNil: [
			Color named: name ].
	alpha ifNotNil: [
		newColor := newColor alpha: alpha ].
	
	^ newColor asBlBackground
]
