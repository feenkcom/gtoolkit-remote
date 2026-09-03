Extension { #name : #GtPhlowTreeNodeUpToExpander }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeNodeUpToExpander >> asDeclarativeExpander [
	^ GtRemotePhlowTreeNodeExpander upTo: self level
]
