"
File-backed byte-array web-view content.
"
Class {
	#name : #GtRemotePhlowWebViewByteArrayContent,
	#superclass : #GtRemotePhlowWebViewExplicitContent,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : #defaults }
GtRemotePhlowWebViewByteArrayContent >> defaultContentType [
	^ 'application/octet-stream'
]

{ #category : #defaults }
GtRemotePhlowWebViewByteArrayContent >> defaultFileExtension [
	^ 'bin'
]

{ #category : #rendering }
GtRemotePhlowWebViewByteArrayContent >> writeContentTo: aFileReference [
	aFileReference binaryWriteStreamDo: [ :aStream |
		aStream nextPutAll: self content ]
]
