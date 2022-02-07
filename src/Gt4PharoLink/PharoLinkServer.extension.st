Extension { #name : #PharoLinkServer }

{ #category : #'*Gt4PharoLink' }
PharoLinkServer >> getCloseOnExec [
	"Answer a boolean indicating whether the CloseOnExec bit is set.
	Only valid after the server has been started."

	serverSocket getCloseOnExec.

]

{ #category : #'*Gt4PharoLink' }
PharoLinkServer >> setCloseOnExec: aBoolean [
	"Set/Clear the CLOEXEC bit on the receiver.
	Must be called after the server has been started."

	serverSocket setCloseOnExec: aBoolean.

]
