Class {
	#name : 'GtRemotePhlowDeclarativeTreeExamples',
	#superclass : 'Object',
	#category : 'GToolkit-RemotePhlow-Examples'
}

{ #category : 'examples' }
GtRemotePhlowDeclarativeTreeExamples >> emptyTree [
	<gtExample>
	| view |

	view := GtRemotePhlowDeclarativeProtoView new tree.
	self assert: view class equals: GtRemotePhlowDeclarativeTree.
	^ view
]

{ #category : 'examples' }
GtRemotePhlowDeclarativeTreeExamples >> sentItemAt [
	<gtExample>
	| treeView sentItem sentItems |

	treeView := self treeViewWithItemsAndChildren.
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

{ #category : 'examples' }
GtRemotePhlowDeclarativeTreeExamples >> treeViewWithItemsAndChildren [
	<gtExample>
	| aView data |

	aView := self emptyTree.
	aView 
		items: [ 1 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0
				ifTrue: [ #() ]
				ifFalse: [ 1 to: aNumber // 2 ] ].
	data := aView data.
	self assert: data size equals: 4.
	self assert: data first equals: #('1' #(1) #()).
	self assert: data last equals:  #('4' #(4) #(#('1' #(4 1) #()) #('2' #(4 2) #(#('1' #(4 2 1) #()))))).
	^ aView
]
