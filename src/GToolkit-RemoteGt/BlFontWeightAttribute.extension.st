Extension { #name : #BlFontWeightAttribute }

{ #category : #'*GToolkit-RemoteGt' }
BlFontWeightAttribute >> asGtRemotePhlowTextAttribute [
	^ {
		{#black . LogicalFont weightBlack}.
		{#bold . LogicalFont weightBold}.
		{#light . LogicalFont weightLight}.
		{#medium . LogicalFont weightMedium}.
		{#normal . LogicalFont weightRegular}.
		{#semiBold . LogicalFont weightSemiBold}.
		{#thin . LogicalFont weightThin}
	} 
		detect: [ :array | array second = self weight  ] 
		ifFound: [ :array |
			GtPhlowFontWeightAttribute new 
				weight: array first ]
		ifNone: [
			GtPhlowFontWeightAttribute new 
				weight: #normal ]
]
