Class {
	#name : #GtDeclarativeViewConversionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertColumnedList [
	"Demonstrate converting a columned list phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtPhlowProtoView new columnedList
		title: #Test;
		priority: 10;
		items: [ #(1 2 3) ];
		column: 'One' text: [ :item | item ];
		column: 'Two' text: [ :item | item asString ] width: 100.
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 10.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedColumnedListWithNumbersItems.
	self assert: declarativeSpecification columnTitles equals: #('One' 'Two').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).

	^ declarativeSpecification.
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertColumnedTree [
	"Demonstrate converting a columned tree phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtPhlowProtoView new columnedTree
		title: #Test;
		priority: 10;
		items: [ 1 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0
				ifTrue: [ #() ]
				ifFalse: [ 1 to: aNumber // 2 ] ];
		column: 'One' text: [ :item | item ];
		column: 'Two' text: [ :item | (item + 1) asString ] width: 100.
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 10.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedColumnedTreeWithNumberItems.
	self assert: declarativeSpecification columnTitles equals: #('One' 'Two').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).

	^ declarativeSpecification.
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertGtDeclarativeTestInspectableColumnedList [
	"Check the conversion to declarative specification with data"
	<gtExample>
	| declarativeSpecification |

	declarativeSpecification := (GtRemotePhlowDeclarativeTestInspectable new 
		gtColumnedListFor: GtPhlowProtoView new) asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Columned list'.
	self assert: declarativeSpecification priority equals: 20.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedColumnedListForExampleObjectItems.
	self assert: declarativeSpecification columnTitles equals: #('Value' 'Lowercase').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).
	
	^ declarativeSpecification

]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertGtDeclarativeTestInspectableList [
	"Check the conversion to declarative specification with data"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtRemotePhlowDeclarativeTestInspectable new 
		gtListFor: GtPhlowProtoView new.
	declarativeSpecification := phlowView asGtDeclarativeView.
	
	self assert: declarativeSpecification title equals: 'List'.
	self assert: declarativeSpecification priority equals: 15.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedListForExampleObjectItems.

	^ declarativeSpecification
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertGtDeclarativeTestInspectableText [
	"Check the conversion to declarative specification with data"
	<gtExample>
	| declarativeSpecification |

	declarativeSpecification := (GtRemotePhlowDeclarativeTestInspectable new 
		gtStringFor: GtPhlowProtoView new) asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'String'.
	self assert: declarativeSpecification priority equals: 10.
	self assert: declarativeSpecification string equals: 'hello world'.
	
	^ declarativeSpecification

]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertList [
	"Demonstrate converting a columned list phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtPhlowProtoView new list
		title: #Test;
		priority: 10;
		items: [ #(1 2 3) ];
		itemText: [ :item | 'Number: ', item asString ].
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 10.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedListWithNumberItems.

	^ declarativeSpecification.
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertText [
	"Demonstrate converting a columned list phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtPhlowProtoView new textEditor
		title: #Test;
		priority: 10;
		text: [ #HelloWorld ].
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 10.
	self assert: declarativeSpecification string equals: #HelloWorld.

	^ declarativeSpecification.
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertTree [
	"Demonstrate converting a tree phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtPhlowProtoView new tree
		title: #Test;
		priority: 10;
		items: [ 1 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0
				ifTrue: [ #() ]
				ifFalse: [ 1 to: aNumber // 2 ] ].
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 10.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedTreeWithNumberItems.

	^ declarativeSpecification.
]

{ #category : #'accessing - data' }
GtDeclarativeViewConversionExamples >> expectedColumnedListForExampleObjectItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'42'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'42'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'Hello World'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'hello world'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'2021-04-06T14:43:49.623384+02:00'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'2021-04-06t14:43:49.623384+02:00'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtDeclarativeViewConversionExamples >> expectedColumnedListWithNumbersItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'1'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'1'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'2'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'2'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'3'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'3'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtDeclarativeViewConversionExamples >> expectedColumnedTreeWithNumberItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'1'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'2'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'2'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'3'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'3'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'4'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#itemText->'4'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'5'); yourself); yourself)); yourself)); add: (#nodeId->4); yourself); yourself)
]

{ #category : #'accessing - data' }
GtDeclarativeViewConversionExamples >> expectedListForExampleObjectItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'42'); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'Hello World'); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'2021-04-06T14:43:49.623384+02:00'); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtDeclarativeViewConversionExamples >> expectedListWithNumberItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'Number: 1'); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'Number: 2'); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'Number: 3'); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtDeclarativeViewConversionExamples >> expectedTreeWithNumberItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'1'); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'2'); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'3'); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#itemText->'4'); yourself)); add: (#nodeId->4); yourself); yourself)
]
