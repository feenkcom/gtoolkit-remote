Extension { #name : #GtRemotePhlowColumn }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> buildHeaderElement [
	| aLabel |
	aLabel := (self defaultHeaderElementBuilder 
		valueWithEnoughArguments: {self title. self}) asElement.
	self localCellWidth applyOn: aLabel.
	^ aLabel
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> buildHeaderElementFor: aText [
	| aLabel |
	aLabel := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		alignCenterLeft;
		padding: self newCellPaddingInsets;
		text: (aText asRopedText 
			foreground: BrGlamorousColors defaultButtonTextColor).
	^ aLabel
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> computeDecoratedCellStencil: aCellStencil [
	^ GtPhlowColumnErrorHandlingCellStencilBuilder new
		cellStencil: aCellStencil;
		cellSpacing: self newCellPaddingInsets
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> computeDecoratedDataBinder: aSourceDataBinder [
	| aDataBinder |

	aDataBinder := aSourceDataBinder.

	aDataBinder := GtPhlowColumnCellItemComputationDataBinder new
		dataBinder: aDataBinder;
		itemComputation: itemComputation;
		backgroundComputation: self localBackgroundComputation.

	aDataBinder := GtPhlowColumnErrorHandlingDataBinder new
		dataBinder: aDataBinder.

	^ aDataBinder
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> configureColumn: aBrColumn [
	aBrColumn
		title: self title;
		cellWidth: self localCellWidth
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> defaultHeaderElementBuilder [
	^ [ :aTitle :aPhlowColumn | self buildHeaderElementFor: aTitle ]
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> defaultLocalBackgroundComputation [
	^ [ :eachCellValue :eachRowValue :eachRowIndex :eachColumnIndex | 
		Color transparent ]
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> localBackgroundComputation [
	^ self backgroundComputation ifNil: [
		self defaultLocalBackgroundComputation ]
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> localCellWidth [
	^ self cellWidth 
		ifNil: [ GtPhlowColumnProportionalWidth new ]
		ifNotNil: [ :aValue |
			BrColumnFixedWidth new 
				width: aValue ]
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowColumn >> newCellPaddingInsets [
	^ BlInsets empty
]
