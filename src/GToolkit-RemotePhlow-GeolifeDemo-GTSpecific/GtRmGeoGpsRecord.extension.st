Extension { #name : #GtRmGeoGpsRecord }

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsRecord >> gtViewOnGoogleMapFor: aView [ 
	<gtView>
	
	^ aView forward
		title: 'On Google Map';
		priority: 56;
		object: [ 
			GtWebViewElement new 
				url: self googleMapsUrl ];
		view: #gtLiveFor:
]

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsRecord >> gtViewOnMapFor: aView [ 
	<gtView>
	
	^ aView explicit
		title: 'On Map';
		priority: 55;
		stencil: [ GtRmGeoGpsWorldWithPointStencil new 
			targetPoint:  self longitude @ self latitude ]
]

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsRecord >> gtViewOnOsmFor: aView [ 
	<gtView>
	
	^ aView explicit
		title: 'On OSM';
		priority: 55;
		stencil: [ GtOpenStreetMapTiles new tileWithMarkerAt:  self longitude @ self latitude zoom: 15 ]
]
