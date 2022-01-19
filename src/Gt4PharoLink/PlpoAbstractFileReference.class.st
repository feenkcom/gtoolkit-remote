Class {
	#name : #PlpoAbstractFileReference,
	#superclass : #PharoLinkProxyObject,
	#category : #'Gt4PharoLink-Proxies'
}

{ #category : #accessing }
PlpoAbstractFileReference class >> remoteClassName [

	^ #AbstractFileReference
]

{ #category : #ui }
PlpoAbstractFileReference >> gtChildrenWithParentData [

	^ self newCommandFactory
		<< 
'self gtChildrenWithParent collect: [ :each |
	{
		each isDirectory.
		(self isChildOf: each)
				ifTrue: [ ''..'' ]
				ifFalse: [ each basename asString ].
		[ each humanReadableSize asString ]
				on: FileException, FileSystemError
				do: [ :anException | anException return: '''' ].
		[ String 	streamContents: [ :s | 
				each creationTime printYMDOn: s.
				s nextPut: Character space.
				each creationTime printHMSOn: s ] ]
			on: FileException, FileSystemError
			do: [ :anException | anException return: '''' ].
		each.
	} ] as: Array.';
		sendAndWait.
]

{ #category : #ui }
PlpoAbstractFileReference >> gtItemsFor: aView [
	<gtView>

	self isDirectory ifFalse: [ ^ aView empty ].

	^ aView columnedList
		title: 'Items' translated;
		priority: 10;
		items: [ self gtChildrenWithParentData ];
		column: 'Icon' translated 
			icon: [ :each | 
				each first
					ifTrue: [ BrGlamorousIcons folder ]
					ifFalse: [ BrGlamorousIcons file ] ];
		column: 'Name' translated text: [ :each | each second ];
		column: 'Size' translated
			text: [ :each | each third ]
			width: 100;
		column: 'Creation' translated
			text: [ :each | each fourth ];
		send: [ :item | item fifth ]
]

{ #category : #testing }
PlpoAbstractFileReference >> isDirectory [

	^ self proxyPerform: #isDirectory
]
