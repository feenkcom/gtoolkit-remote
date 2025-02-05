Extension { #name : #Semaphore }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
Semaphore >> gtDisplayOn: aStream [
	"Reuse the printOn: implementation"
	self printOn: aStream
]
