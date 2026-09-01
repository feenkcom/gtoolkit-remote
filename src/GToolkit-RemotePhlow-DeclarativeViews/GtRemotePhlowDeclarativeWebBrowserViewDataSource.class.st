"
Computes web browser content and dynamic headers.
"
Class {
	#name : #GtRemotePhlowDeclarativeWebBrowserViewDataSource,
	#superclass : #GtRemotePhlowDeclarativeViewDataSource,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #computing }
GtRemotePhlowDeclarativeWebBrowserViewDataSource >> computeContent [
	^ self phlowView contentComputation value.
]

{ #category : #computing }
GtRemotePhlowDeclarativeWebBrowserViewDataSource >> computeDynamicHeaders [
	| computedHeaders |
	computedHeaders := GtRemotePhlowWebViewHeader new.
	self phlowView hasDynamicHeaders ifTrue: [
		self phlowView dynamicHeadersComputation value: computedHeaders ].
	^ computedHeaders
]

{ #category : #updating }
GtRemotePhlowDeclarativeWebBrowserViewDataSource >> flushCachedData [
	
]

{ #category : #retrieving }
GtRemotePhlowDeclarativeWebBrowserViewDataSource >> retrieveContent [
	^ [ self computeContent ]
		on: Error
		do: [ :anError | self captureErrorDataFor: anError ]
]

{ #category : #retrieving }
GtRemotePhlowDeclarativeWebBrowserViewDataSource >> retrieveDynamicHeaders [
	^ [ self computeDynamicHeaders ]
		on: Error
		do: [ :anError | self captureErrorDataFor: anError ]
]
