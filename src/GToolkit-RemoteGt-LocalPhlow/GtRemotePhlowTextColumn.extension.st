Extension { #name : #GtRemotePhlowTextColumn }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowTextColumn >> bindToCellElement: aCellElement cellObject: aCellObject atPosition: aRowIndex [
	| aText |

	aText := formatComputation
		ifNil: [ aCellObject gtDisplayText ]
		ifNotNil: [ :aBlock |
			aBlock
				phlowValue: aCellObject
				withEnoughArguments: { aRowIndex . index } ].

	aCellElement text: aText gtDisplayText
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowTextColumn >> createCellElement [
	^ BrLabel new
		aptitude: BrGlamorousListLabelAptitude;
		alignCenterLeft;
		hMatchParent;
		vFitContent
]
