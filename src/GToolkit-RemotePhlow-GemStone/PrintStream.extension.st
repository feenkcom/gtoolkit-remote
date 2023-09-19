Extension { #name : #PrintStream }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
PrintStream >> parenthesize: aBlock [
	self nextPut: $(.
	aBlock ensure: [ self nextPut: $) ]
]
