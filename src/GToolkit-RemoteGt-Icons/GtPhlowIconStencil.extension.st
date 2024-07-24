Extension { #name : #GtPhlowIconStencil }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowIconStencil >> asElement [ 
	^ self create
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowIconStencil >> create [
	^ self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowIconStencil class >> phlowIconStencilFromDictionary: aSpecificationDictionary [
	^ self fromDictionary: aSpecificationDictionary
]
