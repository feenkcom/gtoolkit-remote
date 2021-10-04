Extension { #name : 'SourceFileArray' }

{ #category : '*Gt4PharoLink' }
SourceFileArray >> gtPharoLinkEnsureReadFileWriteMemoryOpen [

	| fileSystem sources sourcesVirtual changes changesVirtual array pointer |
	sources := self sourcesFileStream path asFileReference.
	changes := self changesFileStream path asFileReference.
	self close.
	fileSystem := FileSystem memory.
	sourcesVirtual := fileSystem workingDirectory
	                  / UUIDGenerator next asString.
	sourcesVirtual createFile.
	changesVirtual := fileSystem workingDirectory
	                  / UUIDGenerator next asString.
	changesVirtual createFile.
	files := Array
		         with: ((GtPharoLinkReadFileWriteMemorySourceFile
				           on: sources
				           potentialLocations: { sources parent })
				          initializeVirtual: sourcesVirtual
				          readOnlyLimit: sources size;
				          tryOpenReadOnly: true;
				          yourself)
		         with: ((GtPharoLinkReadFileWriteMemorySourceFile
				           on: changes
				           potentialLocations: { changes parent })
				          initializeVirtual: changesVirtual
				          readOnlyLimit: changes size;
				          tryOpenReadOnly: false;
				          yourself).
	readOnlyQueue := SharedQueue new
]
