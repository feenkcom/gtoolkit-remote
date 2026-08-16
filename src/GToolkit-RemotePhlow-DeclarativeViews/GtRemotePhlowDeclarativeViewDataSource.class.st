Class {
	#name : #GtRemotePhlowDeclarativeViewDataSource,
	#superclass : #Object,
	#instVars : [
		'phlowView'
	],
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #'as yet unclassified' }
GtRemotePhlowDeclarativeViewDataSource class >> forPhlowView: aView [
	^ self new
		phlowView: aView
]

{ #category : #utils }
GtRemotePhlowDeclarativeViewDataSource >> captureErrorDataFor: anError [ 
	<gtGsStackCollector>
	^ self 
			gtDo: [ self captureGtErrorDataFor: anError ] 
			gemstoneDo: [ self captureGemstoneErrorDataFor: anError ]
]

{ #category : #utils }
GtRemotePhlowDeclarativeViewDataSource >> captureGemstoneErrorDataFor: anError [ 
	<gtGsStackCollector>
	^ (GtRemotePhlowViewErrorData new)
			errorDescription: anError messageText;
			errorObject: (GtGemStoneLocalExceptionWithCallStack 
				exception: anError
				callStack: GtGemStoneLocalCallStack forActiveProcess);
			beRemoteException
]

{ #category : #utils }
GtRemotePhlowDeclarativeViewDataSource >> captureGtErrorDataFor: anError [ 
	^ (GtRemotePhlowViewErrorData new)
			errorDescription: anError messageText;
			errorObject: anError;
			updateLocalRemoteSide
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDataSource >> definingMethod [
	^ self phlowView definingMethod
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDataSource >> executeWithErrorDataCapture: aBlockClosure [
	aBlockClosure 
		on: Error
		do: [:anError |
				self captureErrorDataFor: anError ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDataSource >> phlowView [
	^ phlowView
]

{ #category : #accessing }
GtRemotePhlowDeclarativeViewDataSource >> phlowView: anObject [
	phlowView := anObject
]
