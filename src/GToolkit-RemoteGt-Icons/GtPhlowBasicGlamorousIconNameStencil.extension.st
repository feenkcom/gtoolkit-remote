Extension { #name : #GtPhlowBasicGlamorousIconNameStencil }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowBasicGlamorousIconNameStencil >> create [
	^ (self iconsClass 
		perform: self iconName asSymbol) asElement
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowBasicGlamorousIconNameStencil >> iconsClass [
	^ self subclassResponsibility
]
