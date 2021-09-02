Class {
	#name : 'GtPhlowDeclarativeListingType',
	#superclass : 'Object',
	#instVars : [
		'type'
	],
	#classVars : [
		'Icon',
		'IconifiedLink',
		'Text',
		'TextualLink',
		'Unknown'
	],
	#category : 'GToolkit-RemotePhlow-DeclarativeViews'
}

{ #category : 'initialization' }
GtPhlowDeclarativeListingType class >> initialize [	
	Icon := #icon.
	IconifiedLink := #iconLink.
	Text := #text.
	TextualLink := #textLink.
	Unknown := #unknown
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> asString [
	^ type
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> beIcon [
	type := Icon
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> beIconLink [
	type := IconifiedLink
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> beText [
	type := Text
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> beTextLink [
	type := TextLink
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> beUnknown [
	type := Unknown
]

{ #category : 'accessing' }
GtPhlowDeclarativeListingType >> ifIcon: anIconBlock ifIconLink: anIconLinkBlock ifText: aTextBlock ifTextLink: aTextLinkBlock ifUnknown: anUnknownBlock [
	type = Icon
		ifTrue: [ ^ anIconBlock value ].
		
	type = IconifiedLink
		ifTrue: [ ^ anIconLinkBlock value ].
		
	type = Text
		ifTrue: [ ^ aTextBlock value ].
		
	type = TextualLink
		ifTrue: [ ^ aTextLinkBlock value ].
		
	type = Unknown
		ifTrue: [ ^ anUnknownBlock value ].
		
	self error: ('Unsupported listing view type: {1}' format: { type })
]

{ #category : 'initialization' }
GtPhlowDeclarativeListingType >> initialize [
	super initialize.
	
	type := Unknown
]

{ #category : 'testing' }
GtPhlowDeclarativeListingType >> isUnknown [
	^ type = Unknown
]
