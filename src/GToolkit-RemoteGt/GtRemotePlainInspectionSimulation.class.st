Class {
	#name : #GtRemotePlainInspectionSimulation,
	#superclass : #GtRemoteInspectionSimulation,
	#category : #'GToolkit-RemoteGt-Development'
}

{ #category : #accessing }
GtRemotePlainInspectionSimulation >> createViewedObjectFor: anObject [ 
	^ GtRemotePlainInspectionViewedObject object: anObject
]
