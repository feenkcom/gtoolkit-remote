"
A serializable value that configures a GtWebViewElement.
"
Class {
	#name : #GtRemotePhlowWebViewContent,
	#superclass : #GtRemotePhlowBasicViewData,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #testing }
GtRemotePhlowWebViewContent class >> isAbstract [
	^ self name = #GtRemotePhlowWebViewContent
]

{ #category : #testing }
GtRemotePhlowWebViewContent >> isWebViewContent [
	^ true
]
