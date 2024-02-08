Extension { #name : #GtRemotePhlowIconNameColumn }

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowIconNameColumn >> bindToCellElement: aCellElement cellObject: aCellObject atPosition: aRowIndex [
	| computedIconName iconElement |

	computedIconName := iconNameComputation
		ifNil: [ aCellObject gtDisplayText ]
		ifNotNil: [ :aBlock |
			aBlock
				phlowValue: aCellObject
				withEnoughArguments: { aRowIndex . index } ].

	iconElement := self createIconElementFromName: computedIconName asSymbol.

	aCellElement
		removeChildren;
		addChild: iconElement.

	^ aCellElement
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowIconNameColumn >> createCellElement [
	| container |

	container := BrHorizontalPane new.
	container hMatchParent; vFitContent.

	^ container
]

{ #category : #'*GToolkit-RemoteGt-LocalPhlow' }
GtRemotePhlowIconNameColumn >> createIconElementFromName: anIconName [ 
	self subclassResponsibility
]
