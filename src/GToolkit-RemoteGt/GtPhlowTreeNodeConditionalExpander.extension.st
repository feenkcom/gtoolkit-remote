Extension { #name : #GtPhlowTreeNodeConditionalExpander }

{ #category : #'*GToolkit-RemoteGt' }
GtPhlowTreeNodeConditionalExpander >> asDeclarativeExpander [
	^ GtRemotePhlowTreeNodeExpander suchThat: self condition
]
