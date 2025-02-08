Extension { #name : 'Integer' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
Integer >> humanReadableSISizeOn: aStream [
	"Print a SI representation of myself on the argument. See humanReadableSIByteSize for better comment."

	| exponent base |
	base := 1000.
	self < base
		ifTrue: [ ^ aStream print: self; space; nextPut: $B ].
	exponent := ((self log:10) / (base log:10)) asInteger.
	aStream nextPutAll: (self / (base raisedTo: exponent)) asFloat asString.
	aStream
		space;
		nextPut: ('kMGTPE' at: exponent);
		nextPut: $B
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
Integer >> humanReadableSISizeString [
	"Return the receiver as a string with SI binary (International System of Units) file size, e.g. '50 KB'. It means that it takes 1000 and not 1024 as unit as humanReadableByteSizeString does."

	"(1000 * 1000 * 1000) humanReadableSISizeString >>> '1.00 GB'"
	"(1000 * 1000 * 1000) humanReadableByteSizeString >>> '953 MB'"
	"(1024 * 1024 * 1024) humanReadableSISizeString >>> '1.07 GB'"


	^ String streamContents: [ :s|
		self humanReadableSISizeOn: s ]
]
