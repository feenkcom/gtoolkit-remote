Extension { #name : 'LanguageLinkApplication' }

{ #category : '*Gt4PharoLink' }
LanguageLinkApplication >> evaluateSourceSequence: aString [
	| cf |

	cf := self newCommandFactory.
	^ cf 
		<< aString;
		sendAndWait.

]
