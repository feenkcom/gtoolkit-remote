Extension { #name : #GtRemotePhlowNavigationAction }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtRemotePhlowNavigationAction >> applyOn: aLocalElement [ 
	self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtRemotePhlowNavigationAction >> applyPrimaryModifierOn: aLocalElement [ 
	self applyOn: aLocalElement 
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtRemotePhlowNavigationAction class >> navigationActionFromDictionary: aSpecificationDictionary [
	^ self fromDictionary: aSpecificationDictionary
]
