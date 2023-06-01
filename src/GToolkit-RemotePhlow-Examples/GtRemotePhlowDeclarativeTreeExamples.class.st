Class {
	#name : #GtRemotePhlowDeclarativeTreeExamples,
	#superclass : #Object,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #examples }
GtRemotePhlowDeclarativeTreeExamples >> emptyTree [
	<gtExample>
	| view |

	view := GtRemotePhlowProtoView new tree.
	self assert: view class equals: GtRemotePhlowTreeView.
	^ view
]

{ #category : #examples }
GtRemotePhlowDeclarativeTreeExamples >> expectedFormattedItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'1'); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'2'); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'3'); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'4'); yourself)); add: (#nodeId->4); yourself); yourself)
]

{ #category : #examples }
GtRemotePhlowDeclarativeTreeExamples >> sentItemAt [
	"<gtExample>"
	| treeView declarativeView sentItem sentItems |

	treeView := self treeViewWithItemsAndChildren.
	declarativeView := treeView asGtDeclarativeView.
	sentItems := (1 to: 4) collect: [ :i | treeView sentItemAt: { i } ].
	self assert: sentItems equals: #(1 2 3 4).
	sentItem := treeView sentItemAt: #(2 1).
	self assert: sentItem equals: 1.
	sentItem := treeView sentItemAt: #(3 1).
	self assert: sentItem equals: 1.
	sentItem := treeView sentItemAt: #(4 1).
	self assert: sentItem equals: 1.
	sentItem := treeView sentItemAt: #(4 2).
	self assert: sentItem equals: 2.
	sentItem := treeView sentItemAt: #(4 2 1).
	self assert: sentItem equals: 1.
	^ treeView
]

{ #category : #examples }
GtRemotePhlowDeclarativeTreeExamples >> treeViewWithItemsAndChildren [
	<gtExample>
	| aView declarativeView |

	aView := self emptyTree.
	aView 
		items: [ 1 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0
				ifTrue: [ #() ]
				ifFalse: [ 1 to: aNumber // 2 ] ].
	declarativeView := aView asGtDeclarativeView.
	
	self 
		assert: declarativeView retrieveTotalItemsCount  
		equals: 4.
	self 
		assert: declarativeView retriveFormattedItems 
		equals: self expectedFormattedItems.
	 
	^ aView
]
