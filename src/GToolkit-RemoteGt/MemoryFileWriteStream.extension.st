Extension { #name : #MemoryFileWriteStream }

{ #category : #'*GToolkit-RemoteGt' }
MemoryFileWriteStream >> readInto: collection startingAt: offset count: requestedCount [

	^ file
		  at: offset
		  read: collection
		  startingAt: 1
		  count: requestedCount
]
