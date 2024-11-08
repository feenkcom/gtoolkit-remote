Extension { #name : #PharoLinkServerConnection }

{ #category : #'*Gt4PharoLink' }
PharoLinkServerConnection >> closeOnExec [
	"Answer a boolean indicating whether the CloseOnExec bit is set.
	Only valid after the server has been started."

	socket closeOnExec.

]

{ #category : #'*Gt4PharoLink' }
PharoLinkServerConnection >> closeOnExec: aBoolean [
	"Set/Clear the CLOEXEC bit on the receiver.
	Must be called after the server has been started."

	socket closeOnExec: aBoolean.

]
