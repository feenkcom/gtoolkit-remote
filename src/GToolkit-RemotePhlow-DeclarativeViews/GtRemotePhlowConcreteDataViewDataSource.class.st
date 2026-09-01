Class {
	#name : #GtRemotePhlowConcreteDataViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #accessing }
GtRemotePhlowConcreteDataViewDataSource >> computeViewData [
	^ self phlowView computeViewData
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewDataSource >> flushCachedData [
]

{ #category : #accessing }
GtRemotePhlowConcreteDataViewDataSource >> retrieveData [
	^ [ self computeViewData ]
		on: Error
		do: [ :anError | self captureErrorDataFor: anError ]
]
