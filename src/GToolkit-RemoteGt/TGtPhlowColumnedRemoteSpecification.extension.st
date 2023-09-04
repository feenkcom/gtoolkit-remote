Extension { #name : #TGtPhlowColumnedRemoteSpecification }

{ #category : #'*GToolkit-RemoteGt' }
TGtPhlowColumnedRemoteSpecification >> buildRemoteColumnsSpecifications [
	^self columns collect: [ :aColumn | 
		GtRemotePhlowColumnSpecification new
			title: aColumn title;
			cellWidth: (aColumn cellWidth ifNotNil: [ :aCellWidth |
				aCellWidth class = BrColumnFixedWidth
					ifTrue: [ aCellWidth width ]
					ifFalse: [nil]]);
			type: aColumn asGtDeclarativeColumnDataType;
			spawnsObjects:  aColumn isSpawningObject;
			in: [ :aColumnSpecification |
				aColumn hasBackgroundComputation ifTrue: [ 
					aColumnSpecification  markAsHavingBackground ].
				aColumnSpecification ] ] as: Array
]

{ #category : #'*GToolkit-RemoteGt' }
TGtPhlowColumnedRemoteSpecification >> canBeGtDeclarativeView [
	"Answer a boolean indicating whether the receiver can be represented as a GtDeclarativeView"

	^ self columns allSatisfy: [ :aColumn | aColumn canBeForGtDeclarativeView ]
]
