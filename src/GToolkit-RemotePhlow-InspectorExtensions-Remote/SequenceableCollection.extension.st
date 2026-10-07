Extension { #name : #SequenceableCollection }

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
SequenceableCollection >> gtActionCompareObjectsFor: anAction [
      <gtAction>

      (self size < 2 or: [ self size > 5 ]) ifTrue: [ ^ anAction empty ].
      ^ anAction button
              priority: 100;
              target: GtRemotePhlowObjectContextMenuTarget;
              id: (GtRemotePhlowNamedId named: #'remote-compare-objects');
              tooltip: 'Compare the objects';
              icon: (GtPhlowGlamorousVectorIconNameStencil forIconName: #empty);
			  menuItemGroup: GtRemotePhlowMenuItemGroupConfiguration navigation;
			  menuItemPreview: [self gtDisplayText ];
              action: [ :aButton |
                      aButton phlow spawnObject:
                              (GtRemotePhlowObjectComparer compareAll: self) ]
]

{ #category : #'*GToolkit-RemotePhlow-InspectorExtensions-Remote' }
SequenceableCollection >> gtItemsFor: aView [
	^ aView columnedList
		title: 'Items';
		priority: 50;
		items: [ self ];
		withMultipleSelection;
		column: 'Index' 
			text: [ :eachItem :eachIndex | eachIndex  ]
			width: 45;
		column: 'Item' 
			text: [ :eachItem | eachItem gtDisplayString ];
		contextActionsForTarget: GtRemotePhlowObjectContextMenuTarget
]
