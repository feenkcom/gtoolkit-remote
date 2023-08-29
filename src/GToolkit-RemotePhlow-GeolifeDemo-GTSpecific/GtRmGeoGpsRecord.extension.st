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

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsRecord >> gtViewOnOsmFor: aView [ 
	<gtView>
	
	^ aView explicit
		title: 'On OSM';
		priority: 55;
		stencil: [ GtOpenStreetMapTiles new tileWithMarkerAt:  self longitude @ self latitude zoom: 15 ]
]
