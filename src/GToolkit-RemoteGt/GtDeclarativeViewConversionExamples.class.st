Class {
	#name : #GtDeclarativeViewConversionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertColumnedList [
	"Demonstrate converting a columned list phlow view to a declarative view"
	<gtExample>
	| phlowView declarativeView |

	phlowView := GtPhlowProtoView new columnedList
		title: #Test;
		priority: 10;
		items: [ #(1 2 3) ];
		column: 'One' text: [ :item | item ];
		column: 'Two' text: [: item | item asString ] width: 100.
	declarativeView := phlowView asGtDeclarativeView.

	self assert: declarativeView title equals: #Test.
	self assert: declarativeView priority equals: 10.
	self assert: declarativeView items equals: #(#('1' '1') #('2' '2') #('3' '3')).
	self assert: declarativeView columnTitles equals: #('One' 'Two').
	self assert: declarativeView columnWidths equals: #(nil 100).

	^ declarativeView.
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertGtDeclarativeTestInspectableColumnedList [
	"Check the conversion to declarative views with data"
	<gtExample>
	| declarativeView |

	declarativeView := (GtDeclarativeTestInspectable new gtColumnedListFor: GtPhlowProtoView new) asGtDeclarativeView.

	self assert: declarativeView title equals: 'Columned List'.
	self assert: declarativeView priority equals: 20.
	self assert: declarativeView items equals: #(#('42' '42') #('Hello World' 'hello world') #('2021-04-06T14:43:49.623384+02:00' '2021-04-06t14:43:49.623384+02:00')).
	self assert: declarativeView columnTitles equals: #('Value' 'Lowercase').
	self assert: declarativeView columnWidths equals: #(nil 100).

]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertGtDeclarativeTestInspectableList [
	"Check the conversion to declarative views with data"
	<gtExample>
	| declarativeView |

	declarativeView := (GtDeclarativeTestInspectable new gtListFor: GtPhlowProtoView new) asGtDeclarativeView.

	self assert: declarativeView title equals: 'List'.
	self assert: declarativeView priority equals: 15.
	self assert: declarativeView items equals: #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00').

]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertGtDeclarativeTestInspectableText [
	"Check the conversion to declarative views with data"
	<gtExample>
	| declarativeView |

	declarativeView := (GtDeclarativeTestInspectable new gtStringFor: GtPhlowProtoView new) asGtDeclarativeView.

	self assert: declarativeView title equals: 'String'.
	self assert: declarativeView priority equals: 10.
	self assert: declarativeView string equals: 'hello world'.

]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertList [
	"Demonstrate converting a columned list phlow view to a declarative view"
	<gtExample>
	| phlowView declarativeView |

	phlowView := GtPhlowProtoView new list
		title: #Test;
		priority: 10;
		items: [ #(1 2 3) ];
		itemText: [ :item | 'Number: ', item asString ].
	declarativeView := phlowView asGtDeclarativeView.

	self assert: declarativeView title equals: #Test.
	self assert: declarativeView priority equals: 10.
	self assert: declarativeView items equals: #('Number: 1' 'Number: 2' 'Number: 3').

	^ declarativeView.
]

{ #category : #examples }
GtDeclarativeViewConversionExamples >> convertText [
	"Demonstrate converting a columned list phlow view to a declarative view"
	<gtExample>
	| phlowView declarativeView |

	phlowView := GtPhlowProtoView new textEditor
		title: #Test;
		priority: 10;
		text: [ #HelloWorld ].
	declarativeView := phlowView asGtDeclarativeView.

	self assert: declarativeView title equals: #Test.
	self assert: declarativeView priority equals: 10.
	self assert: declarativeView string equals: #HelloWorld.

	^ declarativeView.
]
