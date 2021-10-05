Extension { #name : #LanguageLinkPromise }

{ #category : #'*Gt4PharoLink' }
LanguageLinkPromise >> gtValueFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Value';
		  priority: 10;
		  stencil: [ GtInspector forObject: self waitForValue ]
]
