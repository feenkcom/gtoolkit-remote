Extension { #name : 'LanguageLinkPromise' }

{ #category : '*GToolkit-RemoteGt' }
LanguageLinkPromise >> gtValueFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Value';
		  priority: 10;
		  stencil: [ GtInspector forObject: self waitForValue ]
]
