Class {
	#name : #GtPharoLinkReadFileWriteMemorySourceFile,
	#superclass : #SourceFile,
	#instVars : [
		'virtual',
		'readOnlyLimit'
	],
	#category : 'Gt4PharoLink-CodeSync'
}

{ #category : #accessing }
GtPharoLinkReadFileWriteMemorySourceFile >> initializeVirtual: aFile readOnlyLimit: anInteger [

	virtual := aFile.
	readOnlyLimit := anInteger
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemorySourceFile >> readOnlyCopy [

	^ (self species on: path potentialLocations: potentialLocations)
		  initializeVirtual: virtual readOnlyLimit: readOnlyLimit;
		  tryOpenReadOnly: true;
		  yourself
]

{ #category : #accessing }
GtPharoLinkReadFileWriteMemorySourceFile >> tryOpenReadOnly: readOnly [

	| basename |
	basename := path asFileReference basename.
	"Open a read write stream only if read only access was not requested.
	We need to create the encoding and buffering streams manually because we need a read write stream."
	readOnly ifFalse: [ 
		potentialLocations do: [ :each | 
			stream := SourceFileCharacterReadWriteStream
				          on:
					          (SourceFileBufferedReadWriteStream on:
						           (GtPharoLinkReadFileWriteMemoryStream
							            readOnly:
							            (each asFileReference / basename) binaryReadStream
							            readOnlyLimit: readOnlyLimit
							            readWrite: virtual unbufferedBinaryWriteStream))
				          encoding: 'utf8'.
			^ self ] ].
	potentialLocations do: [ :each | 
		stream := ZnCharacterReadStream
			          on: (GtPharoLinkReadFileWriteMemoryStream
					           readOnly:
					           (each asFileReference / basename) binaryReadStream
					           readOnlyLimit: readOnlyLimit
					           readWrite: virtual binaryReadStream)
			          encoding: 'utf8'.
		^ self ]
]
