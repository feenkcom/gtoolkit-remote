Extension { #name : #PharoLinkServerConnection }

{ #category : #'*Gt4PharoLink' }
PharoLinkServerConnection >> getCloseOnExec [
	"Answer a boolean indicating whether the CloseOnExec bit is set.
	Only valid after the server has been started."

	socket getCloseOnExec.

]

{ #category : #'*Gt4PharoLink' }
PharoLinkServerConnection >> setCloseOnExec: aBoolean [
	"Set/Clear the CLOEXEC bit on the receiver.
	Must be called after the server has been started."

	socket setCloseOnExec: aBoolean.

]
