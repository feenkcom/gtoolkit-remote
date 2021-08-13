Extension { #name : 'CodeImporter' }

{ #category : '*GToolkit-RemoteGt' }
CodeImporter >> gtReduceToUnsavedChunks [

	| i break stack |
	self parseChunks.
	i := codeDeclarations size.
	break := false.
	stack := Stack new.
	[ i > 0 and: [ break not ] ] whileTrue: [ 
		| chunk |
		chunk := codeDeclarations at: i.
		(chunk isDoItDeclaration and: [ 
			 chunk gtIsQuit or: [ chunk gtIsSnapshot ] ])
			ifTrue: [ break := true ]
			ifFalse: [ 
				stack push: chunk.
				i := i - 1 ] ].
	codeDeclarations := stack as: OrderedCollection
]
