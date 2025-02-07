Extension { #name : 'AbstractFileReference' }

{ #category : '*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtDetails [
	| details |

	details := {
		{ #self . self }.
		{ #printString. self printString }.
		{ #gtDisplayString. self gtDisplayString }.
		{ #pathString . self pathString }.
		{ #base . self base }.
		{ #basename . self basename }.
		{ #extension . self extension }.
		{ #parent . self parent }.
		{ #path . self path }.
		{ #fullPath . self fullPath }.
		{ #absolutePath . self absolutePath }. 
		{ #fileSystem . self fileSystem }.
		{ #exists . self exists }.
		{ #isFile . self isFile }.
		{ #isDirectory . self isDirectory }.
		{ #isAbsolute . self isAbsolute }.
		{ #isRelative . self isRelative }.
	}.
	self exists ifTrue: [
		details := details , {
			{ #isReadable . self isReadable }.
			{ #isWritable . self isWritable }.
			{ #size . self size size . self size }.
			{ #uid . self uid }.
			{ #gid . self gid }.
			{ #inode . self inode }.
			{ #creationTime . [self creationTime ] 
				on: Error do: ['unsuported']}.
			{ #modificationTime . self modificationTime }.
			{ #changeTime . self changeTime }.
			{ #accessTime . self accessTime }.
			{ #permissions . self permissions }.
	} ].
	^ details
]

{ #category : '*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtDetailsFor: composite [
	<gtView>

	^ composite columnedList
		title: 'Details';
		priority: 60;
		items: [ self gtDetails ];
		column: 'key' text: [ :each | each first ] width: 250;
		column: 'value' text: [ :each | each second ];
		send: [ :each | each last ]
]
