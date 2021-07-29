! Class Declarations
! Generated file, do not Edit

doit
(Object
	subclass: 'GtGemStoneRPackage'
	instVarNames: #( name )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'Gtoolkit-RemoteCoder-GemStone';
		immediateInvariant.
true.
%

removeallmethods GtGemStoneRPackage
removeallclassmethods GtGemStoneRPackage

doit
(Object
	subclass: 'GtRemotePhlowDeclarativeProtoView'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeProtoView
removeallclassmethods GtRemotePhlowDeclarativeProtoView

doit
(Object
	subclass: 'GtRemotePhlowDeclarativeTestInspectable'
	instVarNames: #( string collectionOfObjects )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-Examples';
		comment: 'GtDeclarativeTestInspectable is a simple object that can be used to test the Gt declarative views. 

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	collectionOfObjects:		<Array>  a collection of objects for displaying in lists
	string:		<String> for displaying in a text view
';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeTestInspectable
removeallclassmethods GtRemotePhlowDeclarativeTestInspectable

doit
(Object
	subclass: 'GtRemotePhlowDeclarativeTreeExamples'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-Examples';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeTreeExamples
removeallclassmethods GtRemotePhlowDeclarativeTreeExamples

doit
(Object
	subclass: 'GtRemotePhlowDeclarativeView'
	instVarNames: #( accessor methodName title priority dataTransport )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		comment: 'GtDeclarativeView provides a declarative UI specification for presenting data that can be easily serialised and sent over the wire, including between applications written in different languages.

dataTransport is an emumerated value indicating whether the data to be displayed will be included with the specification or is available via reference or by key.]

- 1: data is included in the response
- 2: data is available by reference
- 3: data is available by reference and key (tbc)


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	dataTransport:		<Object>


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeView
removeallclassmethods GtRemotePhlowDeclarativeView

doit
(GtRemotePhlowDeclarativeView
	subclass: 'GtRemotePhlowDeclarativeColumnedList'
	instVarNames: #( items itemsBuilder columnValues columnTitles columnWidths sendBlock )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		comment: 'GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

- Only matchParent and fixed column widths are supported

!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send
';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeColumnedList
removeallclassmethods GtRemotePhlowDeclarativeColumnedList

doit
(GtRemotePhlowDeclarativeView
	subclass: 'GtRemotePhlowDeclarativeList'
	instVarNames: #( items itemsBuilder itemTextBlock totalItemsCount )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		comment: 'GtDeclarativeList supports a subset of the possible configurations of ${class:name=GtPhlowListView}.

 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	itemsBuilder: 	<BlockClosure> - A BlockClosure that will return the (unformatted) list of items to be displayed.
	items:				<Array> - The formatted items to display (not the raw values held in the list)
	itemTextBlock: 	<BlockClosure> - A BlockClosure (or Symbol) that converts each item to its displayed format.  The result of the BlockClosure must be a JSON primitive type, effectively a string or number.


!!!Implementation Points';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeList
removeallclassmethods GtRemotePhlowDeclarativeList

doit
(GtRemotePhlowDeclarativeView
	subclass: 'GtRemotePhlowDeclarativeTable'
	instVarNames: #( items )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeTable
removeallclassmethods GtRemotePhlowDeclarativeTable

doit
(GtRemotePhlowDeclarativeView
	subclass: 'GtRemotePhlowDeclarativeTextEditor'
	instVarNames: #( textBuilder )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeTextEditor
removeallclassmethods GtRemotePhlowDeclarativeTextEditor

doit
(GtRemotePhlowDeclarativeView
	subclass: 'GtRemotePhlowDeclarativeTree'
	instVarNames: #( itemsBuilder itemTextBlock childrenBlock )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		comment: 'GtPharoDeclarativeTree maps to GtPhlowTreeView in Gt.

When transporting the data, each node in the tree is represented as an Array with three slots:
1. The item''s textual representation
2. The index.  This is an array of indices to the nodes location.
3. An Array of child nodes.
';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeTree
removeallclassmethods GtRemotePhlowDeclarativeTree

doit
(Object
	subclass: 'GtRemotePhlowViewCache'
	instVarNames: #( viewedObject viewSelector view declarativeView cachedData )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowViewCache
removeallclassmethods GtRemotePhlowViewCache

doit
(Object
	subclass: 'GtRemotePhlowViewedObject'
	instVarNames: #( object viewCache )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow';
		comment: 'GtViewedObject is responsible for serving declarative views to the client inspector.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowViewedObject
removeallclassmethods GtRemotePhlowViewedObject

! Class implementation for 'GtGemStoneRPackage'

!		Class methods for 'GtGemStoneRPackage'

category: 'instance creation'
classmethod: GtGemStoneRPackage
named: aSymbol

	^ self new name: aSymbol
%

!		Instance methods for 'GtGemStoneRPackage'

category: 'accessing'
method: GtGemStoneRPackage
classes
	| nameString |

	nameString := name asString.
	^ self gtAllClasses select: [ :each | each _classCategory = nameString ]
%

category: 'private'
method: GtGemStoneRPackage
gtAllClasses
	"A hack to figure out all classes"
	| allClasses |

	allClasses := Array new.
	System myUserProfile symbolList
		do: [ :dict | allClasses addAll: (dict select: [ :each | each isBehavior ]) ].
	^ allClasses
%

category: 'accessing'
method: GtGemStoneRPackage
name

	^ name
%

category: 'accessing'
method: GtGemStoneRPackage
name: aSymbol

	name := aSymbol asSymbol
%

! Class implementation for 'GtRemotePhlowDeclarativeProtoView'

!		Instance methods for 'GtRemotePhlowDeclarativeProtoView'

category: 'decorating'
method: GtRemotePhlowDeclarativeProtoView
columnedList

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeColumnedList
%

category: 'private'
method: GtRemotePhlowDeclarativeProtoView
declarativeViewOfType: aGtDeclarativeViewClass
	"Answer a new declarative view instance"

	^ aGtDeclarativeViewClass new.
%

category: 'decorating'
method: GtRemotePhlowDeclarativeProtoView
list

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeList
%

category: 'decorating'
method: GtRemotePhlowDeclarativeProtoView
table

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTable
%

category: 'decorating'
method: GtRemotePhlowDeclarativeProtoView
textEditor

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTextEditor
%

category: 'decorating'
method: GtRemotePhlowDeclarativeProtoView
tree

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTree
%

! Class implementation for 'GtRemotePhlowDeclarativeTestInspectable'

!		Instance methods for 'GtRemotePhlowDeclarativeTestInspectable'

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
collectionAt: anIndex put: anObject

	^collectionOfObjects at: anIndex put: anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
collectionOfObjects
	^ collectionOfObjects
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
collectionOfObjects: anObject
	collectionOfObjects := anObject
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtColumnedListFor: aView
	<gtView>

	^aView columnedList
		title: 'Columned List';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' item: [ :anObject | anObject asString ];
		column: 'Lowercase' item: [ :anObject | anObject asString asLowercase ] width: 100.
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeListFor: aView
	<gtView>

	^aView list
		title: 'Large List';
		priority: 20;
		items: [ 1 to: 1022 ];
		itemText: [ :item | item asString ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtListFor: aView
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item asString ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtStringFor: aView
	<gtView>

	^aView textEditor
		title: 'String';
		priority: 10;
		text: [ self string ]
%

category: 'initialization'
method: GtRemotePhlowDeclarativeTestInspectable
initialize 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime now. "readFrom: '2021-04-06T14:43:49.623384+02:00' readStream." }.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
string

	^string
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
string: anObject
	string := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
text

	^string asRopedText 
%

! Class implementation for 'GtRemotePhlowDeclarativeTreeExamples'

!		Instance methods for 'GtRemotePhlowDeclarativeTreeExamples'

category: 'examples'
method: GtRemotePhlowDeclarativeTreeExamples
emptyTree
	<gtExample>
	| view |

	view := GtRemotePhlowDeclarativeProtoView new tree.
	self assert: view class equals: GtRemotePhlowDeclarativeTree.
	^ view
%

category: 'examples'
method: GtRemotePhlowDeclarativeTreeExamples
sentItemAt
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
%

category: 'examples'
method: GtRemotePhlowDeclarativeTreeExamples
treeViewWithItemsAndChildren
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
%

! Class implementation for 'GtRemotePhlowDeclarativeView'

!		Class methods for 'GtRemotePhlowDeclarativeView'

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeView
accessor: aGtDViewAccessor
	"Answer the view specified by the supplied accessor"

	^(self fromJSONString: aGtDViewAccessor asJSONForExport)
		accessor: aGtDViewAccessor;
		yourself
%

category: 'data transport'
classmethod: GtRemotePhlowDeclarativeView
dataByKey
	"Answer the enumerated value for the display data being accessed by reference and key"

	^4
%

category: 'data transport'
classmethod: GtRemotePhlowDeclarativeView
dataByReference
	"Answer the enumerated value for the display data being accessed by reference"

	^3
%

category: 'data transport'
classmethod: GtRemotePhlowDeclarativeView
dataIncluded
	"Answer the enumerated value for the display data being included with the specification"

	^1
%

category: 'data transport'
classmethod: GtRemotePhlowDeclarativeView
dataLazy
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
%

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeView
fromDictionary: viewDictionary
	"Answer the view specified by viewDictionary"
	| viewName |

	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(self globalsDictionary at: viewName asSymbol) fromJSONDictionary: viewDictionary.
%

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeView
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		yourself
%

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeView
fromJSONString: aString
	"Answer the view specified by aString"

	| viewDictionary viewName |

	viewDictionary := self readJsonString: aString.
	viewName := viewDictionary at: #viewName.
	(viewName -> viewDictionary) asBeaconSignal emit.
	^(self globalsDictionary at: viewName asSymbol) fromJSONDictionary: viewDictionary.
%

!		Instance methods for 'GtRemotePhlowDeclarativeView'

category: 'accessing'
method: GtRemotePhlowDeclarativeView
accessor
	^ accessor
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
accessor: anObject
	accessor := anObject
%

category: 'converting'
method: GtRemotePhlowDeclarativeView
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^Dictionary new 
		at: #viewName put: self viewName;
		at: #title put: title;
		at: #priority put: priority;
		at: #dataTransport put: dataTransport;
		yourself
%

category: 'serialization'
method: GtRemotePhlowDeclarativeView
asJSONForExport 
	"Answer the receiver serialised in JSON format"

	^self writeJsonString: self asDictionaryForExport
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
data 
	"Answer the data appropriate to the receiver's type"

	^self subclassResponsibility 
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
dataTransport
	^ dataTransport
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
dataTransport: anObject
	dataTransport := anObject
%

category: 'initialization'
method: GtRemotePhlowDeclarativeView
initialize

	super initialize.
	"The default is to include the data"
	dataTransport := self class dataIncluded.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
methodName
	^ methodName
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
methodName: anObject
	methodName := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
priority
	^ priority
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
priority: anObject
	priority := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
sentItemAt: selection 

	^ self subclassResponsibility 
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
title
	^ title
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
title: anObject
	title := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
viewName
	"Answer the name of the receivers matching view in the Gt image"

	^ self subclassResponsibility
%

! Class implementation for 'GtRemotePhlowDeclarativeColumnedList'

!		Class methods for 'GtRemotePhlowDeclarativeColumnedList'

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeColumnedList
fromJSONDictionary: aDictionary

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnTitles: (aDictionary at: #columnTitles);
		columnWidths: (aDictionary at: #columnWidths).
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
%

!		Instance methods for 'GtRemotePhlowDeclarativeColumnedList'

category: 'converting'
method: GtRemotePhlowDeclarativeColumnedList
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnTitles put: columnTitles asArray;
		at: #columnWidths put: columnWidths asArray;
		yourself.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self data asArray ].
	^dictionary
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
column: columnName item: aBlockClosure

	^ self column: columnName item: aBlockClosure width: nil
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
column: columnName item: aBlockClosure width: aNumberOrNil

	columnTitles add: columnName.
	columnValues add: aBlockClosure.
	columnWidths add: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
columnTitles
	^ columnTitles
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
columnTitles: anObject
	columnTitles := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
columnWidths
	^ columnWidths
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
columnWidths: anObject
	columnWidths := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
data 

	^ items ifNil: [ items := (itemsBuilder value collect: [ :item |
			(columnValues collect: [ :columnValue | columnValue value: item ]) asArray ]) asArray ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
initialize

	super initialize.
	columnValues := OrderedCollection new.
	columnTitles := OrderedCollection new.
	columnWidths := OrderedCollection new.
	sendBlock := [ :object | object ].
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
items: aBlockClosure

	itemsBuilder := aBlockClosure
%

category: 'instructions'
method: GtRemotePhlowDeclarativeColumnedList
send: aBlock

	self
		assert: [ aBlock isNotNil ]
		description: [ 'Send transformation block must be non-nil'  ].
	aBlock isSymbol ifTrue: [ 
		self 
			assert: [ aBlock isUnary ]
			description: [ 'Send transformation symbol must be unary' ] ].
	sendBlock := aBlock.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
sentItemAt: selection 
	"Answer the raw value at the supplied index"

	^ sendBlock cull: (itemsBuilder value at: selection) cull: selection
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
viewName 

	^ #GtDeclarativeColumnedList
%

! Class implementation for 'GtRemotePhlowDeclarativeList'

!		Class methods for 'GtRemotePhlowDeclarativeList'

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeList
fromJSONDictionary: aDictionary
	| list |

	list := super fromJSONDictionary: aDictionary.
	list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ].
	^list
%

!		Instance methods for 'GtRemotePhlowDeclarativeList'

category: 'converting'
method: GtRemotePhlowDeclarativeList
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self data ].
	^dictionary
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
data 
	"Answer the list of display strings"

	^ items ifNil: [ items := itemsBuilder value collect: itemTextBlock ]
%

category: 'initialization'
method: GtRemotePhlowDeclarativeList
initialize 

	super initialize.
	itemTextBlock := [ :item | item asString ].
	dataTransport := self class dataLazy.
%

category: 'api - scripting'
method: GtRemotePhlowDeclarativeList
items: aBlockClosure
	"Set the block closure that will be used to construct the items.
	Note that this doesn't set the items instance variable (as one might expect)"

	itemsBuilder := aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
itemsBuilder
	^ itemsBuilder
%

category: 'api - scripting'
method: GtRemotePhlowDeclarativeList
itemText: aBlockClosure

	itemTextBlock := aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
itemTextBlock
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
retrieveTotalItemsCount
	^ self accessor
		retrieveTotalItemsCountForViewSelector: self methodName
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
retriveFormattedItems
	^ self accessor 
		retriveFormattedItemsForViewSelector: self methodName
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
retriveSentItemAt: aSelectionIndex
	^ self accessor 
			retriveSentItemForViewSelector: self methodName
			atIndex: aSelectionIndex
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
sentItemAt: selection 
	"Answer the raw value at the supplied index"

	^ itemsBuilder value at: selection
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
totalItemsCount
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self retrieveTotalItemsCount ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
viewName
	"Answer the name of the receivers matching view in the Gt image"

	^ #GtDeclarativeList
%

! Class implementation for 'GtRemotePhlowDeclarativeTable'

!		Class methods for 'GtRemotePhlowDeclarativeTable'

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeTable
fromJSONDictionary: aDictionary

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
%

!		Instance methods for 'GtRemotePhlowDeclarativeTable'

category: 'converting'
method: GtRemotePhlowDeclarativeTable
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTable
data 

	^ items
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTable
items
	^ items
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTable
items: anObject
	items := anObject
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTable
viewName 

	^ #GtDeclarativeTable
%

! Class implementation for 'GtRemotePhlowDeclarativeTextEditor'

!		Class methods for 'GtRemotePhlowDeclarativeTextEditor'

category: 'instance creation'
classmethod: GtRemotePhlowDeclarativeTextEditor
fromJSONDictionary: aDictionary

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
%

!		Instance methods for 'GtRemotePhlowDeclarativeTextEditor'

category: 'converting'
method: GtRemotePhlowDeclarativeTextEditor
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: self data ].
	^dictionary
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTextEditor
data 

	^ textBuilder value
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTextEditor
sentItemAt: selector 

	^ self shouldNotImplement 
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTextEditor
text: aBlockClosure
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTextEditor
viewName 

	^ #GtDeclarativeTextEditor
%

! Class implementation for 'GtRemotePhlowDeclarativeTree'

!		Instance methods for 'GtRemotePhlowDeclarativeTree'

category: 'private'
method: GtRemotePhlowDeclarativeTree
add: item index: anArray to: stream
	"Add the supplied item, index and the item's children to the stream"

	stream nextPut: { 
		(itemTextBlock value: item) asString. 
		anArray.
		Array streamContents: [ :childStream | 
			(childrenBlock value: item) doWithIndex: [ :child :i |
				self add: child index: anArray, { i } to: childStream ] ] }
%

category: 'converting'
method: GtRemotePhlowDeclarativeTree
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self data ].
	^ dictionary
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
children

	^ childrenBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
children: aBlock

	childrenBlock := aBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
data
	"Answer the entire tree as an Array of Arrays.
	Each array is { item. index. children. }.
	index is an Array of the nested indices."

	^ Array streamContents: [ :stream |
		itemsBuilder value doWithIndex: [ :item :i |
			self add: item index: { i } to: stream ] ]
%

category: 'private'
method: GtRemotePhlowDeclarativeTree
expand: anOrderedCollection to: selection from: aCollection

	selection <= anOrderedCollection size ifTrue: [ ^ self ].
	aCollection do: [ :each |
		anOrderedCollection add: each.
		selection <= anOrderedCollection size ifTrue: [ ^ self ].
		self expand: anOrderedCollection to: selection from: (childrenBlock value: each).
		selection <= anOrderedCollection size ifTrue: [ ^ self ] ].
%

category: 'initialization'
method: GtRemotePhlowDeclarativeTree
initialize

	super initialize.
	itemTextBlock := [ :item | item ].
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
items

	^ itemsBuilder
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
items: aBlock

	itemsBuilder := aBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
itemText

	^ itemTextBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
itemText: aBlock

	itemTextBlock := aBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
sentItemAt: anArray
	"Answer the item at the supplied index"
	| value |

	value := itemsBuilder value at: anArray first.
	anArray allButFirstDo: [ :index |
		value := (childrenBlock value: value) at: index ].
	^ value
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
viewName

	^ #GtDeclarativeTree
%

! Class implementation for 'GtRemotePhlowViewCache'

!		Class methods for 'GtRemotePhlowViewCache'

category: 'instance creation'
classmethod: GtRemotePhlowViewCache
viewedObject: aGtViewedObject selector: viewSelector

	^ self new 
		viewedObject: aGtViewedObject;
		viewSelector: viewSelector;
		yourself
%

!		Instance methods for 'GtRemotePhlowViewCache'

category: 'accessing'
method: GtRemotePhlowViewCache
cachedData
	^ cachedData ifNil: [ 
		cachedData := Dictionary new ]
%

category: 'accessing'
method: GtRemotePhlowViewCache
catcheAt: aKey	ifAbsentPut: aPutBlock
	^ self cachedData 
		at: aKey ifAbsentPut: aPutBlock
%

category: 'accessing'
method: GtRemotePhlowViewCache
declarativeView

	^ declarativeView ifNil: 
		[ declarativeView := (self object perform: viewSelector with: GtRemotePhlowDeclarativeProtoView new) ]
%

category: 'accessing'
method: GtRemotePhlowViewCache
object

	^ self viewedObject object
%

category: 'accessing'
method: GtRemotePhlowViewCache
retrieveItems: anItemsCount fromIndex: anIndex
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ ((viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size))
	 			collect: [ :each | 
					(self declarativeView itemTextBlock value: each) asString ]) asArray
%

category: 'accessing'
method: GtRemotePhlowViewCache
retrieveTotalItemsCount
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ viewItems size
%

category: 'accessing'
method: GtRemotePhlowViewCache
retriveFormattedItems
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ (viewItems collect: [ :each | 
		(self declarativeView itemTextBlock value: each) asString ]) asArray
%

category: 'accessing'
method: GtRemotePhlowViewCache
retriveSentItemAtIndex: aSelectionIndex
	|  viewItems |
	viewItems := self 
		catcheAt: #items 
		ifAbsentPut: [ self declarativeView itemsBuilder value ].
	^ viewItems at: aSelectionIndex
%

category: 'accessing'
method: GtRemotePhlowViewCache
viewedObject
	^ viewedObject
%

category: 'accessing'
method: GtRemotePhlowViewCache
viewedObject: anObject
	viewedObject := anObject
%

category: 'accessing'
method: GtRemotePhlowViewCache
viewSelector
	^ viewSelector
%

category: 'accessing'
method: GtRemotePhlowViewCache
viewSelector: anObject
	viewSelector := anObject
%

! Class implementation for 'GtRemotePhlowViewedObject'

!		Class methods for 'GtRemotePhlowViewedObject'

category: 'instance creation'
classmethod: GtRemotePhlowViewedObject
object: anObject

	^ self new initializeWith: anObject
%

!		Instance methods for 'GtRemotePhlowViewedObject'

category: 'private'
method: GtRemotePhlowViewedObject
declarativeViewWithSelector: viewSelector
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtRemotePhlowViewCache viewedObject: self selector: viewSelector ]) 
			declarativeView
%

category: 'accessing'
method: GtRemotePhlowViewedObject
getGtViewMethodNames
	"Answer the set of declarative view selectors provided by the object"

	^ object gtPharoDeclarativeViewSelectors
%

category: 'accessing'
method: GtRemotePhlowViewedObject
getViewDeclaration: viewSelector
	"Answer the declarative view dictionary for the supplied selector"

	^ (self declarativeViewWithSelector: viewSelector) asDictionaryForExport 
		at: #'__pharolinkImmediate' put: true;
		yourself.
%

category: 'gt inspector'
method: GtRemotePhlowViewedObject
gtSentItemFor: viewSelector at: selection 
	"Answer the value to be sent from the view"

	^ (self declarativeViewWithSelector: viewSelector) sentItemAt: selection
%

category: 'initialization'
method: GtRemotePhlowViewedObject
initialize

	super initialize.
	viewCache := Dictionary new.
%

category: 'initialization'
method: GtRemotePhlowViewedObject
initializeWith: anObject

	object := anObject
%

category: 'accessing'
method: GtRemotePhlowViewedObject
object

	^ object
%

category: 'accessing'
method: GtRemotePhlowViewedObject
retrieveItemsCount: anItemsCount fromIndex: anIndex forViewSelector: aViewSelector
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retrieveItems: anItemsCount fromIndex: anIndex
%

category: 'accessing'
method: GtRemotePhlowViewedObject
retrieveTotalItemsCountForViewSelector: aViewSelector
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retrieveTotalItemsCount
%

category: 'accessing'
method: GtRemotePhlowViewedObject
retriveFormattedItemsForViewSelector: aViewSelector
	| declarativeViewCache |
	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retriveFormattedItems
%

category: 'accessing'
method: GtRemotePhlowViewedObject
retriveSentItemForViewSelector: aViewSelector atIndex: aSelectionIndex
	| declarativeViewCache |

	declarativeViewCache := viewCache at: aViewSelector.
	^ declarativeViewCache retriveSentItemAtIndex: aSelectionIndex
%

category: 'private'
method: GtRemotePhlowViewedObject
viewWithSelector: viewSelector
	"Answer the objects view with the given selector name"

	^ (viewCache
		at: viewSelector
		ifAbsentPut: [ GtRemotePhlowViewCache viewedObject: self selector: viewSelector ]) 
			view
%

! Class extensions for 'Behavior'

!		Instance methods for 'Behavior'

category: '*GToolkit-RemotePhlow-Gemstone'
method: Behavior
gtMethodsListRemoteFor: aView
	<gtView>

	^ aView list
		title: 'Methods List';
		priority: 10;
		items: [ (self methodDictForEnv: 0) values asSortedCollection: [ :a :b | a selector < b selector ] ];
		itemText: [ :method | method selector ]
%

category: '*GToolkit-RemotePhlow-Gemstone'
method: Behavior
gtSubclasses
	"A hack to figure out all subclasses since Metaclass3>>_subclasses always answers nil"
	| allClasses result |

	allClasses := Array new.
	System myUserProfile symbolList
		do: [ :dict | allClasses addAll: (dict select: [ :each | each isBehavior ]) ].
	result := allClasses select: [ :each | each isBehavior and: [ each superclass = self ] ].
	^ result
%

category: '*GToolkit-RemotePhlow-Gemstone'
method: Behavior
gtSubclassesFor: aView
	<gtView>

	^ aView tree
		title: 'Subclasses';
		priority: 11;
		items: [ self gtSubclasses ];
		itemText: [ :cls | cls name ];
		children: [ :cls | cls gtSubclasses ]
%

category: '*GToolkit-RemotePhlow-Gemstone'
method: Behavior
gtSuperclassesFor: aView
	<gtView>

	^ aView list
		title: 'Superclasses';
		priority: 12;
		items: [ self allSuperClasses reversed ];
		itemText: [ :cls | cls name ]
%

! Class extensions for 'GtRemotePhlowDeclarativeTestInspectable'

!		Class methods for 'GtRemotePhlowDeclarativeTestInspectable'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtRemotePhlowDeclarativeTestInspectable
new

	^ super new initialize
%

! Class extensions for 'GtRemotePhlowDeclarativeView'

!		Class methods for 'GtRemotePhlowDeclarativeView'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtRemotePhlowDeclarativeView
globalsDictionary

	self halt.  "How to look up classes?"
	^ GsCurrentSession currentSession symbolList
%

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtRemotePhlowDeclarativeView
new

	^ super new initialize
%

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtRemotePhlowDeclarativeView
readJsonString: aString

	self halt.
	^ JsonParser parse: aString
%

!		Instance methods for 'GtRemotePhlowDeclarativeView'

category: '*GToolkit-RemotePhlow-GemStone'
method: GtRemotePhlowDeclarativeView
writeJsonString: aJsonObject

	^ STON toJsonStringPretty: aJsonObject
%

! Class extensions for 'GtRemotePhlowViewedObject'

!		Class methods for 'GtRemotePhlowViewedObject'

category: '*GToolkit-RemotePhlow-Gemstone'
classmethod: GtRemotePhlowViewedObject
new

	^ super new initialize
%

!		Instance methods for 'GtRemotePhlowViewedObject'

category: '*GToolkit-RemotePhlow-GemStone'
method: GtRemotePhlowViewedObject
addRawSelfNodeTo: variableNodes

	^ self "TBS"
%

category: '*GToolkit-RemotePhlow-GemStone'
method: GtRemotePhlowViewedObject
rawViewData
	"Answer the data for the raw view"
	| "icon name value" instVarNames indexedVarsSize |


	"GemStone doesn't have GTInspectorSelfNode.  The call to #addRawSelfNodeTo: will allow the platform specific code to be added.
	variableNodes add: (GTInspectorSelfNode hostObject: object)."

    instVarNames := object class allInstVarNames.
    indexedVarsSize := object basicSize - instVarNames size.
    

	^ Array streamContents: [ :stream |
		stream nextPut: { #classicon. 'self'. object printString. }.

        instVarNames doWithIndex: [ :each :index | 
			stream nextPut: { #classicon. each. (object instVarAt: index) printString. } ].
    
		1 to: (indexedVarsSize min: 21) do: [ :index | 
			stream nextPut: { #classicon. index asString. (object _at: index) printString. } ].
    
		((indexedVarsSize - 20) max: 22) to: indexedVarsSize do: [ :index | 
			stream nextPut: { #classicon. index asString. (object _at: index) printString. } ] ].
%

! Class extensions for 'Object'

!		Instance methods for 'Object'

category: '*GToolkit-RemotePhlow'
method: Object
gtPharoDeclarativeViewSelectors
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtView
		from: self class
		to: Object) collect: [ :each | each method selector ]) asSet asArray
%

category: '*GToolkit-RemotePhlow'
method: Object
gtPrintRemoteFor: aView
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
%

! Class extensions for 'TestResult'

!		Instance methods for 'TestResult'

category: '*GToolkit-RemotePhlow'
method: TestResult
gtResultsFor: aView
	<gtView>

	self runCount isZero ifTrue: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Results';
		priority: 10;
		items: [ self gtTestResults ];
		column: 'Selector' item: [ :assoc | assoc key class asString, '>>', assoc key selector ];
		column: 'Status' item: [ :assoc | assoc value ] width: 100;
		send: [ :assoc | assoc key ]
%

category: '*GToolkit-RemotePhlow'
method: TestResult
gtTestResults
	"Answer a collection of result -> label associations"

	^ OrderedCollection new
		addAll: (self passed collect: [ :each | each -> #passed ]);
		addAll: (self failures collect: [ :each | each -> #failure ]);
		addAll: (self errors collect: [ :each | each -> #error ]);
		addAll: (self skipped collect: [ :each | each -> #skipped ]);
		yourself
%

