Extension { #name : #GtPhlowTooltipLabelBuilder }

{ #category : #'*GToolkit-RemoteGt-Icons' }
GtPhlowTooltipLabelBuilder >> applyToActionSpecification: anActionSpecification [ 
	anActionSpecification tooltipText:  self text asString
]
