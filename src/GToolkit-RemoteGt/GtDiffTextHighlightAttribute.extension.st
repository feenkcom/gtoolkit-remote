Extension { #name : #GtDiffTextHighlightAttribute }

{ #category : #'*GToolkit-RemoteGt' }
GtDiffTextHighlightAttribute >> gtEditorCreateExternalTextAttribute: anAttributesRegistry forTheme: aTheme during: aBlock [
	^ GtTextEditorAttribute
		background: (self paint blocResolveColorForTheme: aTheme)
		during: aBlock
]
