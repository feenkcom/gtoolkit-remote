"
Materializes explicit web-view content in a temporary local file and answers its file URL.
"
Class {
	#name : #GtRemotePhlowWebViewExplicitContentFileWriter,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #writing }
GtRemotePhlowWebViewExplicitContentFileWriter >> writeContent: anExplicitContent [
	| fileReference |
	fileReference := FileReference
		newTempFilePrefix: 'gt-web-view-'
		suffix: '.', anExplicitContent fileExtension.
	anExplicitContent writeContentTo: fileReference.
	^ fileReference asUrl asString
]
