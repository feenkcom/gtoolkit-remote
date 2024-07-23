Extension { #name : #GtPhlowErrorActionSpecification }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowErrorActionSpecification >> actionFor: anAction [

	^ anAction explicit 
		priority: self priority;
		stencil: [
			BrButton new
				aptitude: ((BrGlamorousButtonExteriorAptitude new 
					backgroundPaint: BrGlamorousColors errorBackgroundColor)
						+ BrGlamorousButtonRectangularAptitude
						+ BrGlamorousButtonLabelAptitude);
				action:  [ :aButton | 
					aButton phlow spawnObject: self ];
				label: 'Error'  ];
		in: [ :currentAction |
			(self tooltipText ifNil: [ self errorMessage])
				ifNotNil: [ :aText |
					currentAction tooltip: aText ] ];
		yourself
]
