! Class Declarations
! Generated file, do not Edit

doit
(Object
	subclass: 'GtPhlowDeclarativeView'
	instVarNames: #( phlowDataSource methodSelector title priority dataTransport )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
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


    Implementation Points

';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeView
removeallclassmethods GtPhlowDeclarativeView

doit
(GtPhlowDeclarativeView
	subclass: 'GtPhlowDeclarativeListingView'
	instVarNames: #( totalItemsCount )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeListingView
removeallclassmethods GtPhlowDeclarativeListingView

doit
(GtPhlowDeclarativeListingView
	subclass: 'GtPhlowDeclarativeColumnedListView'
	instVarNames: #( columnTitles columnWidths columnTypes )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		comment: 'GtDeclarativeColumnedList supports a subset of the possible configurations of ${class:name=GtPhlowColumnedListView}.

Current limitations:

- Only matchParent and fixed column widths are supported

1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables

	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send

';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeColumnedListView
removeallclassmethods GtPhlowDeclarativeColumnedListView

doit
(GtPhlowDeclarativeListingView
	subclass: 'GtPhlowDeclarativeListView'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		comment: 'GtDeclarativeList supports a subset of the possible configurations of ${class:name=GtPhlowListView}.

 
1. # Internal Representation and Key Implementation Points.


1. ## Instance Variables

	items:		<Array> - The formatted items to display (not the raw values held in the list)


1. ## Implementation Points

';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeListView
removeallclassmethods GtPhlowDeclarativeListView

doit
(GtPhlowDeclarativeView
	subclass: 'GtPhlowDeclarativeTableView'
	instVarNames: #( items )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeTableView
removeallclassmethods GtPhlowDeclarativeTableView

doit
(GtPhlowDeclarativeView
	subclass: 'GtPhlowDeclarativeTextEditorView'
	instVarNames: #( string )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeTextEditorView
removeallclassmethods GtPhlowDeclarativeTextEditorView

doit
(GtPhlowDeclarativeView
	subclass: 'GtPhlowDeclarativeTreeView'
	instVarNames: #( itemTextBlock childrenBlock items )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeTreeView
removeallclassmethods GtPhlowDeclarativeTreeView

doit
(Object
	subclass: 'GtRemotePhlowColumn'
	instVarNames: #( index title width itemComputation iconNameComputation )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowColumn
removeallclassmethods GtRemotePhlowColumn

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
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
	instVarNames: #( title priority )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
	subclass: 'GtRemotePhlowDeclarativeListingView'
	instVarNames: #( itemsBuilder transformation )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeListingView
removeallclassmethods GtRemotePhlowDeclarativeListingView

doit
(GtRemotePhlowDeclarativeListingView
	subclass: 'GtRemotePhlowDeclarativeColumnedList'
	instVarNames: #( columns )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
(GtRemotePhlowDeclarativeListingView
	subclass: 'GtRemotePhlowDeclarativeList'
	instVarNames: #( itemTextBlock )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
		category: 'GToolkit-RemotePhlow-PhlowViews';
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
	subclass: 'GtRemotePhlowDeclarativeViewDataSource'
	instVarNames: #( phlowView )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeViewDataSource
removeallclassmethods GtRemotePhlowDeclarativeViewDataSource

doit
(GtRemotePhlowDeclarativeViewDataSource
	subclass: 'GtRemotePhlowDeclarativeViewListingDataSource'
	instVarNames: #( cachedItems )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeViewListingDataSource
removeallclassmethods GtRemotePhlowDeclarativeViewListingDataSource

doit
(GtRemotePhlowDeclarativeViewListingDataSource
	subclass: 'GtRemotePhlowDeclarativeViewColumnedListDataSource'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeViewColumnedListDataSource
removeallclassmethods GtRemotePhlowDeclarativeViewColumnedListDataSource

doit
(GtRemotePhlowDeclarativeViewListingDataSource
	subclass: 'GtRemotePhlowDeclarativeViewListDataSource'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowDeclarativeViewListDataSource
removeallclassmethods GtRemotePhlowDeclarativeViewListDataSource

doit
(Object
	subclass: 'GtRemotePhlowSendObjectTransformation'
	instVarNames: #( valuable )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowSendObjectTransformation
removeallclassmethods GtRemotePhlowSendObjectTransformation

doit
(Object
	subclass: 'GtRemotePhlowViewedObject'
	instVarNames: #( object declarativeViewsBySelector )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-InspectorCore';
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

! Class implementation for 'GtPhlowDeclarativeView'

!		Class methods for 'GtPhlowDeclarativeView'

category: 'data transport'
classmethod: GtPhlowDeclarativeView
dataIncluded
	"Answer the enumerated value for the display data being included with the specification"

	^1
%

category: 'data transport'
classmethod: GtPhlowDeclarativeView
dataLazy
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
%

category: 'instance creation'
classmethod: GtPhlowDeclarativeView
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		yourself
%

!		Instance methods for 'GtPhlowDeclarativeView'

category: 'converting'
method: GtPhlowDeclarativeView
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

category: 'accessing'
method: GtPhlowDeclarativeView
dataTransport
	^ dataTransport
%

category: 'accessing'
method: GtPhlowDeclarativeView
dataTransport: anObject
	dataTransport := anObject
%

category: 'initialization'
method: GtPhlowDeclarativeView
initializeFromInspector: anInspector
%

category: 'testing'
method: GtPhlowDeclarativeView
isWithLazyLoading
	^ self dataTransport = self class dataLazy
%

category: 'accessing'
method: GtPhlowDeclarativeView
methodSelector
	^ methodSelector
%

category: 'accessing'
method: GtPhlowDeclarativeView
methodSelector: aSelector
	methodSelector := aSelector
%

category: 'accessing'
method: GtPhlowDeclarativeView
phlowDataSource
	^ phlowDataSource
%

category: 'accessing'
method: GtPhlowDeclarativeView
phlowDataSource: aDataSource
	phlowDataSource := aDataSource
%

category: 'accessing'
method: GtPhlowDeclarativeView
priority
	^ priority
%

category: 'accessing'
method: GtPhlowDeclarativeView
priority: anObject
	priority := anObject
%

category: 'accessing'
method: GtPhlowDeclarativeView
title
	^ title
%

category: 'accessing'
method: GtPhlowDeclarativeView
title: anObject
	title := anObject
%

category: 'accessing'
method: GtPhlowDeclarativeView
viewName
	"Answer the name of the receivers view"

	^self class name
%

! Class implementation for 'GtPhlowDeclarativeListingView'

!		Instance methods for 'GtPhlowDeclarativeListingView'

category: 'initialization'
method: GtPhlowDeclarativeListingView
initializeFromInspector: anInspector
	self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)
%

category: 'api - accessing'
method: GtPhlowDeclarativeListingView
retrieveItems: anItemsCount fromIndex: anIndex
	^ self phlowDataSource 
		retrieveItems: anItemsCount fromIndex: anIndex
%

category: 'accessing'
method: GtPhlowDeclarativeListingView
retrieveItemsFromIndex: anIndex
	^ self retrieveItems: 100 fromIndex: anIndex
%

category: 'api - accessing'
method: GtPhlowDeclarativeListingView
retrieveTotalItemsCount
	^ self phlowDataSource retrieveTotalItemsCount
%

category: 'accessing'
method: GtPhlowDeclarativeListingView
retriveFormattedItems
	^ self phlowDataSource 
		retrieveItems: self totalItemsCount fromIndex: 1
%

category: 'api - accessing'
method: GtPhlowDeclarativeListingView
retriveSentItemAt: aSelectionIndex
	^ self phlowDataSource retriveSentItemAt: aSelectionIndex
%

category: 'accessing'
method: GtPhlowDeclarativeListingView
totalItemsCount
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self phlowDataSource retrieveTotalItemsCount ]
%

! Class implementation for 'GtPhlowDeclarativeColumnedListView'

!		Class methods for 'GtPhlowDeclarativeColumnedListView'

category: 'instance creation'
classmethod: GtPhlowDeclarativeColumnedListView
fromJSONDictionary: aDictionary

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnTitles: (aDictionary at: #columnTitles);
		columnWidths: (aDictionary at: #columnWidths);
		columnTypes: (aDictionary at: #columnTypes).
	"list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ]."
	^list
%

!		Instance methods for 'GtPhlowDeclarativeColumnedListView'

category: 'converting'
method: GtPhlowDeclarativeColumnedListView
asDictionaryForExport 
	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnTitles put: columnTitles;
		at: #columnWidths put: columnWidths;
		at: #columnTypes put: columnTypes;
		yourself.
	"self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: items ]."
	^dictionary
%

category: 'accessing'
method: GtPhlowDeclarativeColumnedListView
columnTitles
	^ columnTitles
%

category: 'accessing'
method: GtPhlowDeclarativeColumnedListView
columnTitles: anObject
	columnTitles := anObject
%

category: 'accessing'
method: GtPhlowDeclarativeColumnedListView
columnTypes
	^ columnTypes
%

category: 'accessing'
method: GtPhlowDeclarativeColumnedListView
columnTypes: anObject
	columnTypes := anObject
%

category: 'accessing'
method: GtPhlowDeclarativeColumnedListView
columnWidths
	^ columnWidths
%

category: 'accessing'
method: GtPhlowDeclarativeColumnedListView
columnWidths: anObject
	columnWidths := anObject
%

! Class implementation for 'GtPhlowDeclarativeListView'

!		Class methods for 'GtPhlowDeclarativeListView'

category: 'instance creation'
classmethod: GtPhlowDeclarativeListView
fromJSONDictionary: aDictionary
	| list |

	list := super fromJSONDictionary: aDictionary.
	"list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ]."
	^list
%

!		Instance methods for 'GtPhlowDeclarativeListView'

category: 'converting'
method: GtPhlowDeclarativeListView
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	"self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self retriveFormattedItems ]."
	^dictionary
%

! Class implementation for 'GtPhlowDeclarativeTableView'

!		Class methods for 'GtPhlowDeclarativeTableView'

category: 'instance creation'
classmethod: GtPhlowDeclarativeTableView
fromJSONDictionary: aDictionary

	| table |

	table := super fromJSONDictionary: aDictionary.
	table dataTransport = self dataIncluded ifTrue: 
		[ table items: (aDictionary at: #items) ].
	^table
%

!		Instance methods for 'GtPhlowDeclarativeTableView'

category: 'converting'
method: GtPhlowDeclarativeTableView
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #data put: items ].
	^dictionary
%

category: 'accessing'
method: GtPhlowDeclarativeTableView
items
	^ items
%

category: 'accessing'
method: GtPhlowDeclarativeTableView
items: anObject
	items := anObject
%

! Class implementation for 'GtPhlowDeclarativeTextEditorView'

!		Class methods for 'GtPhlowDeclarativeTextEditorView'

category: 'instance creation'
classmethod: GtPhlowDeclarativeTextEditorView
fromJSONDictionary: aDictionary

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
%

!		Instance methods for 'GtPhlowDeclarativeTextEditorView'

category: 'converting'
method: GtPhlowDeclarativeTextEditorView
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string ].
	^dictionary
%

category: 'accessing'
method: GtPhlowDeclarativeTextEditorView
string

	^ string "ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ]."
%

category: 'accessing'
method: GtPhlowDeclarativeTextEditorView
string: anObject
	string := anObject
%

! Class implementation for 'GtPhlowDeclarativeTreeView'

!		Class methods for 'GtPhlowDeclarativeTreeView'

category: 'instance creation'
classmethod: GtPhlowDeclarativeTreeView
fromJSONDictionary: aDictionary
	| view |

	view := super fromJSONDictionary: aDictionary.
	view dataTransport = self dataIncluded ifTrue: 
		[ view items: (aDictionary at: #items) ].
	view 
		itemText: [ :item | item first ];
		children: [ :item | item last ].
	^ view
%

!		Instance methods for 'GtPhlowDeclarativeTreeView'

category: 'converting'
method: GtPhlowDeclarativeTreeView
asDictionaryForExport 
	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self items ].
	^ dictionary
%

category: 'accessing'
method: GtPhlowDeclarativeTreeView
children: aBlock 

	childrenBlock := aBlock
%

category: 'initialization'
method: GtPhlowDeclarativeTreeView
initialize

	super initialize.
	itemTextBlock := [ :item | item asString ].
%

category: 'accessing'
method: GtPhlowDeclarativeTreeView
items 

	^ items 
%

category: 'accessing'
method: GtPhlowDeclarativeTreeView
items: aBlock 

	items := aBlock
%

category: 'accessing'
method: GtPhlowDeclarativeTreeView
itemText: aBlock 

	itemTextBlock := aBlock
%

! Class implementation for 'GtRemotePhlowColumn'

!		Instance methods for 'GtRemotePhlowColumn'

category: 'accessing'
method: GtRemotePhlowColumn
cellWidth
	^ width
%

category: 'accessing'
method: GtRemotePhlowColumn
columnDataType
	^ self isWithIcon
		ifTrue: [ #icon ]
		ifFalse: [ #text ]
%

category: 'accessing'
method: GtRemotePhlowColumn
iconName: aBlock
	iconNameComputation := aBlock
%

category: 'accessing'
method: GtRemotePhlowColumn
iconNameComputation
	^ iconNameComputation
%

category: 'accessing'
method: GtRemotePhlowColumn
index
	^ index
%

category: 'accessing'
method: GtRemotePhlowColumn
index: aColumnIndex
	index := aColumnIndex
%

category: 'testing'
method: GtRemotePhlowColumn
isWithIcon
	^ iconNameComputation notNil
%

category: 'accessing'
method: GtRemotePhlowColumn
item: aBlock
	itemComputation := aBlock
%

category: 'accessing'
method: GtRemotePhlowColumn
itemComputation
	^ itemComputation
%

category: 'private - accessing'
method: GtRemotePhlowColumn
rowStencil
	^ nil
%

category: 'accessing'
method: GtRemotePhlowColumn
title
	^ title
%

category: 'accessing'
method: GtRemotePhlowColumn
title: anObject
	title := anObject
%

category: 'accessing'
method: GtRemotePhlowColumn
width: aCellWidth
	width := aCellWidth
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
		column: 'Value' item: [ :anObject | anObject ];
		column: 'Lowercase' item: [ :anObject | anObject asString asLowercase ] width: 100.
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeColumnedListFor: aView
	<gtView>

	^aView columnedList
		title: 'Large Columned List' ;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Value' item: [ :anObject | anObject ];
		column: 'Value * 10' item: [ :anObject | (anObject * 10) asString asLowercase ] width: 100.
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeColumnedListWithIndexFor: aView
	<gtView>

	^aView columnedList
		title: 'Large Columned List with Index';
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Index' item: [ :anObject  :anIndex | anIndex ];
		column: 'Value' item: [ :anObject | anObject ].
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeListFor: aView
	<gtView>

	^aView list
		title: 'Large List';
		priority: 20;
		items: [ 1 to: 1022 ];
		itemText: [ :item | item  ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtListFor: aView
	<gtView>

	^aView list
		title: 'List';
		priority: 15;
		items: [ collectionOfObjects ];
		itemText: [ :item | item ]
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
	data := aView asGtDeclarativeView items.
	self assert: data size equals: 4.
	self assert: data first equals: #('1' #(1) #()).
	self assert: data last equals:  #('4' #(4) #(#('1' #(4 1) #()) #('2' #(4 2) #(#('1' #(4 2 1) #()))))).
	^ aView
%

! Class implementation for 'GtRemotePhlowDeclarativeView'

!		Instance methods for 'GtRemotePhlowDeclarativeView'

category: 'converting'
method: GtRemotePhlowDeclarativeView
asGtDeclarativeView
	^ nil
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
title
	^ title
%

category: 'accessing'
method: GtRemotePhlowDeclarativeView
title: anObject
	title := anObject
%

! Class implementation for 'GtRemotePhlowDeclarativeListingView'

!		Instance methods for 'GtRemotePhlowDeclarativeListingView'

category: 'accessing'
method: GtRemotePhlowDeclarativeListingView
defaultTransformation
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeListingView
items: aBlockClosure

	itemsBuilder := aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowDeclarativeListingView
itemsBuilder
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ { } ] ]
%

category: 'api - scripting'
method: GtRemotePhlowDeclarativeListingView
send: aBlock
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
%

category: 'accessing'
method: GtRemotePhlowDeclarativeListingView
transformation 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeListingView
transformation: aGtPhlowSendTransformation
	transformation := aGtPhlowSendTransformation.
%

! Class implementation for 'GtRemotePhlowDeclarativeColumnedList'

!		Instance methods for 'GtRemotePhlowDeclarativeColumnedList'

category: 'converting'
method: GtRemotePhlowDeclarativeColumnedList
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtPhlowDeclarativeColumnedListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnTitles: (self columns collect: [ :each | each title ]) asArray;
		columnWidths: (self columns collect: [ :each | each cellWidth ]) asArray;
		columnTypes: (self columns collect: [ :each | each columnDataType ]) asArray;
		dataTransport: GtPhlowDeclarativeView dataLazy
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
column
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
%

category: 'api - scripting column'
method: GtRemotePhlowDeclarativeColumnedList
column: columnName iconName: anIconNameComputation
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
%

category: 'api - scripting column'
method: GtRemotePhlowDeclarativeColumnedList
column: columnName iconName: anIconNameComputation width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
%

category: 'api - scripting column'
method: GtRemotePhlowDeclarativeColumnedList
column: columnName item: aBlockClosure
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn item: aBlockClosure
%

category: 'api - scripting column'
method: GtRemotePhlowDeclarativeColumnedList
column: columnName item: aBlockClosure width: aNumberOrNil
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn item: aBlockClosure.
	aColumn width: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedList
columns
	^ columns ifNil: [
		columns := OrderedCollection new ]
%

! Class implementation for 'GtRemotePhlowDeclarativeList'

!		Instance methods for 'GtRemotePhlowDeclarativeList'

category: 'converting'
method: GtRemotePhlowDeclarativeList
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeListView new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowDeclarativeView dataLazy.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeList
itemText
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ] 
%

category: 'api - scripting'
method: GtRemotePhlowDeclarativeList
itemText: aBlockClosure

	itemTextBlock := aBlockClosure
%

! Class implementation for 'GtRemotePhlowDeclarativeTable'

!		Instance methods for 'GtRemotePhlowDeclarativeTable'

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

! Class implementation for 'GtRemotePhlowDeclarativeTextEditor'

!		Instance methods for 'GtRemotePhlowDeclarativeTextEditor'

category: 'converting'
method: GtRemotePhlowDeclarativeTextEditor
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtPhlowDeclarativeTextEditorView new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtPhlowDeclarativeView dataIncluded.
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
textBuilder
	^ textBuilder
%

! Class implementation for 'GtRemotePhlowDeclarativeTree'

!		Instance methods for 'GtRemotePhlowDeclarativeTree'

category: 'private'
method: GtRemotePhlowDeclarativeTree
add: item index: anArray to: stream
	"Add the supplied item, index and the item's children to the stream"

	stream nextPut: { 
		(self itemText value: item) asString. 
		anArray.
		Array streamContents: [ :childStream | 
			(childrenBlock value: item) doWithIndex: [ :child :i |
				self add: child index: anArray, { i } to: childStream ] ] }
%

category: 'converting'
method: GtRemotePhlowDeclarativeTree
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowDeclarativeTreeView new 
		title: self title;
		priority: self priority;
		items: (Array streamContents: [ :stream |
			self itemsBuilder value doWithIndex: [ :item :i |
				self add: item index: { i } to: stream ] ]);
		dataTransport: GtPhlowDeclarativeView dataIncluded.
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
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
items: aBlock

	itemsBuilder := aBlock
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
itemsBuilder
	^ itemsBuilder ifNil: [ 
		itemsBuilder := [ #() ] ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
itemText

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTree
itemText: aBlock

	itemTextBlock := aBlock
%

! Class implementation for 'GtRemotePhlowDeclarativeViewDataSource'

!		Class methods for 'GtRemotePhlowDeclarativeViewDataSource'

category: 'as yet unclassified'
classmethod: GtRemotePhlowDeclarativeViewDataSource
forPhlowView: aView
	^ self new
		phlowView: aView
%

!		Instance methods for 'GtRemotePhlowDeclarativeViewDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewDataSource
phlowView
	^ phlowView
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewDataSource
phlowView: anObject
	phlowView := anObject
%

! Class implementation for 'GtRemotePhlowDeclarativeViewListingDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewListingDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
formatItem: anObject atIndex: anIndex
	self subclassResponsibility
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
retrieveItems: anItemsCount fromIndex: anIndex
	| viewItems targetItems formattedItems |
	viewItems := self viewItems.
	targetItems := (viewItems 
			copyFrom: anIndex
			to: ((anIndex + anItemsCount - 1) min: viewItems size)).
	formattedItems := Array new: targetItems size.
	targetItems withIndexDo: [ :each :itemIndex | 
		formattedItems 
			at: itemIndex
			put: (self formatItem: each atIndex: anIndex + itemIndex - 1) ].
	^ formattedItems
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
retrieveTotalItemsCount
	^ self viewItems size
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
retriveSentItemAt: aSelectionIndex
	"Answer the raw value at the supplied index"
	
	^ self phlowView transformation 
		transformedValueFrom: (self viewItems at: aSelectionIndex)
		selection: aSelectionIndex
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
viewItems
	^ cachedItems ifNil: [ 
		cachedItems := self phlowView itemsBuilder value ]
%

! Class implementation for 'GtRemotePhlowDeclarativeViewColumnedListDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewColumnedListDataSource'

category: 'instance creation'
method: GtRemotePhlowDeclarativeViewColumnedListDataSource
formatItem: anObject atIndex: rowIndex
	| phlowColumns formattedColumnItems |
	phlowColumns := self phlowView columns.
	formattedColumnItems := Array new: phlowColumns size.
	phlowColumns withIndexDo: [ :column :columnIndex | 
		| valueComputation |
		valueComputation := column isWithIcon 
			ifTrue: [ column iconNameComputation ]
			ifFalse: [ column itemComputation ].
		formattedColumnItems 
			at: columnIndex
			put:  (valueComputation
				cull: anObject cull: rowIndex cull: columnIndex) gtDisplayString].
	^ formattedColumnItems
%

! Class implementation for 'GtRemotePhlowDeclarativeViewListDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewListDataSource'

category: 'api'
method: GtRemotePhlowDeclarativeViewListDataSource
formatItem: anObject atIndex: rowIndex
	^ (self phlowView itemText value: anObject) gtDisplayString
%

! Class implementation for 'GtRemotePhlowSendObjectTransformation'

!		Class methods for 'GtRemotePhlowSendObjectTransformation'

category: 'instance creation'
classmethod: GtRemotePhlowSendObjectTransformation
forValuable: aValuable
	^ self new
		valuable: aValuable
%

!		Instance methods for 'GtRemotePhlowSendObjectTransformation'

category: 'asserting'
method: GtRemotePhlowSendObjectTransformation
assertValuable: aBlock
	self
		assert: [ aBlock isNotNil ].
	self
		assert: [ aBlock argumentCount <= 2 ].
%

category: 'private - accessing'
method: GtRemotePhlowSendObjectTransformation
transformedValueFrom: aSelectedObject selection: aSelectionIndices
	^ self valuable cull: aSelectedObject cull: aSelectionIndices
%

category: 'accessing'
method: GtRemotePhlowSendObjectTransformation
valuable
	^ valuable
%

category: 'accessing'
method: GtRemotePhlowSendObjectTransformation
valuable: anObject
	valuable := anObject
%

! Class implementation for 'GtRemotePhlowViewedObject'

!		Class methods for 'GtRemotePhlowViewedObject'

category: 'instance creation'
classmethod: GtRemotePhlowViewedObject
object: anObject

	^ self new initializeWith: anObject
%

!		Instance methods for 'GtRemotePhlowViewedObject'

category: 'accessing'
method: GtRemotePhlowViewedObject
declarativeViewsBySelector
	^ declarativeViewsBySelector ifNil: [ 
		declarativeViewsBySelector := Dictionary new ]
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getDeclarativeViewFor: viewSelector
	^ self declarativeViewsBySelector 
		at: viewSelector 
		ifAbsentPut: [
			(self object 
				perform: viewSelector 
				with: GtRemotePhlowDeclarativeProtoView new) asGtDeclarativeView ]
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getDeclarativeViewMethodNames
	"Answer the set of declarative view selectors provided by the object"

	^ (object gtDeclarativeViewSelectors 
		copyWithout: #gtRawFor:)
		copyWithout: #gtPrintFor:
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getViewDeclaration: viewSelector
	^ ((self getDeclarativeViewFor: viewSelector) 
		ifNotNil: [ :view |
			view asDictionaryForExport
				at: #'__pharolinkImmediate' put: true;
				yourself. ])
		
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

! Class extensions for 'Collection'

!		Class methods for 'Collection'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: Collection
gtGsInspectorIconName
	^ #collectionIcon
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
	| variableBindings |

	variableBindings := object gtGsVariableValuePairsWithSelfIf: true.

	^ Array streamContents: [ :stream |
		variableBindings do: [ :binding |
			| icon name value |
			name := binding key.
			value := binding value.

			icon := ([ value class gtGsInspectorIconName ]
					on: Error 
					do: [ :error | #smallWarningIcon ]).
			
			stream nextPut: { icon. name. value } ] ].
%

! Class extensions for 'Magnitude'

!		Class methods for 'Magnitude'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: Magnitude
gtGsInspectorIconName
	^ #magnitudeIcon
%

! Class extensions for 'Object'

!		Instance methods for 'Object'

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtDisplayOn: writeStream
	self printOn: writeStream
%

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtDisplayString
  | ws contents |
  ws := PrintStream printingOn: String new "maxSize: 100".

  [ self gtDisplayOn: ws ] 
	on: Error 
	do: [ :error | ^ '<error printing>' ].
  contents := ws _collection.

  ^ contents size > 200
    ifTrue: [ (contents copyFrom: 1 to: 200) , '...' ]
    ifFalse: [ contents ]
%

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtGsInspectorIconName
	^ #classIcon
%

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtGsVariableValuePairsWithSelfIf: aBoolean
	| instVarNames bindings indexedVarsSize |
	instVarNames := self class allInstVarNames.
	indexedVarsSize := self basicSize - instVarNames size.
	bindings := OrderedCollection new: instVarNames size + 1.
	
	aBoolean ifTrue: [ bindings add: 'self' -> self ].
	
	instVarNames doWithIndex: [ :each :index | 
		bindings add: (each -> (self instVarAt: index))].
	
	1 to: (indexedVarsSize min: 21) do: [ :index | 
		bindings add: (index asString -> (self _at: index)) ].
	
	((indexedVarsSize - 20) max: 22) to: indexedVarsSize do: [ :index | 
		bindings add: (index asString -> (self _at: index)) ].
	
	^ bindings
%

! Class extensions for 'String'

!		Class methods for 'String'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: String
gtGsInspectorIconName
	^ #stringIcon
%

!		Instance methods for 'String'

category: '*GToolkit-RemotePhlow-GemStone'
method: String
gtDisplayOn: writeStream
	writeStream nextPutAll: self
%

