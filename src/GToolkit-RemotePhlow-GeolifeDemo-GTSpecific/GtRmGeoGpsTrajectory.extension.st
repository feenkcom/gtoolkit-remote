Extension { #name : #GtRmGeoGpsTrajectory }

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsTrajectory >> gtViewPathShapeFor: aView [ 
	<gtView>
	
	^ aView explicit
		title: 'Path Shape';
		priority: 55;
		stencil: [GtRmGeoGpsPathsStencil new
			pathPoints:  self records]
]

{ #category : #'*GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' }
GtRmGeoGpsTrajectory >> osmMap [
	| map path points |

	map := GtOsmMap new zoom: 15.
	points := self records collect: #asPoint.
	points do: 
		[ :point | map includeCoordinate: point ].
	map addChildren.
	path := GtOsmPath new coordinates: points.
	path addToMap: map.
	^ map asScalableElement
]
