Extension { #name : #GtRemotePhlowNumberColumn }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowNumberColumn >> bindToCellElement: aCellElement cellObject: aCellObject atPosition: aRowIndex [
	| aText |
	
	aText := formatComputation
		ifNil: [ aCellObject gtDisplayText ]
		ifNotNil: [ :aBlock | aBlock value: aCellObject ].

	aCellElement text: aText
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowNumberColumn >> createCellElement [
	^ BrLabel new
		aptitude: BrGlamorousListLabelAptitude;
		alignCenterRight;
		hMatchParent;
		vFitContent
]
