Extension { #name : #GtRemotePhlowButtonAction }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowButtonAction >> canBeGtDeclarativeActionOnTheGtSide [
	"Allow the case on the GT side to create remote phlow actions 
	with brick stencils that will ne filtered as not declarative.
	Exists so that in the simulation we can inspect objects locally."
	
	^ iconStencil isNil or: [
		iconStencil isKindOf: GtPhlowIconStencil ]
]
