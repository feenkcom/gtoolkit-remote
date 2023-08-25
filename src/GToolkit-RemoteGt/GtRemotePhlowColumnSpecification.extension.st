Extension { #name : #GtRemotePhlowColumnSpecification }

{ #category : #'*GToolkit-RemoteGt' }
GtRemotePhlowColumnSpecification >> createColumnAtIndex: aColumnIndex inViewSpecification: aViewSpecification for: aColumnedView [
	| column |
	
	column := self type 
		createColumnWithSpecification: self 
		atIndex: aColumnIndex 
		inViewSpecification: aViewSpecification 
		for: aColumnedView.

	column title: self title.
	
	self hasBackground ifTrue: [
		column background: [ :aText :aColumnedNode | 
			(aColumnedNode columnValueAt: aColumnIndex) background ] ].
	
	self cellWidth ifNotNil: [ :aWidth | 
		column width: aWidth ]
]
