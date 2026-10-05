Extension { #name : 'OrderedCollection' }

{ #category : '*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
OrderedCollection >> gtItemsFor: aView [
	^(super gtItemsFor: aView)
	dynamicPhlowContextItems: [ :anAction :anElement :anObject :aSelection |
			| nodeLabels |
			
			nodeLabels := OrderedCollection new .
			aSelection nodeIdentifiersDo: [ :aNodeIdentifier |
				nodeLabels add: aNodeIdentifier description ].
				
			{anAction button
				icon: GtPhlowGlamorousVectorIconNameStencil remove ;
				label: 'Remove';
				menuItemPreview: (nodeLabels size = 1 
					ifTrue: [ 'item with index ', nodeLabels first  ] 
					ifFalse: [ 'items with indexes ', (String streamContents: [ :aStream | 
						nodeLabels 
							do: [ :each | aStream nextPutAll: each ] 
							separatedBy: [ aStream nextPutAll: ', ']  ]) ]);
				action: [ :currentAction | 
					| identifiersToRemove |
					identifiersToRemove := OrderedCollection new.
					aSelection nodeIdentifiersDo: [ :aNodeIdentifier | 
						identifiersToRemove add: aNodeIdentifier nodeIndex ].
					identifiersToRemove sort.
					identifiersToRemove reverseDo: [ :anIndentifier |
						self removeAtIndex: anIndentifier ].
					currentAction phlow fireViewUpdateWish ]} ]
]
