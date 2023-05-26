! Class Declarations
! Generated file, do not Edit

doit
(Object
	subclass: 'GtPhlowDeclarativeListingType'
	instVarNames: #( type )
	classVars: #( Icon IconifiedLink Text TextualLink Unknown )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		immediateInvariant.
true.
%

removeallmethods GtPhlowDeclarativeListingType
removeallclassmethods GtPhlowDeclarativeListingType

doit
(Object
	subclass: 'GtPhlowViewSpecification'
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

removeallmethods GtPhlowViewSpecification
removeallclassmethods GtPhlowViewSpecification

doit
(GtPhlowViewSpecification
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
(GtPhlowViewSpecification
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
(GtPhlowViewSpecification
	subclass: 'GtPhlowListingViewSpecification'
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

removeallmethods GtPhlowListingViewSpecification
removeallclassmethods GtPhlowListingViewSpecification

doit
(GtPhlowListingViewSpecification
	subclass: 'GtPhlowColumnedListViewSpecification'
	instVarNames: #( columnSpecifications )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		comment: 'GtDeclarativeColumnedList supports a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported

# Internal Representation and Key Implementation Points.


## Instance Variables

	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send

';
		immediateInvariant.
true.
%

removeallmethods GtPhlowColumnedListViewSpecification
removeallclassmethods GtPhlowColumnedListViewSpecification

doit
(GtPhlowListingViewSpecification
	subclass: 'GtPhlowListViewSpecification'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		comment: '{{gtClass:GtPhlowDeclarativeListView}} supports a subset of the possible configurations of {{gtClass:name=GtPhlowListView}}.

 
#Internal Representation and Key Implementation Points.


##Instance Variables

	items:		{{gtClass:Array}} - The formatted items to display (not the raw values held in the list)


##Implementation Points

';
		immediateInvariant.
true.
%

removeallmethods GtPhlowListViewSpecification
removeallclassmethods GtPhlowListViewSpecification

doit
(GtPhlowViewSpecification
	subclass: 'GtPhlowTreeViewSpecification'
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

removeallmethods GtPhlowTreeViewSpecification
removeallclassmethods GtPhlowTreeViewSpecification

doit
(Object
	subclass: 'GtRemoteDeclarativeExamples'
	instVarNames: #( server )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-Examples';
		comment: 'GtRemoteDeclarativeGtExamples demonstrates the use of declarative views in Gtoolkit.

This class runs the examples within the one image, and thus can be run without any external server setup.  Subclasses overwrite various methods to run the examples connecting to the remote server.';
		immediateInvariant.
true.
%

removeallmethods GtRemoteDeclarativeExamples
removeallclassmethods GtRemoteDeclarativeExamples

doit
(Object
	subclass: 'GtRemotePhlowCollectionIterator'
	instVarNames: #( targetCollection )
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

removeallmethods GtRemotePhlowCollectionIterator
removeallclassmethods GtRemotePhlowCollectionIterator

doit
(GtRemotePhlowCollectionIterator
	subclass: 'GtRemotePhlowSequenceableCollectionIterator'
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

removeallmethods GtRemotePhlowSequenceableCollectionIterator
removeallclassmethods GtRemotePhlowSequenceableCollectionIterator

doit
(GtRemotePhlowCollectionIterator
	subclass: 'GtRemotePhlowUnindexedCollectionIterator'
	instVarNames: #( iterationSelector )
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

removeallmethods GtRemotePhlowUnindexedCollectionIterator
removeallclassmethods GtRemotePhlowUnindexedCollectionIterator

doit
(GtRemotePhlowUnindexedCollectionIterator
	subclass: 'GtRemotePhlowDictionaryAssociationsIterator'
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

removeallmethods GtRemotePhlowDictionaryAssociationsIterator
removeallclassmethods GtRemotePhlowDictionaryAssociationsIterator

doit
(GtRemotePhlowUnindexedCollectionIterator
	subclass: 'GtRemotePhlowDictionaryKeysIterator'
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

removeallmethods GtRemotePhlowDictionaryKeysIterator
removeallclassmethods GtRemotePhlowDictionaryKeysIterator

doit
(GtRemotePhlowUnindexedCollectionIterator
	subclass: 'GtRemotePhlowGenericCollectionIterator'
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

removeallmethods GtRemotePhlowGenericCollectionIterator
removeallclassmethods GtRemotePhlowGenericCollectionIterator

doit
(GtRemotePhlowUnindexedCollectionIterator
	subclass: 'GtRemotePhlowPluggableCollectionIterator'
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

removeallmethods GtRemotePhlowPluggableCollectionIterator
removeallclassmethods GtRemotePhlowPluggableCollectionIterator

doit
(Object
	subclass: 'GtRemotePhlowColumn'
	instVarNames: #( index title width itemComputation type spawnObjectComputation backgroundComputation )
	classVars: #( IconType TextType )
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
	subclass: 'GtRemotePhlowColumnSpecification'
	instVarNames: #( title cellWidth type spawnsObjects properties )
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

removeallmethods GtRemotePhlowColumnSpecification
removeallclassmethods GtRemotePhlowColumnSpecification

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

 
## Internal Representation and Key Implementation Points.

### Instance Variables

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
	instVarNames: #( itemsIterator )
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
	subclass: 'GtRemotePhlowItemValues'
	instVarNames: #( background itemText )
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

removeallmethods GtRemotePhlowItemValues
removeallclassmethods GtRemotePhlowItemValues

doit
(Object
	subclass: 'GtRemotePhlowProtoView'
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

removeallmethods GtRemotePhlowProtoView
removeallclassmethods GtRemotePhlowProtoView

doit
(GtRemotePhlowProtoView
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
	subclass: 'GtRemotePhlowValueNode'
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

removeallmethods GtRemotePhlowValueNode
removeallclassmethods GtRemotePhlowValueNode

doit
(GtRemotePhlowValueNode
	subclass: 'GtRemotePhlowColumnedTreeNode'
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

removeallmethods GtRemotePhlowColumnedTreeNode
removeallclassmethods GtRemotePhlowColumnedTreeNode

doit
(GtRemotePhlowValueNode
	subclass: 'GtRemotePhlowListValueNode'
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

removeallmethods GtRemotePhlowListValueNode
removeallclassmethods GtRemotePhlowListValueNode

doit
(Object
	subclass: 'GtRemotePhlowView'
	instVarNames: #( title priority definingSelector )
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

removeallmethods GtRemotePhlowView
removeallclassmethods GtRemotePhlowView

doit
(GtRemotePhlowView
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
(GtRemotePhlowView
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
(GtRemotePhlowView
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
(GtRemotePhlowDeclarativeTree
	subclass: 'GtRemotePhlowDeclarativeColumnedTree'
	instVarNames: #( columns )
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

removeallmethods GtRemotePhlowDeclarativeColumnedTree
removeallclassmethods GtRemotePhlowDeclarativeColumnedTree

doit
(GtRemotePhlowView
	subclass: 'GtRemotePhlowEmptyView'
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

removeallmethods GtRemotePhlowEmptyView
removeallclassmethods GtRemotePhlowEmptyView

doit
(GtRemotePhlowView
	subclass: 'GtRemotePhlowForwarderView'
	instVarNames: #( viewSelector objectComputation )
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

removeallmethods GtRemotePhlowForwarderView
removeallclassmethods GtRemotePhlowForwarderView

doit
(GtRemotePhlowView
	subclass: 'GtRemotePhlowListingView'
	instVarNames: #( itemsProviderComputation transformation )
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

removeallmethods GtRemotePhlowListingView
removeallclassmethods GtRemotePhlowListingView

doit
(GtRemotePhlowListingView
	subclass: 'GtRemotePhlowColumnedList'
	instVarNames: #( columns )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		comment: '{{gtClass:GtRemotePhlowDeclarativeColumnedList}} supports a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported

## Internal Representation and Key Implementation Points.

### Instance Variables
	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send

';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowColumnedList
removeallclassmethods GtRemotePhlowColumnedList

doit
(GtRemotePhlowColumnedList
	subclass: 'GtRemotePhlowDeclarativeColumnedList'
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

removeallmethods GtRemotePhlowDeclarativeColumnedList
removeallclassmethods GtRemotePhlowDeclarativeColumnedList

doit
(GtRemotePhlowListingView
	subclass: 'GtRemotePhlowList'
	instVarNames: #( itemTextBlock )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		comment: 'GtDeclarativeList supports a subset of the possible configurations of {{gtClass:name=GtPhlowListView}}.

 
## Internal Representation and Key Implementation Points.

### Instance Variables
	itemsBuilder: 	{{gtClass:BlockClosure}} - A BlockClosure that will return the (unformatted) list of items to be displayed.
	items:				{{gtClass:Array}} - The formatted items to display (not the raw values held in the list)
	itemTextBlock: 	{{gtClass:BlockClosure}} - A BlockClosure (or Symbol) that converts each item to its displayed format.  The result of the BlockClosure must be a JSON primitive type, effectively a string or number.


### Implementation Points
';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowList
removeallclassmethods GtRemotePhlowList

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
		comment: 'GtRemotePhlowViewedObject is responsible for serving declarative views to the client inspector.


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

! Class implementation for 'GtPhlowDeclarativeListingType'

!		Class methods for 'GtPhlowDeclarativeListingType'

category: 'initialization'
classmethod: GtPhlowDeclarativeListingType
initialize	
	Icon := #icon.
	IconifiedLink := #iconLink.
	Text := #text.
	TextualLink := #textLink.
	Unknown := #unknown
%

!		Instance methods for 'GtPhlowDeclarativeListingType'

category: 'accessing'
method: GtPhlowDeclarativeListingType
asString
	^ type
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
beIcon
	type := Icon
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
beIconLink
	type := IconifiedLink
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
beText
	type := Text
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
beTextLink
	type := TextualLink
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
beUnknown
	type := Unknown
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
ifIcon: anIconBlock ifIconLink: anIconLinkBlock ifText: aTextBlock ifTextLink: aTextLinkBlock ifUnknown: anUnknownBlock
	type = Icon
		ifTrue: [ ^ anIconBlock value ].
		
	type = IconifiedLink
		ifTrue: [ ^ anIconLinkBlock value ].
		
	type = Text
		ifTrue: [ ^ aTextBlock value ].
		
	type = TextualLink
		ifTrue: [ ^ aTextLinkBlock value ].
		
	type = Unknown
		ifTrue: [ ^ anUnknownBlock value ].
		
	self error: ('Unsupported listing view type: {1}' format: { type })
%

category: 'initialization'
method: GtPhlowDeclarativeListingType
initialize
	super initialize.
	
	type := Unknown
%

category: 'testing'
method: GtPhlowDeclarativeListingType
isUnknown
	^ type = Unknown
%

! Class implementation for 'GtPhlowViewSpecification'

!		Class methods for 'GtPhlowViewSpecification'

category: 'data transport'
classmethod: GtPhlowViewSpecification
dataIncluded
	"Answer the enumerated value for the display data being included with the specification"

	^1
%

category: 'data transport'
classmethod: GtPhlowViewSpecification
dataLazy
	"Answer the enumerated value for the display data accessor name being included with the specification.  This can then be used to retrieve the data at a later time"

	^2
%

category: 'instance creation'
classmethod: GtPhlowViewSpecification
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary.
	Subclasses will override this to add their specific attributes"

	^self new 
		title: (aDictionary at: #title);
		priority: (aDictionary at: #priority);
		dataTransport: (aDictionary at: #dataTransport);
		methodSelector: (aDictionary at: #methodSelector);
		yourself
%

!		Instance methods for 'GtPhlowViewSpecification'

category: 'converting'
method: GtPhlowViewSpecification
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation.
	Subclasses will override and add to the dictionary"

	^ Dictionary new 
		at: #viewName put: self viewName;
		at: #title put: title;
		at: #priority put: priority;
		at: #dataTransport put: dataTransport;
		at: #methodSelector put: methodSelector;
		yourself
%

category: 'accessing'
method: GtPhlowViewSpecification
dataTransport
	^ dataTransport
%

category: 'accessing'
method: GtPhlowViewSpecification
dataTransport: anObject
	dataTransport := anObject
%

category: 'initialization'
method: GtPhlowViewSpecification
initializeFromInspector: anInspector
%

category: 'testing'
method: GtPhlowViewSpecification
isWithLazyLoading
	^ self dataTransport = self class dataLazy
%

category: 'accessing'
method: GtPhlowViewSpecification
methodSelector
	^ methodSelector
%

category: 'accessing'
method: GtPhlowViewSpecification
methodSelector: aSelector
	methodSelector := aSelector
%

category: 'accessing'
method: GtPhlowViewSpecification
phlowDataSource
	^ phlowDataSource
%

category: 'accessing'
method: GtPhlowViewSpecification
phlowDataSource: aDataSource
	phlowDataSource := aDataSource
%

category: 'printing'
method: GtPhlowViewSpecification
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self title;
		nextPutAll: ', ';
		nextPutAll: self priority asString;
		nextPutAll: ')'
%

category: 'accessing'
method: GtPhlowViewSpecification
priority
	^ priority
%

category: 'accessing'
method: GtPhlowViewSpecification
priority: anObject
	priority := anObject
%

category: 'accessing'
method: GtPhlowViewSpecification
title
	^ title
%

category: 'accessing'
method: GtPhlowViewSpecification
title: anObject
	title := anObject
%

category: 'accessing'
method: GtPhlowViewSpecification
viewName
	"Answer the name of the receivers view"

	^self class name
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

! Class implementation for 'GtPhlowListingViewSpecification'

!		Instance methods for 'GtPhlowListingViewSpecification'

category: 'api - accessing'
method: GtPhlowListingViewSpecification
flushItemsIterator 

	phlowDataSource flushItemsIterator
%

category: 'initialization'
method: GtPhlowListingViewSpecification
initializeFromInspector: anInspector
	self phlowDataSource: (anInspector getDeclarativeViewFor: self methodSelector)
%

category: 'api - accessing'
method: GtPhlowListingViewSpecification
retrieveItems: anItemsCount fromIndex: anIndex
	^ self phlowDataSource 
		retrieveItems: anItemsCount fromIndex: anIndex
%

category: 'accessing'
method: GtPhlowListingViewSpecification
retrieveItemsFromIndex: anIndex
	^ self retrieveItems: 100 fromIndex: anIndex
%

category: 'api - accessing'
method: GtPhlowListingViewSpecification
retrieveTotalItemsCount
	^ self phlowDataSource retrieveTotalItemsCount
%

category: 'accessing'
method: GtPhlowListingViewSpecification
retriveFormattedItems
	^ self phlowDataSource 
		retrieveItems: self totalItemsCount fromIndex: 1
%

category: 'api - accessing'
method: GtPhlowListingViewSpecification
retriveSentItemAt: aSelectionIndex
	^ self phlowDataSource retriveSentItemAt: aSelectionIndex
%

category: 'accessing'
method: GtPhlowListingViewSpecification
totalItemsCount
	^ totalItemsCount ifNil: [ 
		totalItemsCount := self phlowDataSource retrieveTotalItemsCount ]
%

! Class implementation for 'GtPhlowColumnedListViewSpecification'

!		Class methods for 'GtPhlowColumnedListViewSpecification'

category: 'instance creation'
classmethod: GtPhlowColumnedListViewSpecification
fromJSONDictionary: aDictionary

	| list |

	list := super fromJSONDictionary: aDictionary.
	list
		columnSpecifications: ((aDictionary at: #columnSpecifications)
			collect: [ :aColumnSpecificationJson |
				GtRemotePhlowColumnSpecification 
					fromJSONDictionary: aColumnSpecificationJson ]).
	
	^list
%

!		Instance methods for 'GtPhlowColumnedListViewSpecification'

category: 'converting'
method: GtPhlowColumnedListViewSpecification
asDictionaryForExport 
	| dictionary |

	dictionary := super asDictionaryForExport 
		at: #columnSpecifications put: (self columnSpecifications
			collect: [ :aColumnSpecification |
				aColumnSpecification asDictionaryForExport ]);
		yourself.

	^dictionary
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
columnSpecifications
	^ columnSpecifications
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
columnSpecifications: anObject
	columnSpecifications := anObject
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
columnTitles
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification title ]
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
columnTypes
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification type ]
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
columnWidths
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification cellWidth ]
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
retrieveItems: anItemsCount fromIndex: anIndex
	^ (super retrieveItems: anItemsCount fromIndex: anIndex) 
			"collect: [ :cellValuesDictionary |
				cellValuesDictionary collect: [ :aCellValueDictionary |
					GtRemotePhlowItemValues fromJSONDictionary: aCellValueDictionary ] ]"
%

category: 'api - accessing'
method: GtPhlowColumnedListViewSpecification
retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex	
	^ self phlowDataSource 
		retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex
%

! Class implementation for 'GtPhlowListViewSpecification'

!		Class methods for 'GtPhlowListViewSpecification'

category: 'instance creation'
classmethod: GtPhlowListViewSpecification
fromJSONDictionary: aDictionary
	| list |

	list := super fromJSONDictionary: aDictionary.
	"list dataTransport = self dataIncluded ifTrue: 
		[ list items: (aDictionary at: #items) ]."
	^list
%

!		Instance methods for 'GtPhlowListViewSpecification'

category: 'converting'
method: GtPhlowListViewSpecification
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	"self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self retriveFormattedItems ]."
	^dictionary
%

! Class implementation for 'GtPhlowTreeViewSpecification'

!		Class methods for 'GtPhlowTreeViewSpecification'

category: 'instance creation'
classmethod: GtPhlowTreeViewSpecification
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

!		Instance methods for 'GtPhlowTreeViewSpecification'

category: 'converting'
method: GtPhlowTreeViewSpecification
asDictionaryForExport 
	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #items put: self items ].
	^ dictionary
%

category: 'accessing'
method: GtPhlowTreeViewSpecification
children: aBlock 

	childrenBlock := aBlock
%

category: 'initialization'
method: GtPhlowTreeViewSpecification
initialize

	super initialize.
	itemTextBlock := [ :item | item asString ].
%

category: 'accessing'
method: GtPhlowTreeViewSpecification
items 

	^ items 
%

category: 'accessing'
method: GtPhlowTreeViewSpecification
items: aBlock 

	items := aBlock
%

category: 'accessing'
method: GtPhlowTreeViewSpecification
itemText: aBlock 

	itemTextBlock := aBlock
%

! Class implementation for 'GtRemoteDeclarativeExamples'

!		Instance methods for 'GtRemoteDeclarativeExamples'

category: 'examples - views'
method: GtRemoteDeclarativeExamples
columnedListView
	<gtExample>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtColumnedListFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	self assert: view title equals: 'Columned list'.
	self assert: view columnTitles equals: #(Value Lowercase).
	self assert: view columnWidths equals: #(nil 100).
	self assert: view columnTypes equals: #(text text).
	view dataTransport = GtPhlowViewSpecification dataIncluded ifTrue:
		[ data := view items.
		self assert: data size equals: 3.
		self assert: data first equals: #('42' '42').
		self assert: data second equals: #('Hello World' 'hello world') ].
	view dataTransport = GtPhlowViewSpecification dataLazy ifTrue:
		[ self columnedListViewLazyCheck: viewProxy ].
	^ view
%

category: 'private'
method: GtRemoteDeclarativeExamples
columnedListViewLazyCheck: viewProxy
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtColumnedListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.
%

category: 'private'
method: GtRemoteDeclarativeExamples
declarativeViewNames
	"Answer the expected array of declarative views from the remote.
	Subclasses may overwrite this if the set of views is different."

	^ #('gtLargeListFor:' 'gtStringFor:' 'gtListFor:' 'gtLargeColumnedListWithIndexFor:' 'gtColumnedListFor:' 'gtLargeColumnedListFor:' 'gtRemotePrintFor:')
%

category: 'private'
method: GtRemoteDeclarativeExamples
getRemoteObject

	^ GtRemotePhlowDeclarativeTestInspectable new
%

category: 'private'
method: GtRemoteDeclarativeExamples
getViewedObjectProxy
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"

	^ GtRemotePhlowViewedObject object: self remoteObject.
%

category: 'examples - views'
method: GtRemoteDeclarativeExamples
listView
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary view data |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtListFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	self assert: view title equals: #List.
	self assert: view priority equals: 15.
	view dataTransport = GtPhlowViewSpecification dataIncluded ifTrue:
		[ data := view items.
		self assert: data size equals: 3.
		self assert: data equals: self listViewDisplayArray ].
	view dataTransport = GtPhlowViewSpecification dataLazy ifTrue:
		[ self listViewLazyCheck: viewProxy ].
	^ view
%

category: 'private - commands'
method: GtRemoteDeclarativeExamples
listViewDisplayArray
	"Answer the command Array returned by the remote's list view"

	^ #('42' 'Hello World' '2021-04-06T14:43:49.623384+02:00')
%

category: 'private'
method: GtRemoteDeclarativeExamples
listViewLazyCheck: viewProxy
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.
%

category: 'private'
method: GtRemoteDeclarativeExamples
printForString
	"Answer the string returned in the #gtPrintFor: view.
	Subclasses may overwrite this as appropriate."

	^ 'a GtRemotePhlowDeclarativeTestInspectable'
%

category: 'examples - views'
method: GtRemoteDeclarativeExamples
printView
	"Disable since this relies on having GToolkit-RemotePhlow-InspectorExtensions,
	which is currently not the case in the CI"
	"<gtExample>"
	<after: #stopServer>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtRemotePrintFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	self assert: view title equals: #Print.
	self assert: view string equals: self printForString.
	^ view
%

category: 'examples'
method: GtRemoteDeclarativeExamples
remoteObject
	"Answer the remote GtDeclarativeTestInspectable instance.
	This will be a proxy with a remote server."
	<gtExample>
	<after: #stopServer>
	| remoteObject collection |

	remoteObject :=  self getRemoteObject.

	self assert: remoteObject string equals: 'hello world'.

	collection :=  remoteObject collectionOfObjects.
	"Check the size and immediate value objects, but assume that proxies are working correctly"
	self assert: collection size equals: 3.
	self assert: collection first equals: 42.
	self assert: collection second equals: 'Hello World'.

	^ remoteObject
%

category: 'private'
method: GtRemoteDeclarativeExamples
runningServer
	"Answer a running server.
	No server is required running the examples in a single image.
	Subclasses should overwrite this to start the server"
	<gtExample>
	<after: #stopServer>
%

category: 'private'
method: GtRemoteDeclarativeExamples
stopServer 

	server ifNotNil: 
		[ server stop.
		server := nil ]
%

category: 'examples - views'
method: GtRemoteDeclarativeExamples
stringView
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtStringFor:.
	view :=  GtPhlowViewSpecification fromDictionary: viewDictionary.
	self assert: view title equals: #String.
	self assert: view string equals: 'hello world'.
	^ view
%

category: 'examples'
method: GtRemoteDeclarativeExamples
viewedObjectProxy
	"Answer the GtRemotePhlowViewedObject proxy for the remote object"
	<gtExample>
	<after: #stopServer>
	| viewedObject declarativeViews |

	viewedObject :=  self getViewedObjectProxy.

	"The set of views can vary depending on configuration,
	just check that a common view is present."
	declarativeViews :=  viewedObject getDeclarativeViewMethodNames.
	self assert: (declarativeViews includes: #gtListFor:).

	^ viewedObject
%

! Class implementation for 'GtRemotePhlowCollectionIterator'

!		Class methods for 'GtRemotePhlowCollectionIterator'

category: 'as yet unclassified'
classmethod: GtRemotePhlowCollectionIterator
forCollection: aCollection
	^ self new
		targetCollection: aCollection
%

!		Instance methods for 'GtRemotePhlowCollectionIterator'

category: 'converting'
method: GtRemotePhlowCollectionIterator
asGPhlowItemsIterator
	^ self
%

category: 'iterating'
method: GtRemotePhlowCollectionIterator
forElementsFrom: startIndex to: endIndex withIndexDo: aBlock
	self subclassResponsibility
%

category: 'accessing'
method: GtRemotePhlowCollectionIterator
targetCollection: aCollection
	targetCollection := aCollection
%

category: 'accessing'
method: GtRemotePhlowCollectionIterator
totalItemsCount
	^ targetCollection 
		ifNil: [ 0 ] 
		ifNotNil:  [ :aCollection | aCollection size ]
%

! Class implementation for 'GtRemotePhlowSequenceableCollectionIterator'

!		Instance methods for 'GtRemotePhlowSequenceableCollectionIterator'

category: 'iterating'
method: GtRemotePhlowSequenceableCollectionIterator
forElementsFrom: startIndex to: endIndex withIndexDo: aBlock
	| limitedStartIndex limitedEndIndex |
	
	limitedStartIndex := 1 max: startIndex.
	limitedEndIndex := targetCollection size min: endIndex.
	limitedStartIndex to: limitedEndIndex do: [ :anIndex |
		aBlock value: (targetCollection at: anIndex) value: anIndex ]
%

! Class implementation for 'GtRemotePhlowUnindexedCollectionIterator'

!		Instance methods for 'GtRemotePhlowUnindexedCollectionIterator'

category: 'iterating'
method: GtRemotePhlowUnindexedCollectionIterator
forElementsFrom: startIndex to: endIndex withIndexDo: aBlock
	| limitedStartIndex limitedEndIndex iterationIndex|
	
	limitedStartIndex := 1 max: startIndex.
	limitedEndIndex := targetCollection size min: endIndex.
	
	iterationIndex := 1.
	targetCollection perform: self iterationSelector with: [ :anElement |
		"Terminate the iteration if the last element was visited."
		iterationIndex > limitedEndIndex ifTrue: [ ^ self ].
		
		"While between the start and stop indexes visit each element."
		iterationIndex >= limitedStartIndex ifTrue: [ aBlock value: anElement value: iterationIndex ].
		iterationIndex := iterationIndex + 1 ]
%

category: 'accessing'
method: GtRemotePhlowUnindexedCollectionIterator
iterationSelector
	self subclassResponsibility
%

! Class implementation for 'GtRemotePhlowDictionaryAssociationsIterator'

!		Instance methods for 'GtRemotePhlowDictionaryAssociationsIterator'

category: 'accessing'
method: GtRemotePhlowDictionaryAssociationsIterator
iterationSelector
	^ #associationsDo:
%

! Class implementation for 'GtRemotePhlowDictionaryKeysIterator'

!		Instance methods for 'GtRemotePhlowDictionaryKeysIterator'

category: 'accessing'
method: GtRemotePhlowDictionaryKeysIterator
iterationSelector
	^ #keysDo:
%

! Class implementation for 'GtRemotePhlowGenericCollectionIterator'

!		Instance methods for 'GtRemotePhlowGenericCollectionIterator'

category: 'accessing'
method: GtRemotePhlowGenericCollectionIterator
iterationSelector
	^ #do:
%

! Class implementation for 'GtRemotePhlowPluggableCollectionIterator'

!		Instance methods for 'GtRemotePhlowPluggableCollectionIterator'

category: 'accessing'
method: GtRemotePhlowPluggableCollectionIterator
iterationSelector
	^ iterationSelector
%

category: 'accessing'
method: GtRemotePhlowPluggableCollectionIterator
iterationSelector: aSelector
	iterationSelector := aSelector
%

! Class implementation for 'GtRemotePhlowColumn'

!		Class methods for 'GtRemotePhlowColumn'

category: 'initialization'
classmethod: GtRemotePhlowColumn
initialize
	TextType := #text.
	IconType := #icon
%

!		Instance methods for 'GtRemotePhlowColumn'

category: 'converting'
method: GtRemotePhlowColumn
asGtDeclarativeColumnDataType
	^ self isWithIcon
		ifTrue: [ self isSpawningObject
			ifTrue: [ GtPhlowDeclarativeListingType new beIconLink ]
			ifFalse: [ GtPhlowDeclarativeListingType new beIcon ] ]
		ifFalse: [ self isSpawningObject
			ifTrue: [ GtPhlowDeclarativeListingType new beTextLink ]
			ifFalse: [ GtPhlowDeclarativeListingType new beText ] ]
%

category: 'api - scripting'
method: GtRemotePhlowColumn
background: aComputation
	backgroundComputation := aComputation
%

category: 'accessing'
method: GtRemotePhlowColumn
backgroundComputation
	^ backgroundComputation
%

category: 'accessing'
method: GtRemotePhlowColumn
cellWidth
	^ width
%

category: 'computation'
method: GtRemotePhlowColumn
computeItemValuesFor: anObject rowIndex: rowIndex columnIndex: columnIndex
	| cellValues itemValue |
	cellValues := GtRemotePhlowItemValues new.
	
	itemValue := self itemComputation 
		cull: anObject cull: rowIndex cull: columnIndex.
		
	cellValues 
		itemText: itemValue gtDisplayString.
	self hasBackgroundComputation ifTrue: [
		cellValues 
			background: (self backgroundComputation
				cull: itemValue cull: anObject cull: rowIndex cull: columnIndex) ].
	
	^ cellValues
%

category: 'testings'
method: GtRemotePhlowColumn
hasBackgroundComputation
	^ backgroundComputation notNil
%

category: 'api - scripting'
method: GtRemotePhlowColumn
iconName: aBlock
	itemComputation := aBlock.
	type := IconType
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
isSpawningObject
	^ spawnObjectComputation notNil
%

category: 'testing'
method: GtRemotePhlowColumn
isWithIcon
	^ type = IconType
%

category: 'accessing'
method: GtRemotePhlowColumn
itemComputation
	^ itemComputation ifNil: [ 
		itemComputation := [ :item | item ] ]
%

category: 'private - accessing'
method: GtRemotePhlowColumn
rowStencil
	^ nil
%

category: 'accessing'
method: GtRemotePhlowColumn
spawnObject: aBlock
	"aBlock should return an Object that should be spawned when clicked on:
		- a link button if the column data type is #text
		- a link icon if the column data type is #icon.

	Setting a spawnObject influences how a cell is rendered"

	spawnObjectComputation := aBlock
%

category: 'accessing'
method: GtRemotePhlowColumn
spawnObjectComputation
	"If nil, the cell does not spawn an object"

	^ spawnObjectComputation
%

category: 'api - scripting'
method: GtRemotePhlowColumn
text: aBlock
	itemComputation := aBlock.
	type := TextType
%

category: 'accessing'
method: GtRemotePhlowColumn
title
	^ title
%

category: 'api - scripting'
method: GtRemotePhlowColumn
title: anObject
	title := anObject
%

category: 'accessing'
method: GtRemotePhlowColumn
width: aCellWidth
	width := aCellWidth
%

! Class implementation for 'GtRemotePhlowColumnSpecification'

!		Class methods for 'GtRemotePhlowColumnSpecification'

category: 'instance creation'
classmethod: GtRemotePhlowColumnSpecification
fromJSONDictionary: aDictionary

	| column |

	column := self new.
	column
		title: (aDictionary at: #title);
		cellWidth: (aDictionary at: #cellWidth);
		type: (aDictionary at: #type);
		spawnsObjects: (aDictionary at: #spawnsObjects);
		properties: (aDictionary at: #properties) asOrderedCollection.
		
	^column
%

!		Instance methods for 'GtRemotePhlowColumnSpecification'

category: 'conversion'
method: GtRemotePhlowColumnSpecification
asDictionaryForExport 
	| dictionary |

	dictionary := Dictionary new 
		at: #title put: title;
		at: #cellWidth put: cellWidth;
		at: #type put: type;
		at: #spawnsObjects put: spawnsObjects;
		at: #properties put: self properties asArray;
		yourself.

	^ dictionary
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
cellWidth
	^ cellWidth
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
cellWidth: anObject
	cellWidth := anObject
%

category: 'testing'
method: GtRemotePhlowColumnSpecification
hasBackground
	^ self hasPropertyNamed: #background
%

category: 'testing'
method: GtRemotePhlowColumnSpecification
hasPropertyNamed: aString 
	^ self properties includes: #background
%

category: 'testing'
method: GtRemotePhlowColumnSpecification
markAsHavingBackground
	self markAsHavingPropertyNamed: #background
%

category: 'testing'
method: GtRemotePhlowColumnSpecification
markAsHavingPropertyNamed: aSymbol 
	(self hasPropertyNamed:  aSymbol) ifTrue: [ ^ self ].
	
	self properties add: aSymbol
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
properties
	^ properties ifNil: [ 
		properties := OrderedCollection new ]
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
properties: anObject
	properties := anObject
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
spawnsObjects
	^ spawnsObjects
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
spawnsObjects: anObject
	spawnsObjects := anObject
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
title
	^ title
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
title: anObject
	title := anObject
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
type
	^ type
%

category: 'accessing'
method: GtRemotePhlowColumnSpecification
type: anObject
	type := anObject
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
		title: 'Columned list';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Lowercase' text: [ :anObject | anObject asString asLowercase ] width: 100.
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtColumnedListSpawnTextFor: aView
	<gtView>

	^aView columnedList
		title: 'Spawn text columned list';
		priority: 20;
		items: [ collectionOfObjects ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Class' 
			text: [ :anObject | anObject class name ] 
			spawn: [ :anObject | anObject class ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtColumnedTreeFor: aView
	<gtView>

	^aView columnedTree
		title: 'Columned Tree';
		priority: 35;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		column: 'x' text: [ :aNumber | aNumber ];
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtForwardListFor: aView
	<gtView>

	^aView forward
		title: 'Forward List';
		priority: 45;
		object: [ self ];
		view: #gtListFor:
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtForwardListTwiceFor: aView
	<gtView>

	^aView forward
		title: 'Forward List Twice';
		priority: 46;
		object: [ self ];
		view: #gtForwardListFor:
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtItemsWithBackgroundFor: aView
	<gtView>
	
	^ aView columnedList
		title: 'background: usage';
		priority: 50;
		items: [ {
			'Bob' -> -43.
			'Alice' -> 27.
			'Mike' -> 0.
			'Jane' -> -32.
			'Ben' -> 12
		} ];
		column: 'name' text: [ :x | x key ];
		column: 'value' do: [ :aColumn |
			aColumn
				text: [ :x | x value ];
				background: [ :v |
					v > 0
						ifTrue: [ 
							"GtPhlowColorBuilder named: #green alpha: 0.3"
							#(0.0  1.0  0.0  0.2980392156862745)
							"Color green alpha: 0.3" ]
						ifFalse: [ v < 0
							ifTrue: [ 
								#(1.0 0.0 0.0 0.2980392156862745)
								"Color red alpha: 0.3" ]
							ifFalse: [ 
								#(0.5004887585532747 0.5004887585532747 0.5004887585532747  0.2980392156862745)
								"Color gray alpha: 0.3" ] ] ] ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeColumnedListFor: aView
	<gtView>

	^aView columnedList
		title: 'Large columned list' ;
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Value' text: [ :anObject | anObject ];
		column: 'Value * 10' text: [ :anObject | (anObject * 10) asString asLowercase ] width: 100.
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeColumnedListWithIndexFor: aView
	<gtView>

	^aView columnedList
		title: 'Large columned list with index';
		priority: 21;
		items: [ 1 to: 1022 ];
		column: 'Index' text: [ :anObject  :anIndex | anIndex ];
		column: 'Value' text: [ :anObject | anObject ].
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtLargeListFor: aView
	<gtView>

	^aView list
		title: 'Large list';
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

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtTreeFor: aView
	<gtView>

	^aView tree
		title: 'Tree';
		priority: 30;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number']
%

category: 'initialization'
method: GtRemotePhlowDeclarativeTestInspectable
initialize 

	super initialize.
	string := 'hello world'.
	collectionOfObjects := { 
		42. 
		'Hello World'. 
		DateAndTime readFrom: '2021-04-06T14:43:49.623384+02:00' readStream }.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeTestInspectable
printStringFor: anObject
	^ anObject printString
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

	view := GtRemotePhlowProtoView new tree.
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

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
flushItemsIterator
	"Flush the items iterator to force the displayed values to be regenerated"

	itemsIterator := nil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
formatItem: anObject atIndex: anIndex
	self subclassResponsibility
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
itemsIterator
	^ itemsIterator ifNil: [ 
		itemsIterator := self phlowView itemsProviderComputation value asGPhlowItemsIterator ]
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
retrieveItems: anItemsCount fromIndex: startIndex
	| computedItemValues endIndex |

	computedItemValues := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self itemsIterator 
		forElementsFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :anObject :anItemIndex |
			computedItemValues add: (self 
				formatItem: anObject atIndex: anItemIndex)].
	^ computedItemValues asArray
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
retrieveTotalItemsCount
	^ self itemsIterator totalItemsCount
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
retriveSentItemAt: aSelectionIndex
	"Answer the raw value at the supplied index"
	
	self itemsIterator 
		forElementsFrom: aSelectionIndex 
		to: aSelectionIndex 
		withIndexDo: [ :anObject :anItemIndex |
			^ self phlowView transformation 
				transformedValueFrom: anObject
				selection: aSelectionIndex ].
	^ nil
%

! Class implementation for 'GtRemotePhlowDeclarativeViewColumnedListDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewColumnedListDataSource'

category: 'instance creation'
method: GtRemotePhlowDeclarativeViewColumnedListDataSource
formatItem: anObject atIndex: rowIndex
	| phlowColumns columnItems |

	phlowColumns := self phlowView columns.

	columnItems := Array new: phlowColumns size.

	phlowColumns withIndexDo: [ :column :columnIndex | 
		| computedValues |
	
		computedValues := column 
			computeItemValuesFor: anObject
			rowIndex: rowIndex
			columnIndex: columnIndex.
	
		columnItems 
			at: columnIndex
			put: computedValues ].

	^ columnItems collect: [ :anItemValues |
		anItemValues asDictionaryForExport ]
%

category: 'api'
method: GtRemotePhlowDeclarativeViewColumnedListDataSource
retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex	
	self itemsIterator 
		forElementsFrom: aRowIndex 
		to: aRowIndex 
		withIndexDo: [ :aRowObject :anItemIndex |
			| aColumn aSpawnedObject |
			
			aColumn := self phlowView columns at: aColumnIndex.
			aSpawnedObject := aColumn isSpawningObject
				ifTrue: [ aColumn spawnObjectComputation cull: aRowObject cull: anItemIndex  ]
				ifFalse: [ aRowObject ].
			^ aSpawnedObject ].
	^ nil
%

! Class implementation for 'GtRemotePhlowDeclarativeViewListDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewListDataSource'

category: 'api'
method: GtRemotePhlowDeclarativeViewListDataSource
formatItem: anObject atIndex: rowIndex
	^ (self phlowView itemComputation cull: anObject cull: rowIndex) gtDisplayString
%

! Class implementation for 'GtRemotePhlowItemValues'

!		Instance methods for 'GtRemotePhlowItemValues'

category: 'converting'
method: GtRemotePhlowItemValues
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		at: #itemText put: self itemText;
		yourself.
		
	self background ifNotNil: [ :aBackground |
		| backgroundValue |
		aBackground class name = #Array 
			ifTrue: [backgroundValue := aBackground]
			ifFalse: [
				backgroundValue := (Array
			with: aBackground red 
			with: aBackground green 
			with: aBackground blue 
			with:aBackground alpha) ].
				
		data at: #background put: backgroundValue ].
	^ data
%

category: 'accessing'
method: GtRemotePhlowItemValues
background
	^ background
%

category: 'accessing'
method: GtRemotePhlowItemValues
background: anObject
	background := anObject
%

category: 'accessing'
method: GtRemotePhlowItemValues
itemText
	^ itemText
%

category: 'accessing'
method: GtRemotePhlowItemValues
itemText: anObject
	itemText := anObject
%

category: 'printing'
method: GtRemotePhlowItemValues
printOn: aStream 
	super printOn: aStream .
	
	aStream parenthesize: [
		aStream << self itemText.
		self background ifNotNil: [ :aBackground |
			aStream 
				<< ', background: ';
				print: aBackground ] ]
%

! Class implementation for 'GtRemotePhlowProtoView'

!		Instance methods for 'GtRemotePhlowProtoView'

category: 'decorating'
method: GtRemotePhlowProtoView
columnedList

	^ self declarativeViewOfType: GtRemotePhlowColumnedList
%

category: 'decorating'
method: GtRemotePhlowProtoView
columnedTree

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeColumnedTree
%

category: 'private'
method: GtRemotePhlowProtoView
declarativeViewOfType: aGtDeclarativeViewClass
	"Answer a new declarative view instance"

	^ aGtDeclarativeViewClass new.
%

category: 'decorating'
method: GtRemotePhlowProtoView
empty

	^ self declarativeViewOfType: GtRemotePhlowEmptyView
%

category: 'decorating'
method: GtRemotePhlowProtoView
forward

	^ self declarativeViewOfType: GtRemotePhlowForwarderView
%

category: 'decorating'
method: GtRemotePhlowProtoView
list

	^ self declarativeViewOfType: GtRemotePhlowList
%

category: 'decorating'
method: GtRemotePhlowProtoView
table

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTable
%

category: 'decorating'
method: GtRemotePhlowProtoView
textEditor

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTextEditor
%

category: 'decorating'
method: GtRemotePhlowProtoView
tree

	^ self declarativeViewOfType: GtRemotePhlowDeclarativeTree
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

! Class implementation for 'GtRemotePhlowView'

!		Instance methods for 'GtRemotePhlowView'

category: 'converting'
method: GtRemotePhlowView
asGtDeclarativeView
	^ nil
%

category: 'testing'
method: GtRemotePhlowView
canBeGtDeclarativeView
	^ true
%

category: 'accessing'
method: GtRemotePhlowView
definingSelector

	^ definingSelector
%

category: 'accessing'
method: GtRemotePhlowView
definingSelector: aSelector

	definingSelector := aSelector
%

category: 'printing'
method: GtRemotePhlowView
printOn: aStream
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << (self title ifNil: ['']) ]
%

category: 'accessing'
method: GtRemotePhlowView
priority
	^ priority
%

category: 'accessing'
method: GtRemotePhlowView
priority: anObject
	priority := anObject
%

category: 'accessing'
method: GtRemotePhlowView
title
	^ title
%

category: 'accessing'
method: GtRemotePhlowView
title: anObject
	title := anObject
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
		dataTransport: GtPhlowViewSpecification dataIncluded.
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

	^ GtPhlowTreeViewSpecification new 
		title: self title;
		priority: self priority;
		items: (Array streamContents: [ :stream |
			self itemsBuilder value doWithIndex: [ :item :i |
				self add: item index: { i } to: stream ] ]);
		dataTransport: GtPhlowViewSpecification dataIncluded.
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

! Class implementation for 'GtRemotePhlowDeclarativeColumnedTree'

!		Instance methods for 'GtRemotePhlowDeclarativeColumnedTree'

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName iconName: anIconNameComputation
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName iconName: anIconNameComputation spawn: aSpawnBlock
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName iconName: anIconNameComputation spawn: aSpawnBlock width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName iconName: anIconNameComputation width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName text: aBlockClosure
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName text: aBlockClosure spawn: aSpawnBlock
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
column: columnName text: aBlockClosure width: aNumberOrNil
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn width: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeColumnedTree
columns
	^ columns ifNil: [
		columns := OrderedCollection new ]
%

! Class implementation for 'GtRemotePhlowForwarderView'

!		Instance methods for 'GtRemotePhlowForwarderView'

category: 'converting'
method: GtRemotePhlowForwarderView
asGtDeclarativeView
	^ (objectComputation value 
		perform: viewSelector withArguments: { 
			 GtRemotePhlowProtoView new }) asGtDeclarativeView
			 	title: self title;
			 	priority: self priority
%

category: 'api - scripting'
method: GtRemotePhlowForwarderView
object: anObjectComputation
	objectComputation := anObjectComputation.
%

category: 'api - scripting'
method: GtRemotePhlowForwarderView
view: aSelector
	viewSelector := aSelector
%

! Class implementation for 'GtRemotePhlowListingView'

!		Instance methods for 'GtRemotePhlowListingView'

category: 'accessing'
method: GtRemotePhlowListingView
defaultTransformation
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
%

category: 'api - scripting'
method: GtRemotePhlowListingView
items: aBlockClosure
	itemsProviderComputation := aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowListingView
itemsProviderComputation
	^ itemsProviderComputation ifNil: [ 
		itemsProviderComputation := #() asGPhlowItemsIterator ]
%

category: 'api - scripting'
method: GtRemotePhlowListingView
send: aBlock
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
%

category: 'accessing'
method: GtRemotePhlowListingView
transformation 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
%

category: 'accessing'
method: GtRemotePhlowListingView
transformation: aGtPhlowSendTransformation
	transformation := aGtPhlowSendTransformation.
%

! Class implementation for 'GtRemotePhlowColumnedList'

!		Instance methods for 'GtRemotePhlowColumnedList'

category: 'converting'
method: GtRemotePhlowColumnedList
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowColumnedListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		columnSpecifications: (columns asArray collect: [ :aColumn | 
			| columnSpecification|
			columnSpecification := GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType asString;
				spawnsObjects: aColumn isSpawningObject.
			
			aColumn hasBackgroundComputation ifTrue: [ 
				columnSpecification  markAsHavingBackground ].
			columnSpecification ] ) ;
		dataTransport: GtPhlowViewSpecification dataLazy
%

category: 'accessing'
method: GtRemotePhlowColumnedList
column
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := GtRemotePhlowColumn new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: aTitleString do: aBlock
	| aColumn |
	aColumn := self column.
	aColumn title: aTitleString.
	aBlock value: aColumn
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName iconName: anIconNameComputation
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName iconName: anIconNameComputation spawn: aSpawnBlock
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName iconName: anIconNameComputation spawn: aSpawnBlock width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName iconName: anIconNameComputation width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn iconName: anIconNameComputation.
	aColumn width: aNumberOrNil.
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName text: aBlockClosure
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName text: aBlockClosure spawn: aSpawnBlock
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn spawnObject: aSpawnBlock.
	aColumn width: aNumberOrNil.
%

category: 'api - scripting column'
method: GtRemotePhlowColumnedList
column: columnName text: aBlockClosure width: aNumberOrNil
 	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure.
	aColumn width: aNumberOrNil.
%

category: 'accessing'
method: GtRemotePhlowColumnedList
columns
	^ columns ifNil: [
		columns := OrderedCollection new ]
%

! Class implementation for 'GtRemotePhlowList'

!		Instance methods for 'GtRemotePhlowList'

category: 'converting'
method: GtRemotePhlowList
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowViewSpecification dataLazy.
%

category: 'private - accessing'
method: GtRemotePhlowList
itemComputation

	^ self itemText
%

category: 'accessing'
method: GtRemotePhlowList
itemText
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ] 
%

category: 'api - scripting'
method: GtRemotePhlowList
itemText: aBlockClosure

	itemTextBlock := aBlockClosure
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
	declarativeViewsBySelector ifNil: [ 
		self initializeDeclarativeViews ].
	^ declarativeViewsBySelector
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getDeclarativeViewFor: viewSelector
	^ self declarativeViewsBySelector at: viewSelector
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getDeclarativeViewMethodNames
	"Answer the set of declarative view selectors provided by the object"

	^ self declarativeViewsBySelector keys
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getViewDeclaration: viewSelector
	| declarativeView |
	declarativeView := self getDeclarativeViewFor: viewSelector.
	^ self getViewDeclarationForView: declarativeView
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getViewDeclarationForView: aDeclarativeView

	^ aDeclarativeView asDictionaryForExport
%

category: 'api - accessing'
method: GtRemotePhlowViewedObject
getViewsDeclarations
	| viewDeclarations |
	viewDeclarations := (self declarativeViewsBySelector 
		collect: [ :declarativeView |
			self getViewDeclarationForView: declarativeView ]).
	^ Dictionary new
		at: 'views' put: viewDeclarations asArray;
		yourself
%

category: 'initialization'
method: GtRemotePhlowViewedObject
initializeDeclarativeViews
	| phlowViews |
	declarativeViewsBySelector := Dictionary new.
	
	phlowViews := self phlowDeclarativeViews.
	phlowViews do: [ :aPhlowView | 
		| declarativeView |
		declarativeView := aPhlowView asGtDeclarativeView.
		declarativeView ifNotNil: [
			declarativeView methodSelector: aPhlowView definingSelector.
			declarativeViewsBySelector 
				at: aPhlowView definingSelector 
				put: declarativeView ] ]
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

category: 'initialization'
method: GtRemotePhlowViewedObject
phlowDeclarativeViews
	"Retrieve the objects declarative views.
	If the default Raw view can't be declarative, provide one that is."
	| views |

	views := object gtDeclarativePhlowViews.
	views 
		detect: [ :each | each title = 'Raw' ]
		ifNone: [ views add: (object gtRemoteGtRawFor: #GtPhlowView asClass empty) ].
	
	^ views
%

! Class extensions for 'AbstractDictionary'

!		Instance methods for 'AbstractDictionary'

category: '*GToolkit-RemotePhlow-InspectorExtensions-GemStone'
method: AbstractDictionary
asGPhlowAssociationsIterator
	^ GtRemotePhlowDictionaryAssociationsIterator forCollection: self
%

category: '*GToolkit-RemotePhlow-InspectorExtensions-GemStone'
method: AbstractDictionary
asGPhlowKeysIterator
	^ GtRemotePhlowDictionaryKeysIterator forCollection: self
%

category: '*GToolkit-RemotePhlow-InspectorExtensions-GemStone'
method: AbstractDictionary
gtRemoteItemsFor: aView
	^ aView columnedList
		title: 'Items';
		priority: 1;
		items: [ self asGPhlowAssociationsIterator ];
		column: 'Key' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ]
%

category: '*GToolkit-RemotePhlow-InspectorExtensions-GemStone'
method: AbstractDictionary
gtRemoteKeysFor: aView
	<gtView>
	^ aView list
		title: 'Keys';
		priority: 5;
		items: [ self asGPhlowKeysIterator ]
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

!		Instance methods for 'Collection'

category: '*GToolkit-RemotePhlow-PhlowViews'
method: Collection
asGPhlowItemsIterator
	^ GtRemotePhlowGenericCollectionIterator forCollection: self
%

category: '*GToolkit-RemotePhlow-InspectorExtensions-Remote'
method: Collection
gtRemoteItemsFor: aView
	<gtView>
	^ aView list
		title: 'Items';
		priority: 50;
		items: [ self ];
		itemText: [ :eachItem | eachItem gtDisplayString ]
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

	^ aJsonObject asJson
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

	variableBindings := object gtRemoteVariableValuePairsWithSelfIf: true.

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

category: '*GToolkit-RemotePhlow-InspectorCore'
method: Object
gtDeclarativePhlowViews
	"Answer a collection of the object's declarative phlow view"
	
	^ self gtViewsInCurrentContext
		select: [ :view | view canBeGtDeclarativeView ]
%

category: '*GToolkit-RemotePhlow-Remote'
method: Object
gtDeclarativeViewPragms
	"Answer a collection of the object's declarative view selectors"

	^ Pragma 
		allNamed: #gtView
		from: self class
		to: Object
%

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtDeclarativeViewSelectors
	"Answer a collection of the object's declarative view selectors"

	^ ((Pragma 
		allNamed: #gtView
		from: self class
		to: Object) collect: [ :each | each method selector ]) asSet asArray
%

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

category: '*GToolkit-RemotePhlow-InspectorExtensions-Remote'
method: Object
gtRemotePrintFor: aView
	<gtView>
	^ aView textEditor
		title: 'Print';
		priority: 110;
		text: [ self printString ]
%

category: '*GToolkit-RemotePhlow-InspectorExtensions-Remote'
method: Object
gtRemoteRawFor: aView
	<gtView>
	^ aView columnedList
		title: 'Raw';
		priority: 100;
		items: [ self gtRemoteVariableValuePairsWithSelfIf: true ];
		column: 'Icon' 
			iconName: [ :anAssociation | anAssociation value class gtSystemIconName ]
			width: 36;
		column: 'Variable' text: [ :anAssociation | anAssociation key ];
		column: 'Value' text: [ :anAssociation | anAssociation value gtDisplayString ];
		send: [ :anAssociation | anAssociation value ]
%

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtRemoteVariableValuePairsWithSelfIf: aBoolean
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

category: '*GToolkit-RemotePhlow-GemStone'
method: Object
gtSystemIconName
	^ self gtGsInspectorIconName
%

category: '*GToolkit-RemotePhlow-Remote'
method: Object
gtViewsInCurrentContext
	"Answer a collection of the object's declarative views"

	^ self gtDeclarativeViewPragms collect: [ :aPragma |
		| methodSelector phlowView |
		methodSelector := aPragma method selector.
		phlowView := self  
			perform: methodSelector
			with: GtRemotePhlowDeclarativeProtoView new.
		phlowView definingSelector: methodSelector.
		phlowView ]
%

! Class extensions for 'SequenceableCollection'

!		Instance methods for 'SequenceableCollection'

category: '*GToolkit-RemotePhlow-PhlowViews'
method: SequenceableCollection
asGPhlowItemsIterator
	^ GtRemotePhlowSequenceableCollectionIterator forCollection: self
%

category: '*GToolkit-RemotePhlow-InspectorExtensions-Remote'
method: SequenceableCollection
gtRemoteItemsFor: aView
	^ aView columnedList
		title: 'Items';
		priority: 50;
		items: [ self ];
		column: 'Index' 
			text: [ :eachItem :eachIndex | eachIndex  ]
			width: 45;
		column: 'Item' 
			text: [ :eachItem | eachItem gtDisplayString ].
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

! Class Initialization

run
GtPhlowDeclarativeListingType initialize.
GtRemotePhlowColumn initialize.
true
%
