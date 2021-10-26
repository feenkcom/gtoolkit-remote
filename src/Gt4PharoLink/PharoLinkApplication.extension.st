Extension { #name : #PharoLinkApplication }

{ #category : #'*Gt4PharoLink' }
PharoLinkApplication >> debuggerClientFor: anException [
	"Answer the debugger client to be used by the Gt Post Mortem debugger"

	^ GtPharoLinkPostMortemDebugger new exception: anException
]
