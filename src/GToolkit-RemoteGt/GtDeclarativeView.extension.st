Extension { #name : 'GtDeclarativeView' }

{ #category : '*GToolkit-RemoteGt' }
GtDeclarativeView >> viewFor: aView [
	"Answer the GtPhlowView for the receiver"

	^self subclassResponsibility 
]
