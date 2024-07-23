Class {
	#name : #GtPhlowBasicGlamorousIconNameStencil,
	#superclass : #GtPhlowNamedIconStencil,
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #accessing }
GtPhlowBasicGlamorousIconNameStencil >> create [
	^ (self iconsClass 
		perform: self iconName asSymbol) asElement
]

{ #category : #accessing }
GtPhlowBasicGlamorousIconNameStencil >> iconsClass [
	^ self subclassResponsibility
]
