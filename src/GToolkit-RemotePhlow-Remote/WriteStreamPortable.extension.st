Extension { #name : 'WriteStreamPortable' }

{ #category : '*GToolkit-RemotePhlow-Remote' }
WriteStreamPortable >> parenthesize: aBlock [
	self nextPut: $(.
	aBlock ensure: [ self nextPut: $) ]
]
