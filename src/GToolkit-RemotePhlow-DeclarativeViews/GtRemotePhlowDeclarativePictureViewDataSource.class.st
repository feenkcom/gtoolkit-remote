Class {
	#name : #GtRemotePhlowDeclarativePictureViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativePictureViewDataSource >> computeViewData [
	^ GtRemotePhlowPictureViewData new
		content: self phlowView pictureComputation value;
		mediaType: self phlowView mediaTypeComputation value;
		width: self phlowView widthComputation value;
		height: self phlowView heightComputation value
]

{ #category : #accessing }
GtRemotePhlowDeclarativePictureViewDataSource >> retrieveData [
	^ [ self computeViewData ]
		on: Error
		do: [ :anError | self captureErrorDataFor: anError ]
]
