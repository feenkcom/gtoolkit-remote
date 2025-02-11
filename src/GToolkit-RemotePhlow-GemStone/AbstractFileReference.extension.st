Extension { #name : #AbstractFileReference }

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtChildren [
	self isDirectory ifFalse: [ ^ Array new ].

	^ (self directories sort: [:a :b | a basename < b basename ]) , 
		(self files sort: [:a :b | a basename < b basename ]).
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtChildrenWithParent [
	| aChildrenCollection |
	self isDirectory ifFalse: [ ^ Array new ].
	
	aChildrenCollection := self gtChildren.
	aChildrenCollection := self isRoot
		ifTrue: [ aChildrenCollection ]
		ifFalse: [ aChildrenCollection asOrderedCollection
			addFirst: self parent;
			yourself ].
	^ aChildrenCollection
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtContentsFor: aView [
	<gtView>
	
	self isFile ifFalse: [ ^ aView empty ].

	^ aView textEditor
		title: 'Contents';
		priority: 50;
		text: [ self contents ]
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
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
			{ #isReadable . [self isReadable] on: Error do: ['unsuported'] }.
			{ #isWritable . [self isWritable] on: Error do: ['unsuported'] }.
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

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
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

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtItemsFor: aView [
	<gtView>
	self isDirectory
		ifFalse: [ ^ aView empty ].

	^ aView columnedList
		title: 'Items';
		priority: 1;
		items: [ self gtChildrenWithParent ];
		column: 'Icon' 
			iconName: [ :each | 
				each isDirectory
					ifTrue: [ #emptyPackage ]
					ifFalse: [ #workspace ] ]
			width: 35;
		column: 'Name'  text: [ :each | 
			(self isChildOf: each)
				ifTrue: [ '..' ]
				ifFalse: [ each basename asString ] ];
		column: 'Size' 
			text: [ :each | 
				[ each isDirectory 
					ifTrue: [ '--' ]
					ifFalse: [ each humanReadableSize asString ] ]
				on: Error
				do: [ :anException | anException return: '' ] ]
			width: 100;
		column: 'Creation' 
			text: [ :each | 
				[ String
					streamContents: [ :s | 
						each creationTime printYMDOn: s.
						s nextPut: Character space.
						each creationTime printHMSOn: s ] ]
				on: Error
				do: [ :anException | anException return: '' ] ]
			width: 150
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtPathFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Path';
		priority: 55;
		items: [ 
			self asFileReference asAbsolute path withParents ];
		column: 'Icon'
			iconName: [ :aPath | 
				aPath asFileReference exists
					ifTrue: [ #smallOk  ]
					ifFalse: [  #changeRemove ] ]
			width: 35;
		column: 'Name'
			text: [ :aPath | 
				aPath asFileReference basename
					, (aPath asFileReference isDirectory ifTrue: [ '/' ] ifFalse: [ '' ]) ];
		send: [ :aPath |
			aPath asFileReference ]
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> gtTreeFor: aView [
	<gtView>
	self isDirectory
		ifFalse: [ ^ aView empty ].
	^ aView columnedTree
		title: 'Tree' ;
		priority: 10;
		items: [ self gtChildren ];
		children: [ :each | each gtChildren ];
		column: 'Icon' 
			iconName: [ :each | 
				each isDirectory
					ifTrue: [ #emptyPackage ]
					ifFalse: [ #workspace ] ]
			width: 35;
		column: 'Name'  text: [ :each | 
			(self isChildOf: each)
				ifTrue: [ '..' ]
				ifFalse: [ each basename asString ] ];
		column: 'Size' 
			text: [ :each | 
				[ each isDirectory 
					ifTrue: [ '--' ]
					ifFalse: [ each humanReadableSize asString ] ]
				on: Error
				do: [ :anException | anException return: '' ] ]
			width: 100;
		column: 'Creation' 
			text: [ :each | 
				[ String
					streamContents: [ :s | 
						each creationTime printYMDOn: s.
						s nextPut: Character space.
						each creationTime printHMSOn: s ] ]
				on: Error
				do: [ :anException | anException return: '' ] ]
			width: 150
]

{ #category : #'*GToolkit-RemotePhlow-GemStone' }
AbstractFileReference >> humanReadableSize [

	^ self size humanReadableSISizeString
]
