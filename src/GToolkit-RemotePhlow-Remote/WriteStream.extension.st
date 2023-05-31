Extension { #name : #WriteStream }

{ #category : #'*GToolkit-RemotePhlow-Remote' }
WriteStream >> parenthesize: aBlock [
	self nextPut: $(.
	aBlock ensure: [ self nextPut: $) ]
]
