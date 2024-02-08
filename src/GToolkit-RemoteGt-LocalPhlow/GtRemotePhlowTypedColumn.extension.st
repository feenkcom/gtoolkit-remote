Extension { #name : #GtRemotePhlowTypedColumn }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowTypedColumn >> bindToCellElement: aCellElement cellObject: aCellObject atPosition: aRowIndex [
	self subclassResponsibility
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowTypedColumn >> configureColumn: aBrColumn [
	super configureColumn: aBrColumn.

	aBrColumn
		cellStencil: (self computeDecoratedCellStencil: (MessageSend receiver: self selector: #createCellElement));
		dataBinder: (self computeDecoratedDataBinder: (MessageSend receiver: self selector: #bindToCellElement:cellObject:atPosition:))
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowTypedColumn >> createCellElement [
	^ self subclassResponsibility
]
