"
File-backed textual web-view content.
"
Class {
	#name : #GtRemotePhlowWebViewTextualContent,
	#superclass : #GtRemotePhlowWebViewExplicitContent,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #defaults }
GtRemotePhlowWebViewTextualContent >> defaultContentType [
	^ 'text/plain'
]

{ #category : #defaults }
GtRemotePhlowWebViewTextualContent >> defaultFileExtension [
	^ 'txt'
]

{ #category : #rendering }
GtRemotePhlowWebViewTextualContent >> writeContentTo: aFileReference [
	aFileReference writeStreamDo: [ :aStream |
		aStream nextPutAll: self content  ]
]
