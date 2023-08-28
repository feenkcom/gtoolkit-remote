Extension { #name : #GtRmGeoGpsRecord }

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsRecord >> gtViewOnMapFor: aView [ 
	<gtView>
	
	^ aView explicit
		title: 'On Map';
		priority: 55;
		stencil: [ GtRmGeoGpsWorldWithPointStencil new 
			targetPoint:  self latitude @ self longitude ]
]
