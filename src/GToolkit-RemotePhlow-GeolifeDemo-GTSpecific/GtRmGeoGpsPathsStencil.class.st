Class {
	#name : #GtRmGeoGpsPathsStencil,
	#superclass : #BrStencil,
	#instVars : [
		'pathPoints'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo-GTSpecific-UI'
}

{ #category : #accessing }
GtRmGeoGpsPathsStencil >> buildMapperPolylineForPath [ 
	^ GtMapperGeoJSONPolyline new points: (pathPoints
		collect: [ :eachRawPoint | GtMapperGeoJSONPoint new 
			longitude: eachRawPoint longitude 
			latitude: eachRawPoint latitude ])
]

{ #category : #accessing }
GtRmGeoGpsPathsStencil >> buildProjectedPolygons [
	| polygons |
	
	polygons := GtMapperGeoJSONMultiPolygon  new 
		polygons: {self buildMapperPolylineForPath}.

	^ polygons projected: GtMapperEquirectangularProjection new
]

{ #category : #'api - instantiation' }
GtRmGeoGpsPathsStencil >> create [ 	
	| projectedPolygons translatedPolygons pathElement |
	projectedPolygons := self buildProjectedPolygons.
	translatedPolygons := (projectedPolygons 
		translatedBy: projectedPolygons topLeft negated) asPoints.
	
	pathElement := BlElement new
		size: projectedPolygons extent;
		geometry: (BlPolylineGeometry vertices: translatedPolygons first);
		background: (Color transparent);
		border: (BlBorder builder paint: Color red; width: 0.0001; build).
	
	^ BrFrame new
		fitContent;
		addChild: pathElement;
		asScalableElement
]

{ #category : #accessing }
GtRmGeoGpsPathsStencil >> pathPoints [

	^ pathPoints
]

{ #category : #accessing }
GtRmGeoGpsPathsStencil >> pathPoints: anObject [

	pathPoints := anObject
]
