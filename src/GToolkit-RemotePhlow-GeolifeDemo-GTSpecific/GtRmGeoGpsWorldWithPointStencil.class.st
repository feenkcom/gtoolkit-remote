Class {
	#name : #GtRmGeoGpsWorldWithPointStencil,
	#superclass : #BrStencil,
	#instVars : [
		'targetPoint'
	],
	#category : #'GToolkit-RemotePhlow-GeolifeDemo-GTSpecific-UI'
}

{ #category : #accessing }
GtRmGeoGpsWorldWithPointStencil >> create [
	| world |
	world := GtMapperWorld new aptitude: GtMapperWorldLook new.
	GtMapperCountry countriesNewDo: [ :country | 
		| color |
		color := Color
			         r: 226
			         g: 231
			         b: 234
			         range: 255.
		country aptitude:
			(GtMapperCountryLook new default: [ :w | w background: color ]).
		world addCountry: country ].
	world 
		addMarker:
					(GtMapperMarker new
		aptitude: GtMapperMarkerLook new;
		background: Color black;
		constraintsDo: [ :c | 
			c vertical exact: 5.
			c horizontal exact: 5 ];
		geometry: BlCircle new;
		elevation: (BlRelativeElevation elevation: 90);
		layout: BlLinearLayout vertical alignCenter;
		location: self targetPoint).
	^ BrFrame new
		fitContent;
		addChild: world;
		asScalableElement 
]

{ #category : #accessing }
GtRmGeoGpsWorldWithPointStencil >> targetPoint [
	^ targetPoint
]

{ #category : #accessing }
GtRmGeoGpsWorldWithPointStencil >> targetPoint: aPoint [
	targetPoint := aPoint
]
