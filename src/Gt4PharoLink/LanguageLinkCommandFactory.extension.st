Extension { #name : 'LanguageLinkCommandFactory' }

{ #category : '*Gt4PharoLink' }
LanguageLinkCommandFactory >> evaluateSourceSequence: aString [

	"self addPlaygroundBindings."
	self << aString.
	^ self sendAndWait.

]
