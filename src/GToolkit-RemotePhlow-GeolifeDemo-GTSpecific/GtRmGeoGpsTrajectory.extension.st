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
