Class {
	#name : #GtPhlowThemeIconNameStencil,
	#superclass : #GtPhlowNamedIconStencil,
	#category : #'GToolkit-RemotePhlow-Icons'
}

{ #category : #accessing }
GtPhlowThemeIconNameStencil class >> typeLabel [
	^ 'phlowThemeIconNameStencil'
]

{ #category : #accessing }
GtPhlowThemeIconNameStencil >> create [
	^ (Smalltalk ui icons 
		iconNamed: self iconName) asElement
]
