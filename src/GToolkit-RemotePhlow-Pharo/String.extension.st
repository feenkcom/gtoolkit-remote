Extension { #name : #String }

{ #category : #'*GToolkit-RemotePhlow-Pharo' }
String >> gtDisplayOn: aStream [
	aStream nextPutAll: self
]
