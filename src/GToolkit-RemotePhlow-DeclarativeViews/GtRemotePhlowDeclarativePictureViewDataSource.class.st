Class {
	#name : #GtRemotePhlowDeclarativePictureViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowDeclarativePictureViewDataSource >> retrieveData [
	^
	[(GtRemotePhlowPictureViewData new)
		content: self phlowView pictureComputation value;
		mediaType: self phlowView mediaTypeComputation value;
		width: self phlowView widthComputation value;
		height: self phlowView heightComputation value]
			on: Error
			do: 
				[:e |
				(GtRemotePhlowViewErrorData new)
					errorDescription: e messageText;
					errorObject: e;
					updateLocalRemoteSide]
]
