Class {
	#name : 'GtRemoteSearchGroupResult',
	#superclass : 'GtSearchGroupResult',
	#category : 'GToolkit-RemoteGt'
}

{ #category : 'accessing' }
GtRemoteSearchGroupResult >> gtItemsFor: aView [

	<gtView>
	self refreshItems.
	^ aView forward
		  title: 'Live';
		  priority: 10;
		  object: [ 
			  filter filter result
				  gtRemoteItems: items;
				  yourself ];
		  view: #gtItemsFor:
]

{ #category : 'accessing' }
GtRemoteSearchGroupResult >> refreshItems [

	filtered ifTrue: [ ^ self ].
	filter ifNotNil: [ 
		| result |
		result := GtPharoLinkCodeSync default
			          do: [ :f | f result refreshItems ]
			          with: filter filter.
		items := result instVarNamed: #items ].
	filtered := true
]
