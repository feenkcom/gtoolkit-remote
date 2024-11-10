Extension { #name : #PharoLinkServer }

{ #category : #'*Gt4PharoLink' }
PharoLinkServer >> closeOnExec [
	"Answer a boolean indicating whether the CloseOnExec bit is set.
	Only valid after the server has been started."

	serverSocket closeOnExec.

]

{ #category : #'*Gt4PharoLink' }
PharoLinkServer >> closeOnExec: aBoolean [
	"Set/Clear the CLOEXEC bit on the receiver.
	Must be called after the server has been started."

	serverSocket closeOnExec: aBoolean.

]
