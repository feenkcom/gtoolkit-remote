Class {
	#name : #GtRemotePhlowViewSpecificationConversionExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertColumnedList [
	"Demonstrate converting a columned list phlow view to a declarative specification"

	<gtExample>
	| phlowView declarativeSpecification |
	phlowView := self createProtoViews columnedList
			title: #Test;
			priority: 10;
			items: [ #(1 2 3) ];
			column: 'One' text: [ :item | item ];
			column: 'Two'
				text: [ :item | item asString ]
				width: 100.
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 10.
	self assert: declarativeSpecification columnTitles equals: #('One' 'Two').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).
	
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedColumnedListWithNumbersItems.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertColumnedListWithTextColumns [
	"Check the conversion to declarative specification with data"
	<gtExample>
	| declarativeSpecification |

	declarativeSpecification := (GtRemotePhlowDeclarativeTestInspectable new 
		gtColumnedListFor: self createProtoViews) asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Columned list'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification columnTitles equals: #('Value' 'Lowercase').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).
	
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedColumnedListForExampleObjectItems.
	
	^ declarativeSpecification

]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertColumnedListWithTypedColumns [
	"Check the conversion to declarative specification with data"
	<gtExample>
	| declarativeSpecification |

	declarativeSpecification := (GtRemotePhlowDeclarativeTestInspectable new 
		gtColumnedListWithTypedColumnsFor: self createProtoViews)
			asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Columned list with typed columns'.
	self assert: declarativeSpecification priority equals: 24.
	self 
		assert: (declarativeSpecification columnSpecifications 
			collect: [ :aColumnSpecification | aColumnSpecification typeLabel ])
		equals: #('text' 'number' 'icon').
	self 
		assert: declarativeSpecification columnTitles 
		equals: #('Text' 'Number' 'Icon Name').
	self 
		assert: declarativeSpecification columnWidths 
		equals: #(nil 100 75).
	
	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertColumnedTree [
	"Demonstrate converting a columned tree phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := self createProtoViews columnedTree
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
	self assert: declarativeSpecification columnTitles equals: #('One' 'Two').
	self assert: declarativeSpecification columnWidths equals: #(nil 100).
	
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedColumnedTreeWithNumberItems.

	^ declarativeSpecification.
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertListWithNumbers [
	"Demonstrate converting a columned list phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := self createProtoViews list
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
GtRemotePhlowViewSpecificationConversionExamples >> convertListWithObjects [
	"Check the conversion to declarative specification with data"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtRemotePhlowDeclarativeTestInspectable new 
		gtListFor: self createProtoViews.
	declarativeSpecification := phlowView asGtDeclarativeView.
	
	self assert: declarativeSpecification title equals: 'List'.
	self assert: declarativeSpecification priority equals: 15.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedListForExampleObjectItems.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertListWithStyledText [
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := GtRemotePhlowDeclarativeTestInspectable new 
		gtListWithStyledTextFor: self createProtoViews.
	declarativeSpecification := phlowView asGtDeclarativeView.
	
	self assert: declarativeSpecification title equals: 'List - styled text'.
	self assert: declarativeSpecification priority equals: 15.1.
	self 
		assert: declarativeSpecification retriveFormattedItems 
		equals: self expectedListForStyledText.

	^ declarativeSpecification
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertText [
	"Demonstrate converting a columned list phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := self createProtoViews text
		title: #Test;
		priority: 11;
		text: [ 'hello world' ].
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: #Test.
	self assert: declarativeSpecification priority equals: 11.
	
	self 
		assert: declarativeSpecification retrieveStylableText 
		equals: self expectedTextEditorBasicStringStylableTextData.

	^ declarativeSpecification.
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertTextEditor [
	"Demonstrate converting a columned list phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := self createProtoViews textEditor
		title: 'String (editor)';
		priority: 11;
		text: [ 'hello world' ].
	declarativeSpecification := phlowView asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'String (editor)'.
	self assert: declarativeSpecification priority equals: 11.
	self assert: declarativeSpecification string equals: nil.
	
	self 
		assert: declarativeSpecification retrieveStylableText 
		equals: self expectedTextEditorBasicStringStylableTextData.

	^ declarativeSpecification.
]

{ #category : #examples }
GtRemotePhlowViewSpecificationConversionExamples >> convertTree [
	"Demonstrate converting a tree phlow view to a declarative specification"
	<gtExample>
	| phlowView declarativeSpecification |

	phlowView := self createProtoViews tree
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

{ #category : #accessing }
GtRemotePhlowViewSpecificationConversionExamples >> createProtoViews [
	^ GtRemotePhlowProtoView new
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedColumnedListForExampleObjectItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'42'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'42'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'Hello World'); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'hello world'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2021-04-06T14:43:50.123456+02:00'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'2021-04-06t14:43:50.123456+02:00'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedColumnedListWithNumbersItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'1'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'1'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'2'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'3'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'3'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedColumnedTreeWithNumberItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'1'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'2'); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'3'); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'3'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'4'); yourself); yourself)); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 2) at: 1 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'4'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself); at: 2 put: ((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'5'); yourself); yourself)); yourself)); add: (#nodeId->4); yourself); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedListForExampleObjectItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'42'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'Hello World'); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2021-04-06T14:43:50.123456+02:00'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedListForStyledText [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'42'); add: ('attributeRuns'->((Dictionary new) add: ('items'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->2); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontWeightAttribute'); add: ('weight'->#bold); yourself); yourself)); yourself); yourself)); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'Hello World'); add: ('attributeRuns'->((Dictionary new) add: ('items'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->5); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 2) at: 1 put: ((Dictionary new) add: ('color'->((Dictionary new) add: (#a->1.0); add: (#r->1.0); add: (#g->1.0); add: (#b->0.0); yourself)); add: ('__typeLabel'->'phlowTextHighlightAttribute'); yourself); at: 2 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontSizeAttribute'); add: ('size'->20); yourself); yourself)); yourself); yourself)); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'Now is the time'); add: ('attributeRuns'->((Dictionary new) add: ('items'->((Array new: 9) at: 1 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->4); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontWeightAttribute'); add: ('weight'->#bold); yourself); yourself)); yourself); at: 2 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->11); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('name'->'Source Code Pro'); add: ('__typeLabel'->'phlowFontNameAttribute'); yourself); yourself)); yourself); at: 3 put: ((Dictionary new) add: ('startIndex'->5); add: ('endIndex'->6); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('color'->((Dictionary new) add: (#a->1.0); add: (#r->1.0); add: (#g->1.0); add: (#b->0.0); yourself)); add: ('__typeLabel'->'phlowTextHighlightAttribute'); yourself); yourself)); yourself); at: 4 put: ((Dictionary new) add: ('startIndex'->12); add: ('endIndex'->15); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontSizeAttribute'); add: ('size'->20); yourself); yourself)); yourself); at: 5 put: ((Dictionary new) add: ('startIndex'->8); add: ('endIndex'->10); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('color'->((Dictionary new) add: (#a->1.0); add: (#r->1.0); add: (#g->0.0); add: (#b->0.0); yourself)); add: ('__typeLabel'->'phlowTextForegroundAttribute'); yourself); yourself)); yourself); at: 6 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->6); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontEmphasisAttribute'); add: ('emphasis'->'italic'); yourself); yourself)); yourself); at: 7 put: ((Dictionary new) add: ('startIndex'->8); add: ('endIndex'->15); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontWeightAttribute'); add: ('weight'->#thin); yourself); yourself)); yourself); at: 8 put: ((Dictionary new) add: ('startIndex'->12); add: ('endIndex'->12); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('name'->'Source Sans Pro'); add: ('__typeLabel'->'phlowFontNameAttribute'); yourself); yourself)); yourself); at: 9 put: ((Dictionary new) add: ('startIndex'->13); add: ('endIndex'->15); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('name'->'Source Code Pro'); add: ('__typeLabel'->'phlowFontNameAttribute'); yourself); yourself)); yourself); yourself)); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'Now is the time'); add: ('attributeRuns'->((Dictionary new) add: ('items'->((Array new: 9) at: 1 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->4); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontWeightAttribute'); add: ('weight'->#bold); yourself); yourself)); yourself); at: 2 put: ((Dictionary new) add: ('startIndex'->5); add: ('endIndex'->6); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('color'->((Dictionary new) add: (#a->1.0); add: (#r->1.0); add: (#g->1.0); add: (#b->0.0); yourself)); add: ('__typeLabel'->'phlowTextHighlightAttribute'); yourself); yourself)); yourself); at: 3 put: ((Dictionary new) add: ('startIndex'->12); add: ('endIndex'->15); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontSizeAttribute'); add: ('size'->20); yourself); yourself)); yourself); at: 4 put: ((Dictionary new) add: ('startIndex'->8); add: ('endIndex'->10); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('color'->((Dictionary new) add: (#a->1.0); add: (#r->1.0); add: (#g->0.0); add: (#b->0.0); yourself)); add: ('__typeLabel'->'phlowTextForegroundAttribute'); yourself); yourself)); yourself); at: 5 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->6); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontEmphasisAttribute'); add: ('emphasis'->'italic'); yourself); yourself)); yourself); at: 6 put: ((Dictionary new) add: ('startIndex'->8); add: ('endIndex'->15); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('__typeLabel'->'phlowFontWeightAttribute'); add: ('weight'->#thin); yourself); yourself)); yourself); at: 7 put: ((Dictionary new) add: ('startIndex'->12); add: ('endIndex'->12); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('name'->'Source Sans Pro'); add: ('__typeLabel'->'phlowFontNameAttribute'); yourself); yourself)); yourself); at: 8 put: ((Dictionary new) add: ('startIndex'->1); add: ('endIndex'->11); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('name'->'Source Code Pro'); add: ('__typeLabel'->'phlowFontNameAttribute'); yourself); yourself)); yourself); at: 9 put: ((Dictionary new) add: ('startIndex'->13); add: ('endIndex'->15); add: ('__typeLabel'->'phlowRun'); add: ('attributes'->((Array new: 1) at: 1 put: ((Dictionary new) add: ('name'->'Source Code Pro'); add: ('__typeLabel'->'phlowFontNameAttribute'); yourself); yourself)); yourself); yourself)); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->4); yourself); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedListWithNumberItems [
	^ ((Array new: 3) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'Number: 1'); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'Number: 2'); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->'Number: 3'); yourself)); add: (#nodeId->3); yourself); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedTextEditorBasicStringStylableTextData [
	^ ((Dictionary new) add: ('string'->'hello world'); add: ('__typeLabel'->'remotePhlowText'); add: ('stylerSpecification'->((Dictionary new) add: ('__typeLabel'->'remotePhlowTextAttributeRunsStylerSpecification'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)
]

{ #category : #'accessing - data' }
GtRemotePhlowViewSpecificationConversionExamples >> expectedTreeWithNumberItems [
	^ ((Array new: 4) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'1'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'2'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->2); yourself); at: 3 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'3'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->3); yourself); at: 4 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#valueTypeName->'textualValue'); add: (#itemText->((Dictionary new) add: ('__typeLabel'->'gtPhlowRunBasedText'); add: ('sourceString'->'4'); add: ('attributeRuns'->((Dictionary new) add: ('items'->#()); add: ('__typeLabel'->'phlowRunsGroup'); yourself)); yourself)); yourself)); add: (#nodeId->4); yourself); yourself)
]
