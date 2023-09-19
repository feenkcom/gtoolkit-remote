! Class Declarations
! Generated file, do not Edit

doit
(Object
	subclass: 'GtPhlowColor'
	instVarNames: #( name red green blue alpha )
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

removeallmethods GtPhlowColor
removeallclassmethods GtPhlowColor

doit
(Object
	subclass: 'GtPhlowDeclarativeListingType'
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

removeallmethods GtPhlowDeclarativeListingType
removeallclassmethods GtPhlowDeclarativeListingType

doit
(GtPhlowDeclarativeListingType
	subclass: 'GtPhlowNumberDeclarativeListingType'
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

removeallmethods GtPhlowNumberDeclarativeListingType
removeallclassmethods GtPhlowNumberDeclarativeListingType

doit
(GtPhlowDeclarativeListingType
	subclass: 'GtPhlowTextDeclarativeListingType'
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

removeallmethods GtPhlowTextDeclarativeListingType
removeallclassmethods GtPhlowTextDeclarativeListingType

doit
(GtPhlowDeclarativeListingType
	subclass: 'GtPhlowTextLinkDeclarativeListingType'
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

removeallmethods GtPhlowTextLinkDeclarativeListingType
removeallclassmethods GtPhlowTextLinkDeclarativeListingType

doit
(GtPhlowDeclarativeListingType
	subclass: 'GtPhlowThemeIconNameDeclarativeListingType'
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

removeallmethods GtPhlowThemeIconNameDeclarativeListingType
removeallclassmethods GtPhlowThemeIconNameDeclarativeListingType

doit
(GtPhlowDeclarativeListingType
	subclass: 'GtPhlowUnknownDeclarativeListingType'
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

removeallmethods GtPhlowUnknownDeclarativeListingType
removeallclassmethods GtPhlowUnknownDeclarativeListingType

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
		comment: '{{gtClass:GtPhlowViewSpecification}} provides a declarative UI specification for presenting data that can be easily serialised and sent over the wire, including between applications written in different languages.

dataTransport is an emumerated value indicating whether the data to be displayed will be included with the specification or is available via reference or by key.]

- 1: data is included in the response
- 2: data is available by reference
- 3: data is available by reference and key (tbc)

';
		immediateInvariant.
true.
%

removeallmethods GtPhlowViewSpecification
removeallclassmethods GtPhlowViewSpecification

doit
(GtPhlowViewSpecification
	subclass: 'GtPhlowForwardViewSpecification'
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

removeallmethods GtPhlowForwardViewSpecification
removeallclassmethods GtPhlowForwardViewSpecification

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
	subclass: 'GtPhlowBasicColumnedViewSpecification'
	instVarNames: #( columnSpecifications )
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

removeallmethods GtPhlowBasicColumnedViewSpecification
removeallclassmethods GtPhlowBasicColumnedViewSpecification

doit
(GtPhlowBasicColumnedViewSpecification
	subclass: 'GtPhlowColumnedListViewSpecification'
	instVarNames: #( horizontalScrollingEnabled )
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
(GtPhlowBasicColumnedViewSpecification
	subclass: 'GtPhlowColumnedTreeViewSpecification'
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

removeallmethods GtPhlowColumnedTreeViewSpecification
removeallclassmethods GtPhlowColumnedTreeViewSpecification

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
		comment: '{{gtClass:GtPhlowListViewSpecification}} supports a subset of the possible configurations of {{gtClass:name=GtPhlowListView}}.

 
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
(GtPhlowListingViewSpecification
	subclass: 'GtPhlowTreeViewSpecification'
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

removeallmethods GtPhlowTreeViewSpecification
removeallclassmethods GtPhlowTreeViewSpecification

doit
(GtPhlowViewSpecification
	subclass: 'GtPhlowTextEditorViewSpecification'
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

removeallmethods GtPhlowTextEditorViewSpecification
removeallclassmethods GtPhlowTextEditorViewSpecification

doit
(GtPhlowViewSpecification
	subclass: 'GtPhlowViewErrorViewSpecification'
	instVarNames: #( errorMessage )
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

removeallmethods GtPhlowViewErrorViewSpecification
removeallclassmethods GtPhlowViewErrorViewSpecification

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
	instVarNames: #( index title width itemComputation backgroundComputation )
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
(GtRemotePhlowColumn
	subclass: 'GtRemotePhlowExplicitColumn'
	instVarNames: #( spawnObjectComputation type )
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

removeallmethods GtRemotePhlowExplicitColumn
removeallclassmethods GtRemotePhlowExplicitColumn

doit
(GtRemotePhlowColumn
	subclass: 'GtRemotePhlowTypedColumn'
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

removeallmethods GtRemotePhlowTypedColumn
removeallclassmethods GtRemotePhlowTypedColumn

doit
(GtRemotePhlowTypedColumn
	subclass: 'GtRemotePhlowIconNameColumn'
	instVarNames: #( iconNameComputation )
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

removeallmethods GtRemotePhlowIconNameColumn
removeallclassmethods GtRemotePhlowIconNameColumn

doit
(GtRemotePhlowIconNameColumn
	subclass: 'GtRemotePhlowThemeIconNameColumn'
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

removeallmethods GtRemotePhlowThemeIconNameColumn
removeallclassmethods GtRemotePhlowThemeIconNameColumn

doit
(GtRemotePhlowTypedColumn
	subclass: 'GtRemotePhlowNumberColumn'
	instVarNames: #( formatComputation )
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

removeallmethods GtRemotePhlowNumberColumn
removeallclassmethods GtRemotePhlowNumberColumn

doit
(GtRemotePhlowTypedColumn
	subclass: 'GtRemotePhlowTextColumn'
	instVarNames: #( formatComputation )
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

removeallmethods GtRemotePhlowTextColumn
removeallclassmethods GtRemotePhlowTextColumn

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
	subclass: 'GtRemotePhlowDataNode'
	instVarNames: #( targetObject nodeId nodeValue )
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

removeallmethods GtRemotePhlowDataNode
removeallclassmethods GtRemotePhlowDataNode

doit
(GtRemotePhlowDataNode
	subclass: 'GtRemotePhlowTreeNode'
	instVarNames: #( childNodes parentNode )
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

removeallmethods GtRemotePhlowTreeNode
removeallclassmethods GtRemotePhlowTreeNode

doit
(GtRemotePhlowTreeNode
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
	subclass: 'GtRemotePhlowDeclarativeForwardViewDataSource'
	instVarNames: #( cachedViewSpecification )
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

removeallmethods GtRemotePhlowDeclarativeForwardViewDataSource
removeallclassmethods GtRemotePhlowDeclarativeForwardViewDataSource

doit
(GtRemotePhlowDeclarativeViewDataSource
	subclass: 'GtRemotePhlowDeclarativeViewListingDataSource'
	instVarNames: #( itemsIterator cachedNodes cachedValueBuilder )
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
(GtRemotePhlowDeclarativeViewListingDataSource
	subclass: 'GtRemotePhlowDeclarativeViewTreeDataSource'
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

removeallmethods GtRemotePhlowDeclarativeViewTreeDataSource
removeallclassmethods GtRemotePhlowDeclarativeViewTreeDataSource

doit
(GtRemotePhlowDeclarativeViewTreeDataSource
	subclass: 'GtRemotePhlowDeclarativeViewColumnedTreeDataSource'
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

removeallmethods GtRemotePhlowDeclarativeViewColumnedTreeDataSource
removeallclassmethods GtRemotePhlowDeclarativeViewColumnedTreeDataSource

doit
(Object
	subclass: 'GtRemotePhlowNodeValue'
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

removeallmethods GtRemotePhlowNodeValue
removeallclassmethods GtRemotePhlowNodeValue

doit
(GtRemotePhlowNodeValue
	subclass: 'GtRemotePhlowItemValue'
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

removeallmethods GtRemotePhlowItemValue
removeallclassmethods GtRemotePhlowItemValue

doit
(GtRemotePhlowItemValue
	subclass: 'GtRemotePhlowItemErrorValue'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-DeclarativeViews';
		comment: 'I am a node modeling an error that happened during the computation';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowItemErrorValue
removeallclassmethods GtRemotePhlowItemErrorValue

doit
(GtRemotePhlowItemValue
	subclass: 'GtRemotePhlowItemTextualValue'
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

removeallmethods GtRemotePhlowItemTextualValue
removeallclassmethods GtRemotePhlowItemTextualValue

doit
(GtRemotePhlowNodeValue
	subclass: 'GtRemotePhlowRowValue'
	instVarNames: #( columnValues )
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

removeallmethods GtRemotePhlowRowValue
removeallclassmethods GtRemotePhlowRowValue

doit
(Object
	subclass: 'GtRemotePhlowNodeValueBuilder'
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

removeallmethods GtRemotePhlowNodeValueBuilder
removeallclassmethods GtRemotePhlowNodeValueBuilder

doit
(GtRemotePhlowNodeValueBuilder
	subclass: 'GtRemotePhlowItemBuilder'
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

removeallmethods GtRemotePhlowItemBuilder
removeallclassmethods GtRemotePhlowItemBuilder

doit
(GtRemotePhlowNodeValueBuilder
	subclass: 'GtRemotePhlowRowBuilder'
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

removeallmethods GtRemotePhlowRowBuilder
removeallclassmethods GtRemotePhlowRowBuilder

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
	instVarNames: #( viewSelector objectComputation transformation )
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
	subclass: 'GtRemotePhlowBasicColumnedView'
	instVarNames: #( columns )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		comment: 'I provide functionality for working with columns.';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowBasicColumnedView
removeallclassmethods GtRemotePhlowBasicColumnedView

doit
(GtRemotePhlowBasicColumnedView
	subclass: 'GtRemotePhlowColumnedListView'
	instVarNames: #( horizontalScrollingEnabled )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		comment: 'I support a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowColumnedListView
removeallclassmethods GtRemotePhlowColumnedListView

doit
(GtRemotePhlowBasicColumnedView
	subclass: 'GtRemotePhlowColumnedTreeView'
	instVarNames: #( itemTextBlock childrenBuilder )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-PhlowViews';
		comment: 'I support a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedTreeView}}.

I subclass from {{gtClass:GtRemotePhlowBasicColumnedView}} to reuse the functionality for working with columns and duplicate the API for working with trees from {{gtClass:GtRemotePhlowTreeView}}. This happens in order to also work in GemStone where traits are not available.  Views in the Phlow version targeting the standard GT image  (subclassing {{gtClass:GtPhlowViewDecorator}}) use traits so share a common API. Since traits are not available in GemStone we rely on inheritance. We share the columns API through inheritance instead of the tree api, as the tree API is simpler and does not result in that much duplication.';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowColumnedTreeView
removeallclassmethods GtRemotePhlowColumnedTreeView

doit
(GtRemotePhlowListingView
	subclass: 'GtRemotePhlowListView'
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

removeallmethods GtRemotePhlowListView
removeallclassmethods GtRemotePhlowListView

doit
(GtRemotePhlowListingView
	subclass: 'GtRemotePhlowTreeView'
	instVarNames: #( itemTextBlock childrenBuilder )
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

removeallmethods GtRemotePhlowTreeView
removeallclassmethods GtRemotePhlowTreeView

doit
(GtRemotePhlowView
	subclass: 'GtRemotePhlowTextEditorView'
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

removeallmethods GtRemotePhlowTextEditorView
removeallclassmethods GtRemotePhlowTextEditorView

doit
(GtRemotePhlowView
	subclass: 'GtRemotePhlowViewErrorView'
	instVarNames: #( errorMessage )
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

removeallmethods GtRemotePhlowViewErrorView
removeallclassmethods GtRemotePhlowViewErrorView

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
		comment: '{{gtClass:GtRemotePhlowViewedObject}} is responsible for serving serialized views to the client inspector.';
		immediateInvariant.
true.
%

removeallmethods GtRemotePhlowViewedObject
removeallclassmethods GtRemotePhlowViewedObject

doit
(Object
	subclass: 'GtRmGeoGpsGroup'
	instVarNames: #( items cache )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoGpsGroup
removeallclassmethods GtRmGeoGpsGroup

doit
(GtRmGeoGpsGroup
	subclass: 'GtRmGeoGpsRecordsGroup'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoGpsRecordsGroup
removeallclassmethods GtRmGeoGpsRecordsGroup

doit
(GtRmGeoGpsGroup
	subclass: 'GtRmGeoGpsTrajectoriesGroup'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoGpsTrajectoriesGroup
removeallclassmethods GtRmGeoGpsTrajectoriesGroup

doit
(GtRmGeoGpsGroup
	subclass: 'GtRmGeoGpsUsersGroup'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoGpsUsersGroup
removeallclassmethods GtRmGeoGpsUsersGroup

doit
(Object
	subclass: 'GtRmGeoGpsRecord'
	instVarNames: #( timestamp latitude longitude )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoGpsRecord
removeallclassmethods GtRmGeoGpsRecord

doit
(Object
	subclass: 'GtRmGeoGpsTrajectory'
	instVarNames: #( records targetFolderName )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoGpsTrajectory
removeallclassmethods GtRmGeoGpsTrajectory

doit
(Object
	subclass: 'GtRmGeolife'
	instVarNames: #( users )
	classVars: #( DEFAULT )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeolife
removeallclassmethods GtRmGeolife

doit
(Object
	subclass: 'GtRmGeolifeBaseImporter'
	instVarNames: #( currentDirectory usersCount )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeolifeBaseImporter
removeallclassmethods GtRmGeolifeBaseImporter

doit
(GtRmGeolifeBaseImporter
	subclass: 'GtRmGeolifeLocalImporter'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeolifeLocalImporter
removeallclassmethods GtRmGeolifeLocalImporter

doit
(Object
	subclass: 'GtRmGeoUser'
	instVarNames: #( trajectories id )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: Globals
	options: #( #logCreation )
)
		category: 'GToolkit-RemotePhlow-GeolifeDemo';
		immediateInvariant.
true.
%

removeallmethods GtRmGeoUser
removeallclassmethods GtRmGeoUser

! Class implementation for 'GtPhlowColor'

!		Class methods for 'GtPhlowColor'

category: 'instance creation'
classmethod: GtPhlowColor
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		named: (aDictionary at: #name ifAbsent: [ nil ]);
		r: (aDictionary at: #r ifAbsent: [ nil ])
			g: (aDictionary at: #g ifAbsent: [ nil ])
			b: (aDictionary at: #b ifAbsent: [ nil ])
			alpha: (aDictionary at: #a ifAbsent: [ nil ]);
		yourself
%

category: 'instance creation'
classmethod: GtPhlowColor
named: aColorName
	^ self new 
		named: aColorName
%

category: 'instance creation'
classmethod: GtPhlowColor
named: aColorName alpha: anAlpha
	^ self new 
		named: aColorName alpha: anAlpha
%

category: 'instance creation'
classmethod: GtPhlowColor
r: r g: g b: b 
	^ self new 
		r: r g: g b: b alpha: nil
%

category: 'instance creation'
classmethod: GtPhlowColor
r: r g: g b: b alpha: alpha
	^ self new 
		r: r g: g b: b alpha: alpha
%

category: 'accessing - defaults'
classmethod: GtPhlowColor
transparent
	^ self named: #transparent
%

!		Instance methods for 'GtPhlowColor'

category: 'accessing'
method: GtPhlowColor
alpha
	^ alpha ifNil: [ 0 ]
%

category: 'accessing'
method: GtPhlowColor
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		yourself.
		
	name ifNotNil: [ :aValue |
		data at: #name put: aValue ].
	red ifNotNil: [ :aValue |
		data at: #r put: aValue ].
	green ifNotNil: [ :aValue |
		data at: #g put: aValue ].
	blue ifNotNil: [ :aValue |
		data at: #b put: aValue ].
	alpha ifNotNil: [ :aValue |
		data at: #a put: aValue ].
	
	^ data
%

category: 'accessing'
method: GtPhlowColor
blue
	^ blue
%

category: 'accessing'
method: GtPhlowColor
green
	^ green
%

category: 'testing'
method: GtPhlowColor
isTransparent
	^ alpha = 0 or: [ name= #transparent ]
%

category: 'accessing'
method: GtPhlowColor
named: aColorName
	name := aColorName
%

category: 'accessing'
method: GtPhlowColor
named: aColorName alpha: anAlpha
	name := aColorName.
	alpha := anAlpha
%

category: 'printing'
method: GtPhlowColor
printOn: aStream
	super printOn: aStream.
	
	aStream parenthesize: [
		self isTransparent ifTrue: [ 
			^ aStream nextPutAll: 'transparent' ].
		name ifNotNil: [
			^ aStream nextPutAll: name ].
			
	aStream
		nextPutAll: ' r: ';
		print: red;
		nextPutAll: ' g: ';
		print: green;
		nextPutAll: ' b: ';
		print: blue;
		nextPutAll: ' alpha: ';
		print: alpha]
%

category: 'accessing'
method: GtPhlowColor
r: r g: g b: b alpha: anAlpha
	red := r.
	green := g.
	blue := b.
	alpha := anAlpha
%

category: 'accessing'
method: GtPhlowColor
red
	^ red
%

! Class implementation for 'GtPhlowDeclarativeListingType'

!		Class methods for 'GtPhlowDeclarativeListingType'

category: 'instance creation'
classmethod: GtPhlowDeclarativeListingType
forTypeLabel: aValue 
	^ self allSubclasses
		detect: [ :aSubclass |
			aSubclass typeLabel = aValue ]
		ifFound: [ :aSubclass | aSubclass new ]
		ifNone: [ self unknown ]
%

category: 'types creation'
classmethod: GtPhlowDeclarativeListingType
iconName
	^ GtPhlowThemeIconNameDeclarativeListingType new
%

category: 'types creation'
classmethod: GtPhlowDeclarativeListingType
number
	^ GtPhlowNumberDeclarativeListingType new
%

category: 'types creation'
classmethod: GtPhlowDeclarativeListingType
text
	^ GtPhlowTextDeclarativeListingType new
%

category: 'types creation'
classmethod: GtPhlowDeclarativeListingType
textLink
	^ GtPhlowTextLinkDeclarativeListingType new
%

category: 'accessing'
classmethod: GtPhlowDeclarativeListingType
typeLabel
	^ 'listing type'
%

category: 'types creation'
classmethod: GtPhlowDeclarativeListingType
unknown
	^ GtPhlowUnknownDeclarativeListingType new
%

!		Instance methods for 'GtPhlowDeclarativeListingType'

category: 'testing'
method: GtPhlowDeclarativeListingType
isIconNameListingType
	^ false
%

category: 'testing'
method: GtPhlowDeclarativeListingType
isTextLinkListingType
	^ false
%

category: 'testing'
method: GtPhlowDeclarativeListingType
isUnknown
	^ false
%

category: 'accessing'
method: GtPhlowDeclarativeListingType
typeLabel
	^ self class typeLabel
%

! Class implementation for 'GtPhlowNumberDeclarativeListingType'

!		Class methods for 'GtPhlowNumberDeclarativeListingType'

category: 'accessing'
classmethod: GtPhlowNumberDeclarativeListingType
typeLabel
	^ #number
%

! Class implementation for 'GtPhlowTextDeclarativeListingType'

!		Class methods for 'GtPhlowTextDeclarativeListingType'

category: 'accessing'
classmethod: GtPhlowTextDeclarativeListingType
typeLabel
	^ #text
%

! Class implementation for 'GtPhlowTextLinkDeclarativeListingType'

!		Class methods for 'GtPhlowTextLinkDeclarativeListingType'

category: 'accessing'
classmethod: GtPhlowTextLinkDeclarativeListingType
typeLabel
	^ #textLink
%

!		Instance methods for 'GtPhlowTextLinkDeclarativeListingType'

category: 'testing'
method: GtPhlowTextLinkDeclarativeListingType
isTextLinkListingType
	^ true
%

! Class implementation for 'GtPhlowThemeIconNameDeclarativeListingType'

!		Class methods for 'GtPhlowThemeIconNameDeclarativeListingType'

category: 'accessing'
classmethod: GtPhlowThemeIconNameDeclarativeListingType
typeLabel
	^ #icon
%

!		Instance methods for 'GtPhlowThemeIconNameDeclarativeListingType'

category: 'testing'
method: GtPhlowThemeIconNameDeclarativeListingType
isIconNameListingType
	^ false
%

! Class implementation for 'GtPhlowUnknownDeclarativeListingType'

!		Class methods for 'GtPhlowUnknownDeclarativeListingType'

category: 'accessing'
classmethod: GtPhlowUnknownDeclarativeListingType
typeLabel
	^ #unknown
%

!		Instance methods for 'GtPhlowUnknownDeclarativeListingType'

category: 'testing'
method: GtPhlowUnknownDeclarativeListingType
isUnknown
	^ true
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

! Class implementation for 'GtPhlowForwardViewSpecification'

!		Instance methods for 'GtPhlowForwardViewSpecification'

category: 'api - accessing'
method: GtPhlowForwardViewSpecification
getDeclarativeViewFor: aViewSelector
	"This provides the same API as the inspector proxy, so that view 
	specifications can define a single method for initializing the link 
	between the local and the remote instance of the specification."
	
	^ self phlowDataSource
		getDeclarativeViewFor: aViewSelector
%

category: 'accessing'
method: GtPhlowForwardViewSpecification
initializeFromInspector: anInspector
	self phlowDataSource: (anInspector 
		getDeclarativeViewFor: self methodSelector)
%

category: 'api - accessing'
method: GtPhlowForwardViewSpecification
loadViewSpecificationForForwarding
	| declarativeViewData declarativeView |
	
	declarativeViewData := self retrieveViewSpecificationForForwarding.
	declarativeView := GtPhlowViewSpecification fromDictionary: declarativeViewData.
	
	"At this point we need to configure the specification for new view
	just like the inspector does it when retrieveing views. This links the
	local instance of the specification with a proxy to the remote instance."
	declarativeView
		initializeFromInspector: self.
				
	^ declarativeView
%

category: 'api - accessing'
method: GtPhlowForwardViewSpecification
retrieveForwardTargetDataSource
	"This retrieves directly the datasource for the forwarded view."
	^ self phlowDataSource
		retrieveForwardTargetDataSource
%

category: 'api - accessing'
method: GtPhlowForwardViewSpecification
retrieveViewSpecificationForForwarding
	^ self phlowDataSource
		retrieveViewSpecificationForForwarding
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

! Class implementation for 'GtPhlowBasicColumnedViewSpecification'

!		Class methods for 'GtPhlowBasicColumnedViewSpecification'

category: 'instance creation'
classmethod: GtPhlowBasicColumnedViewSpecification
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

!		Instance methods for 'GtPhlowBasicColumnedViewSpecification'

category: 'converting'
method: GtPhlowBasicColumnedViewSpecification
asDictionaryForExport 
	^ super asDictionaryForExport 
		at: #columnSpecifications put: (self columnSpecifications
			collect: [ :aColumnSpecification |
				aColumnSpecification asDictionaryForExport ]);
		yourself
%

category: 'accessing'
method: GtPhlowBasicColumnedViewSpecification
columnSpecifications
	^ columnSpecifications
%

category: 'accessing'
method: GtPhlowBasicColumnedViewSpecification
columnSpecifications: anObject
	columnSpecifications := anObject
%

category: 'accessing'
method: GtPhlowBasicColumnedViewSpecification
columnTitles
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification title ]
%

category: 'accessing'
method: GtPhlowBasicColumnedViewSpecification
columnTypes
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification type ]
%

category: 'accessing'
method: GtPhlowBasicColumnedViewSpecification
columnWidths
	^ self columnSpecifications collect: [ :aColumnSpecification |
		aColumnSpecification cellWidth ]
%

category: 'gt - extensions'
method: GtPhlowBasicColumnedViewSpecification
gtViewColumnSpecificationFor: aView
	<gtView>
	
	self columnSpecifications ifNil:  [
		^ aView empty ].
	
	^ aView columnedList
		title: 'Column Specifications';
		items: [ self columnSpecifications ];
		column: 'Title' text: [ :aColumnSpecification | 
			aColumnSpecification title ];
		column: 'Type' text: [ :aColumnSpecification | 
			aColumnSpecification type ]
%

category: 'api - accessing'
method: GtPhlowBasicColumnedViewSpecification
retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex	
	^ self phlowDataSource 
		retriveSpawnedObjectAtRow: aRowIndex column: aColumnIndex
%

! Class implementation for 'GtPhlowColumnedListViewSpecification'

!		Class methods for 'GtPhlowColumnedListViewSpecification'

category: 'instance creation'
classmethod: GtPhlowColumnedListViewSpecification
fromJSONDictionary: aDictionary
	^ (super fromJSONDictionary: aDictionary)
		horizontalScrollingEnabled: (aDictionary 
			at: #horizontalScrollingEnabled 
			ifAbsent: [ nil ])
%

!		Instance methods for 'GtPhlowColumnedListViewSpecification'

category: 'converting'
method: GtPhlowColumnedListViewSpecification
asDictionaryForExport 
	^ super asDictionaryForExport 
		at: #horizontalScrollingEnabled put: horizontalScrollingEnabled;
		yourself
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
horizontalScrollingEnabled
	^ horizontalScrollingEnabled
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
horizontalScrollingEnabled: aBoolean
	horizontalScrollingEnabled := aBoolean
%

category: 'accessing'
method: GtPhlowColumnedListViewSpecification
isHorizontalScrollingEnabled
	^ self horizontalScrollingEnabled ifNil: [ false ]
%

! Class implementation for 'GtPhlowColumnedTreeViewSpecification'

!		Instance methods for 'GtPhlowColumnedTreeViewSpecification'

category: 'api - accessing'
method: GtPhlowColumnedTreeViewSpecification
retrieveChildrenForNodeAtPath: aNodePath
	^ self phlowDataSource 
		retrieveChildrenForNodeAtPath: aNodePath
%

category: 'api - accessing'
method: GtPhlowColumnedTreeViewSpecification
retriveSentItemAtPath: aNodePath
	^ self phlowDataSource 
		retriveSentItemAtPath:aNodePath
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

!		Instance methods for 'GtPhlowTreeViewSpecification'

category: 'api - accessing'
method: GtPhlowTreeViewSpecification
retrieveChildrenForNodeAtPath: aNodePath
	^ self phlowDataSource 
		retrieveChildrenForNodeAtPath: aNodePath
%

category: 'api - accessing'
method: GtPhlowTreeViewSpecification
retriveSentItemAtPath: aNodePath
	^ self phlowDataSource 
		retriveSentItemAtPath: aNodePath
%

! Class implementation for 'GtPhlowTextEditorViewSpecification'

!		Class methods for 'GtPhlowTextEditorViewSpecification'

category: 'instance creation'
classmethod: GtPhlowTextEditorViewSpecification
fromJSONDictionary: aDictionary

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
%

!		Instance methods for 'GtPhlowTextEditorViewSpecification'

category: 'converting'
method: GtPhlowTextEditorViewSpecification
asDictionaryForExport 

	| dictionary |

	dictionary := super asDictionaryForExport.
	self dataTransport = self class dataIncluded ifTrue: [ 
		dictionary at: #string put: string ].
	^dictionary
%

category: 'accessing'
method: GtPhlowTextEditorViewSpecification
string

	^ string "ifNil: [ 
		(string isNil and: [ dataTransport = self class dataLazy ]) ifTrue: 
			[ string := accessor data ] ]."
%

category: 'accessing'
method: GtPhlowTextEditorViewSpecification
string: anObject
	string := anObject
%

! Class implementation for 'GtPhlowViewErrorViewSpecification'

!		Class methods for 'GtPhlowViewErrorViewSpecification'

category: 'instance creation'
classmethod: GtPhlowViewErrorViewSpecification
fromJSONDictionary: aDictionary

	^ (super fromJSONDictionary: aDictionary)
		errorMessage: (aDictionary at: #errorMessage ifAbsent: [ nil ])
%

!		Instance methods for 'GtPhlowViewErrorViewSpecification'

category: 'converting'
method: GtPhlowViewErrorViewSpecification
asDictionaryForExport 
	^ super asDictionaryForExport
		at: #errorMessage put: errorMessage;
		yourself
%

category: 'accessing'
method: GtPhlowViewErrorViewSpecification
errorMessage
	^ errorMessage
%

category: 'accessing'
method: GtPhlowViewErrorViewSpecification
errorMessage: anObject
	errorMessage := anObject
%

! Class implementation for 'GtRemoteDeclarativeExamples'

!		Instance methods for 'GtRemoteDeclarativeExamples'

category: 'examples - views'
method: GtRemoteDeclarativeExamples
columnedListView
	<gtExample>
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary :=  viewProxy getViewDeclaration: #gtColumnedListFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: 'Columned list'.
	self assert: view columnTitles equals: #(Value Lowercase).
	self assert: view columnWidths equals: #(nil 100).
	self 
		assert: (view columnTypes collect: #typeLabel) 
		equals: #(text text).
	
	self assert: view dataTransport equals: GtPhlowViewSpecification dataLazy.
	self columnedListViewLazyCheck: viewProxy.
	
	^ view
%

category: 'private'
method: GtRemoteDeclarativeExamples
columnedListViewLazyCheck: viewProxy
	| declarativeView |

	declarativeView := viewProxy getDeclarativeViewFor: #gtColumnedListFor:.
	self assert: declarativeView retrieveTotalItemsCount equals: 3.
%

category: 'examples - views'
method: GtRemoteDeclarativeExamples
columnedListWithTypedColumns
	<gtExample>
	<after: #stopServer>
	| viewProxy viewDictionary viewSpecification |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy getViewDeclaration: #gtColumnedListWithTypedColumnsFor:.
	viewSpecification := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	viewSpecification initializeFromInspector: viewProxy.
	
	self assert: viewSpecification title equals: 'Columned list with typed columns'.
	self assert: viewSpecification priority equals: 24.
	
	self 
		assert: viewSpecification methodSelector 
		equals: #gtColumnedListWithTypedColumnsFor:.
	self 
		assert: (viewSpecification columnSpecifications 
			collect: [ :aColumnSpecification | aColumnSpecification typeLabel ])
		equals: #('text' 'number' 'icon').
	self 
		assert: viewSpecification columnTitles 
		equals: #('Text' 'Number' 'Icon Name').
	self 
		assert: viewSpecification columnWidths 
		equals: #(nil 100 75).
	
	self assert: viewSpecification totalItemsCount equals: 500.
	
	self 
		assert: (viewSpecification retrieveItems: 2 fromIndex: 1)
		equals: self expectedColumnedListTypedColumnsTwoItems.
	
	^ viewSpecification
%

category: 'private'
method: GtRemoteDeclarativeExamples
declarativeViewNames
	"Answer the expected array of declarative views from the remote.
	Subclasses may overwrite this if the set of views is different."

	^ #('gtLargeListFor:' 'gtStringFor:' 'gtListFor:' 'gtLargeColumnedListWithIndexFor:' 'gtColumnedListFor:' 'gtLargeColumnedListFor:' 'gtRemotePrintFor:')
%

category: 'examples - views'
method: GtRemoteDeclarativeExamples
expectedColumnedListTypedColumnsTwoItems
	^ ((Array new: 2) at: 1 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#itemText->'+1.0'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'+2'); yourself); at: 3 put: ((Dictionary new) add: (#itemText->#classIcon); yourself); yourself)); yourself)); add: (#nodeId->1); yourself); at: 2 put: ((Dictionary new) add: (#nodeValue->((Dictionary new) add: (#columnValues->((Array new: 3) at: 1 put: ((Dictionary new) add: (#itemText->'+2.0'); yourself); at: 2 put: ((Dictionary new) add: (#itemText->'+3'); yourself); at: 3 put: ((Dictionary new) add: (#itemText->#classIcon); yourself); yourself)); yourself)); add: (#nodeId->2); yourself); yourself)
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
	| viewProxy viewDictionary view |

	viewProxy := self viewedObjectProxy.
	viewDictionary := viewProxy getViewDeclaration: #gtListFor:.
	view := GtPhlowViewSpecification fromDictionary: viewDictionary.
	
	self assert: view title equals: #List.
	self assert: view priority equals: 15.
	
	self listViewLazyCheck: viewProxy.
	
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

category: 'iterating'
method: GtRemotePhlowCollectionIterator
retrieveItems: anItemsCount fromIndex: startIndex
	| computedElements endIndex |

	computedElements := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self 
		forElementsFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :anItem :anIndex |
			computedElements add: anItem ].
	
	^ computedElements asArray
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

category: 'testing'
classmethod: GtRemotePhlowColumn
isAbstract
	^ self name = #GtRemotePhlowColumn
%

!		Instance methods for 'GtRemotePhlowColumn'

category: 'converting'
method: GtRemotePhlowColumn
asGtDeclarativeColumnDataType
	^ self subclassResponsibility
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
	| cellValue itemValue |
	cellValue := self createRemotePhlowCellValue.
	
	itemValue := self itemComputation 
		cull: anObject cull: rowIndex cull: columnIndex.
		
	self 
		updateValue: cellValue 
		forComputedItem: itemValue 
		rowIndex: rowIndex 
		columnIndex: columnIndex.
	
	self hasBackgroundComputation ifTrue: [
		cellValue 
			background: (self backgroundComputation
				cull: itemValue cull: anObject cull: rowIndex cull: columnIndex) ].
	
	^ cellValue
%

category: 'computation'
method: GtRemotePhlowColumn
createRemotePhlowCellValue
	^ GtRemotePhlowItemTextualValue new
%

category: 'testing'
method: GtRemotePhlowColumn
hasBackgroundComputation
	^ backgroundComputation notNil
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
	^ false
%

category: 'accessing'
method: GtRemotePhlowColumn
item: anItemComputation
	itemComputation := anItemComputation
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
title
	^ title
%

category: 'api - scripting'
method: GtRemotePhlowColumn
title: anObject
	title := anObject
%

category: 'computation'
method: GtRemotePhlowColumn
updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex
	aCellValue 
		itemText: aComputedItem gtDisplayString.
%

category: 'accessing'
method: GtRemotePhlowColumn
width: aCellWidth
	width := aCellWidth
%

! Class implementation for 'GtRemotePhlowExplicitColumn'

!		Instance methods for 'GtRemotePhlowExplicitColumn'

category: 'converting'
method: GtRemotePhlowExplicitColumn
asGtDeclarativeColumnDataType
	^ type ifNil: [
		GtPhlowDeclarativeListingType unknown ]
%

category: 'configuration'
method: GtRemotePhlowExplicitColumn
iconName: aBlock
	self item: aBlock.
	type := GtPhlowDeclarativeListingType iconName
%

category: 'testing'
method: GtRemotePhlowExplicitColumn
isSpawningObject
	^ self asGtDeclarativeColumnDataType isTextLinkListingType
%

category: 'accessing'
method: GtRemotePhlowExplicitColumn
spawnObjectComputation
	"If nil, the cell does not spawn an object"

	^ spawnObjectComputation
%

category: 'configuration'
method: GtRemotePhlowExplicitColumn
text: aBlock
	self item: aBlock.
	type := GtPhlowDeclarativeListingType text
%

category: 'configuration'
method: GtRemotePhlowExplicitColumn
text: aBlock spawn: aSpawnObjectComputation
	"aSpawnObjectComputation should return an Object that should be spawned when clicked on:
		- a link button if the column data type is #text
		- a link icon if the column data type is #icon.

	Setting a spawnObject influences how a cell is rendered"
	
	self item: aBlock.
	spawnObjectComputation := aSpawnObjectComputation.
	type := GtPhlowDeclarativeListingType textLink
%

! Class implementation for 'GtRemotePhlowTypedColumn'

!		Class methods for 'GtRemotePhlowTypedColumn'

category: 'testing'
classmethod: GtRemotePhlowTypedColumn
isAbstract
	^ self name = #GtRemotePhlowTypedColumn
%

! Class implementation for 'GtRemotePhlowIconNameColumn'

!		Class methods for 'GtRemotePhlowIconNameColumn'

category: 'testing'
classmethod: GtRemotePhlowIconNameColumn
isAbstract
	^ self name = #GtRemotePhlowIconNameColumn
%

!		Instance methods for 'GtRemotePhlowIconNameColumn'

category: 'accessing'
method: GtRemotePhlowIconNameColumn
iconName: anIconNameComputation
	iconNameComputation := anIconNameComputation
%

category: 'accessing'
method: GtRemotePhlowIconNameColumn
iconNameComputation
	^ iconNameComputation
%

category: 'computation'
method: GtRemotePhlowIconNameColumn
updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex
	| itemText |
	
	itemText := self iconNameComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :anIconNameComputation |
			anIconNameComputation
				cull: aComputedItem
				cull: rowIndex 
				cull: columnIndex ].
				
	aCellValue 
		itemText: itemText gtDisplayString.
%

! Class implementation for 'GtRemotePhlowThemeIconNameColumn'

!		Instance methods for 'GtRemotePhlowThemeIconNameColumn'

category: 'accessing'
method: GtRemotePhlowThemeIconNameColumn
asGtDeclarativeColumnDataType
	^ GtPhlowDeclarativeListingType iconName
%

! Class implementation for 'GtRemotePhlowNumberColumn'

!		Instance methods for 'GtRemotePhlowNumberColumn'

category: 'converting'
method: GtRemotePhlowNumberColumn
asGtDeclarativeColumnDataType
	^ GtPhlowDeclarativeListingType number
%

category: 'configuration'
method: GtRemotePhlowNumberColumn
format: aBlock
	formatComputation := aBlock
%

category: 'accessing'
method: GtRemotePhlowNumberColumn
formatComputation
	^ formatComputation
%

category: 'computation'
method: GtRemotePhlowNumberColumn
updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex
	| itemText |
	
	itemText := self formatComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :aFomattingComputation |
			aFomattingComputation
				cull: aComputedItem
				cull: rowIndex 
				cull: columnIndex ].
				
	aCellValue 
		itemText: itemText gtDisplayString.
%

! Class implementation for 'GtRemotePhlowTextColumn'

!		Instance methods for 'GtRemotePhlowTextColumn'

category: 'converting'
method: GtRemotePhlowTextColumn
asGtDeclarativeColumnDataType
	^ GtPhlowDeclarativeListingType text
%

category: 'configuration'
method: GtRemotePhlowTextColumn
format: aBlock
	formatComputation := aBlock
%

category: 'accessing'
method: GtRemotePhlowTextColumn
formatComputation
	^ formatComputation
%

category: 'computation'
method: GtRemotePhlowTextColumn
updateValue: aCellValue forComputedItem: aComputedItem rowIndex: rowIndex columnIndex: columnIndex
	| itemText |
	
	itemText := self formatComputation 
		ifNil: [ aComputedItem ]
		ifNotNil: [ :aFomattingComputation |
			aFomattingComputation
				cull: aComputedItem
				cull: rowIndex 
				cull: columnIndex ].
	
	aCellValue 
		itemText: itemText gtDisplayString.
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
		type: (self instantiateTypeFrom: (aDictionary at: #type));
		spawnsObjects: (aDictionary at: #spawnsObjects);
		properties: (aDictionary at: #properties) asOrderedCollection.
		
	^column
%

category: 'instance creation'
classmethod: GtRemotePhlowColumnSpecification
instantiateTypeFrom: aValue
	 ^ GtPhlowDeclarativeListingType forTypeLabel: aValue
%

!		Instance methods for 'GtRemotePhlowColumnSpecification'

category: 'conversion'
method: GtRemotePhlowColumnSpecification
asDictionaryForExport 
	| dictionary |

	dictionary := Dictionary new 
		at: #title put: title;
		at: #cellWidth put: cellWidth;
		at: #type put: type typeLabel;
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
isTextSpawn
	^ self spawnsObjects and: [
		self type isText ]
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
printOn: aStream
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream << self title.
		self type ifNotNil: [
			aStream 
				<< ', ';
				<< self type typeLabel ]]
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

category: 'accessing'
method: GtRemotePhlowColumnSpecification
typeLabel
	^ self type typeLabel
%

! Class implementation for 'GtRemotePhlowDataNode'

!		Class methods for 'GtRemotePhlowDataNode'

category: 'instance creation'
classmethod: GtRemotePhlowDataNode
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		nodeId: (aDictionary at: #nodeId ifAbsent: [ nil ]);
		nodeValue: (aDictionary 
			at: #nodeValue 
			ifPresent: [ :aNodeValueDictionary |
				self valueType fromJSONDictionary: aNodeValueDictionary ]
			ifAbsent: [ nil ]);
		yourself
%

category: 'accessing'
classmethod: GtRemotePhlowDataNode
valueType
	^ GtRemotePhlowItemValue
%

!		Instance methods for 'GtRemotePhlowDataNode'

category: 'accessing'
method: GtRemotePhlowDataNode
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	
	data := Dictionary new 
		at: #nodeId put: self nodeId;
		at: #nodeValue put: self nodeValue asDictionaryForExport;
		yourself.
	
	^ data
%

category: 'accessing'
method: GtRemotePhlowDataNode
nodeId
	^ nodeId
%

category: 'accessing'
method: GtRemotePhlowDataNode
nodeId: anObject
	nodeId := anObject
%

category: 'accessing'
method: GtRemotePhlowDataNode
nodeValue
	^ nodeValue
%

category: 'accessing'
method: GtRemotePhlowDataNode
nodeValue: anObject
	nodeValue := anObject
%

category: 'accessing'
method: GtRemotePhlowDataNode
targetObject
	^ targetObject
%

category: 'accessing'
method: GtRemotePhlowDataNode
targetObject: anObject
	targetObject := anObject
%

! Class implementation for 'GtRemotePhlowTreeNode'

!		Instance methods for 'GtRemotePhlowTreeNode'

category: 'converting'
method: GtRemotePhlowTreeNode
asDictionaryForExport
	| exportDictionary  |
	exportDictionary := super asDictionaryForExport.

	self childNodes ifNotNil: [ :aCollection |
		exportDictionary 
			at: #childNodes 
			put: (aCollection
				collect: [ :aChildNode | aChildNode asDictionaryForExport ])].
	
	^ exportDictionary
%

category: 'accessing'
method: GtRemotePhlowTreeNode
childNodes
	^ childNodes
%

category: 'accessing'
method: GtRemotePhlowTreeNode
childNodes: aCollectionOfNodes
	aCollectionOfNodes do: [ :aChildNode | 
		aChildNode parentNode ifNotNil: [ 
			Error signal: 'Parent must be nil.' ].
		aChildNode parentNode: self ].
	
	childNodes := aCollectionOfNodes.
%

category: 'gt - extensions'
method: GtRemotePhlowTreeNode
gtViewChildrenFor: aView 
	<gtView>
	childNodes ifNil: [ ^ aView empty ].
	
	^ aView columnedTree
		title: 'Child Nodes';
		items: [ childNodes ];
		children: [ :aNode | 
			aNode childNodes ifNil: [ #() ] ];
		column: 'Path' text: [ :aNode | 
			aNode nodePathDescription  ] width: 100;
		column: 'Id' text: [ :aNode | aNode nodeId ] width: 100;
		column: 'Value' text: [ :aNode | aNode nodeValue ]
%

category: 'accessing'
method: GtRemotePhlowTreeNode
nodePath
	^ Array streamContents: [ :aStream | 
		  self withParentNodesDo: [ :eachNode | aStream nextPut: eachNode nodeId ] ] 
%

category: 'accessing'
method: GtRemotePhlowTreeNode
nodePathDescription
	^ String streamContents: [ :aStream |
		self printNodePathOn: aStream ]
%

category: 'accessing'
method: GtRemotePhlowTreeNode
parentNode
	^ parentNode
%

category: 'accessing'
method: GtRemotePhlowTreeNode
parentNode: anObject
	parentNode := anObject
%

category: 'printing'
method: GtRemotePhlowTreeNode
printNodePathOn: aStream
	self nodePath 
		do: [:elem | aStream nextPutAll: elem asString]
		separatedBy: [aStream nextPutAll: '/'] 
%

category: 'printing'
method: GtRemotePhlowTreeNode
printOn: aStream
	super printOn: aStream.
	
	aStream parenthesize: [ 
		self nodePath 
			do: [:elem | aStream nextPutAll: elem asString]
			separatedBy: [aStream nextPutAll: '/'] ]
%

category: 'traversing'
method: GtRemotePhlowTreeNode
withParentNodesDo: aBlock

	self parentNode ifNotNil: [ :aParentNode | 
		aParentNode withParentNodesDo: aBlock ].

	aBlock cull: self
%

! Class implementation for 'GtRemotePhlowColumnedTreeNode'

!		Class methods for 'GtRemotePhlowColumnedTreeNode'

category: 'accessing'
classmethod: GtRemotePhlowColumnedTreeNode
valueType
	^ GtRemotePhlowRowValue
%

!		Instance methods for 'GtRemotePhlowColumnedTreeNode'

category: 'accessing'
method: GtRemotePhlowColumnedTreeNode
columnValueAt: anIndex
	^ self nodeValue columnValueAt: anIndex
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
gtColumnedListWithHorizontalScrollingFor: aView
	<gtView>

	^aView columnedList
		title: 'Columned list with scrolling' ;
		priority: 23;
		items: [ 1 to: 500 ];
		withHorizontalScrolling;
		column: 'Value' text: [ :anInteger | anInteger ] width: 250;
		column: 'Value + 1' text: [ :anInteger | anInteger + 1 ] width: 250;
		column: 'Value + 2' text: [ :anInteger | anInteger + 2 ] width: 250;
		column: 'Value + 3' text: [ :anInteger | anInteger + 3 ] width: 250;
		column: 'Value + 4' text: [ :anInteger | anInteger + 4 ] width: 250.
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtColumnedListWithTypedColumnsFor: aView
	<gtView>

	^aView columnedList
		title: 'Columned list with typed columns';
		priority: 24;
		items: [ 1 to: 500 ];
		column: 'Text' textDo: [ :aColumn | 
			aColumn 
				item: [ :aNumber | aNumber asFloat ];
				format: [ :aFloat | 
					'+',aFloat asString ] ];
		column: 'Number' numberDo: [ :aColumn | 
			aColumn
				item: [ :aNumber | aNumber + 1 ];
				format: [ :aNumber | '+',aNumber asString ];
				width: 100 ];
		column: 'Icon Name' iconNameDo: [ :aColumn | 
			aColumn 
				item: [ :aNumber | aNumber asFloat ];
				iconName: [ :aFloat | 
					aFloat gtSystemIconName ];
				width: 75 ]
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
		column: 'x * x' text: [ :aNumber | aNumber * aNumber ];
		send: [ :x | x + 1000 ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtColumnedWithObjectsFor: aView
	<gtView>

	^aView columnedList
		title: 'With Objects';
		priority: 55;
		items: [ {
			'New Instance' -> self class new initialize .
			'Class Object' -> self class.
			'Dictionary With Object Keys' -> {
				Object new -> 'one'.
				Object new -> 'two'} asDictionary.
			'Dictionary With Primitive Data' -> {
				1 -> 10.
				2 -> 20 }.
			'Array With Objects' -> (Array 
				with: Object new 
				with: Object new).
			'Array With Numbers' -> (Array with: 1 with: 2) } ];
		column: 'Key' text: [ :assoc | assoc key ];
		column: 'Object' text: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtForwardListFor: aView
	<gtView>

	^aView forward
		title: 'Forward List';
		priority: 45;
		object: [ self ];
		view: #gtLargeListFor:;
		send: [ :x | x * 10 ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtForwardListTwiceFor: aView
	<gtView>

	^aView forward
		title: 'Forward List Twice';
		priority: 46;
		object: [ self ];
		view: #gtForwardListFor:;
		send: [ :x | x + 1 ]
%

category: 'inspecting'
method: GtRemotePhlowDeclarativeTestInspectable
gtForwardListWithSendFor: aView
	<gtView>

	^aView forward
		title: 'Forward List Send';
		priority: 46;
		object: [ self ];
		view: #gtLargeListFor:;
		send: [ :x | x * 10 + 2 ]
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
							GtPhlowColor named: #green alpha: 0.3 ]
						ifFalse: [ v < 0
							ifTrue: [ 
								GtPhlowColor named: #red alpha: 0.3 ]
							ifFalse: [ 
								GtPhlowColor named: #gray alpha: 0.3] ] ] ]
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
gtListWithSendFor: aView
	<gtView>

	^aView list
		title: 'List with send';
		priority: 15.1;
		items: [ collectionOfObjects ];
		itemText: [ :item | item ];
		send: [ :item | {item. item. item }]
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
	self assert: view class equals: GtRemotePhlowTreeView.
	^ view
%

category: 'examples'
method: GtRemotePhlowDeclarativeTreeExamples
expectedFormattedItems
	^ (Array new: 4)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #itemText -> '1';
									yourself);
					add: #nodeId -> 1;
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #itemText -> '2';
									yourself);
					add: #nodeId -> 2;
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #itemText -> '3';
									yourself);
					add: #nodeId -> 3;
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #itemText -> '4';
									yourself);
					add: #nodeId -> 4;
					yourself);
		yourself
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

! Class implementation for 'GtRemotePhlowDeclarativeForwardViewDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeForwardViewDataSource'

category: 'api'
method: GtRemotePhlowDeclarativeForwardViewDataSource
getDeclarativeViewFor: aViewSelector
	"This mimics the API provided by the inspecotr proxy to initialize views.
	In this case foe forwarded views, we allways return the datasource for 
	the target views, as this is the only view the client will request.
	
	We do not check right now if the selector matches, as in some
	cases the method selector is not set correctly in the specification."

	^ cachedViewSpecification
%

category: 'api'
method: GtRemotePhlowDeclarativeForwardViewDataSource
retrieveForwardTargetDataSource
	^ cachedViewSpecification phlowDataSource
%

category: 'api'
method: GtRemotePhlowDeclarativeForwardViewDataSource
retrieveViewSpecificationForForwarding
	| computedPhlowView |
	computedPhlowView := self phlowView computeForwardedView.
	self phlowView hasTransformation ifTrue: [ 
		computedPhlowView 
			copyTransformationFrom: self phlowView transformation ].
			
	cachedViewSpecification := computedPhlowView asGtDeclarativeView.
	cachedViewSpecification methodSelector: computedPhlowView definingSelector.
	
	^ cachedViewSpecification asDictionaryForExport
%

! Class implementation for 'GtRemotePhlowDeclarativeViewListingDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewListingDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
buildMainNodeForObject: anObject atIndex: anIndex 
	^ self buildNodeForObject: anObject atIndex: anIndex 
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
buildNodeForObject: anObject atIndex: anIndex 
	^ self instantiateNode
		targetObject: anObject;
		nodeId: anIndex;
		nodeValue: (self 
			computeNodeValueForObject: anObject 
			atIndex: anIndex)
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
cachedNodes
	^ cachedNodes ifNil: [
		cachedNodes := OrderedCollection new ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
computeNodeValueForObject: anObject atIndex: anIndex 
	^ self valueBuilder 
		computeNodeValueForObject: anObject 
		atIndex: anIndex 
%

category: 'api'
method: GtRemotePhlowDeclarativeViewListingDataSource
flushItemsIterator
	"Flush the items iterator to force the displayed values to be regenerated"

	itemsIterator := nil.
	cachedNodes := nil.
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
formatItem: anObject atIndex: anIndex
	self subclassResponsibility
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
forNodesFrom: aStartIndex to: anEndIndex withIndexDo: aBlock
	| startIndex stopIndex |
	
	"The interval of nodes that need to be computed and send back to the client"
	startIndex := 1 max: aStartIndex.
	stopIndex  := self itemsIterator totalItemsCount min: anEndIndex.
	
	"Increase the size of the cache to ensure that it can hold all nodes, if required."
	self cachedNodes size + 1 to: stopIndex do: [ :index |
		self cachedNodes add: nil ].
	
	"Iterate over the given interval, 
	and create the nodes that do not have already a cached value."
	self itemsIterator 
		forElementsFrom: startIndex 
		to: stopIndex 
		withIndexDo: [ :anObject :anIndex | 
			(self cachedNodes at: anIndex) ifNil: [
					| newValueNode |
					newValueNode := self 
						buildMainNodeForObject: anObject atIndex: anIndex.
					self cachedNodes at: anIndex put: newValueNode ].
			aBlock cull: (self cachedNodes at: anIndex) cull: anIndex ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
gtViewCachedNodesFor: aView 
	<gtView>
	cachedNodes ifNil: [ ^ aView empty ].
	
	^ aView columnedTree
		title: 'Cached Nodes';
		items: [ cachedNodes ];
		children: [ :aNode | 
			aNode childNodes ifNil: [ #() ] ];
		column: 'Id' text: [ :aNode | aNode nodeId ];
		column: 'Value' text: [ :aNode | aNode nodeValue ]
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
instantiateNode
	^ self subclassResponsibility
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
instantiateValueBuilder
	^ GtRemotePhlowItemBuilder new
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
itemsIterator
	^ itemsIterator ifNil: [ 
		itemsIterator := self phlowView 
			itemsProviderComputation value asGPhlowItemsIterator ]
%

category: 'api - data retrival'
method: GtRemotePhlowDeclarativeViewListingDataSource
retrieveItems: anItemsCount fromIndex: startIndex
	| computedNodes endIndex |

	computedNodes := OrderedCollection new: anItemsCount.
	endIndex := startIndex + anItemsCount - 1.
	
	self 
		forNodesFrom: startIndex 
		to: endIndex 
		withIndexDo: [ :aNode |
			computedNodes add: aNode ].
	
	^ computedNodes asArray collect: [ :aNodeValue |
		aNodeValue asDictionaryForExport ]
%

category: 'api - data retrival'
method: GtRemotePhlowDeclarativeViewListingDataSource
retrieveTotalItemsCount
	^ self itemsIterator totalItemsCount
%

category: 'api - data retrival'
method: GtRemotePhlowDeclarativeViewListingDataSource
retriveSentItemAt: aSelectionIndex
	"Answer the raw value at the supplied index"
	
	self  
		forNodesFrom: aSelectionIndex 
		to: aSelectionIndex 
		withIndexDo: [ :aNode :anItemIndex |
			^ self phlowView transformation 
				transformedValueFrom: aNode targetObject
				selection: aSelectionIndex ].
	^ nil
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListingDataSource
valueBuilder
	^ cachedValueBuilder ifNil: [
		cachedValueBuilder := self instantiateValueBuilder
			phlowView:  self phlowView]
%

! Class implementation for 'GtRemotePhlowDeclarativeViewColumnedListDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewColumnedListDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewColumnedListDataSource
instantiateNode
	^ GtRemotePhlowColumnedTreeNode new
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewColumnedListDataSource
instantiateValueBuilder
	^ GtRemotePhlowRowBuilder new
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
				ifTrue: [ aColumn spawnObjectComputation 
					cull: aRowObject cull: anItemIndex  ]
				ifFalse: [ aRowObject ].
			^ aSpawnedObject ].
	^ nil
%

! Class implementation for 'GtRemotePhlowDeclarativeViewListDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewListDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewListDataSource
instantiateNode
	^ GtRemotePhlowDataNode new
%

! Class implementation for 'GtRemotePhlowDeclarativeViewTreeDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewTreeDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewTreeDataSource
buildChildNodesFor: aNode 
	| childNodes |
	
	childNodes := OrderedCollection new.
	(self phlowView 
		childrenBuilder cull: aNode targetObject) 
			withIndexDo: [ :anObject :anIndex | 
				childNodes add: (self 
					buildNodeForObject: anObject 
					atIndex: anIndex) ].
		
	^ childNodes asArray
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewTreeDataSource
buildChildrenForNode: aNode atPath: aNodePath
	self ensureChildrenForNode: aNode.
	aNodePath isEmpty ifTrue: [ 
		^ aNode childNodes ].
		
	^ self 
		buildChildrenForNode: (aNode childNodes at: aNodePath first)
		atPath: aNodePath allButFirst
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewTreeDataSource
ensureChildrenForNode: aNode 
	aNode childNodes ifNotNil: [ ^ self ].
	
	aNode childNodes: (self buildChildNodesFor: aNode)
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewTreeDataSource
instantiateNode
	^ GtRemotePhlowTreeNode new
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewTreeDataSource
locateNode: aNode atPath: aNodePath
	aNodePath isEmpty ifTrue: [ 
		^ aNode ].
		
	^ self 
		locateNode: (aNode childNodes at: aNodePath first)
		atPath: aNodePath allButFirst
%

category: 'api - data retrival'
method: GtRemotePhlowDeclarativeViewTreeDataSource
retrieveChildrenForNodeAtPath: aNodePath
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode |
			^ (self 
				buildChildrenForNode: aNode 
				atPath: aNodePath allButFirst)
					collect: [ :aNodeValue |
						aNodeValue asDictionaryForExport ] ].
	^ #()
%

category: 'api - data retrival'
method: GtRemotePhlowDeclarativeViewTreeDataSource
retriveSentItemAtPath: aNodePath
	self 
		forNodesFrom: aNodePath first 
		to: aNodePath first 
		withIndexDo: [ :aNode :aSelectionIndex |
			| targetNode targetObject |
			targetNode := self 
				locateNode: aNode 
				atPath: aNodePath allButFirst.
			targetObject := targetNode targetObject.
			^ self phlowView transformation 
				transformedValueFrom: targetObject
				selection: aSelectionIndex ].
	^ nil
%

! Class implementation for 'GtRemotePhlowDeclarativeViewColumnedTreeDataSource'

!		Instance methods for 'GtRemotePhlowDeclarativeViewColumnedTreeDataSource'

category: 'accessing'
method: GtRemotePhlowDeclarativeViewColumnedTreeDataSource
instantiateNode
	^ GtRemotePhlowColumnedTreeNode new
%

category: 'accessing'
method: GtRemotePhlowDeclarativeViewColumnedTreeDataSource
instantiateValueBuilder
	^ GtRemotePhlowRowBuilder new
%

! Class implementation for 'GtRemotePhlowItemValue'

!		Class methods for 'GtRemotePhlowItemValue'

category: 'instance creation'
classmethod: GtRemotePhlowItemValue
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary."
	| valueClass |

	valueClass := self valueTypeFrom: aDictionary.
		
	^ valueClass new
		initializeFromJSONDictionary: aDictionary
%

category: 'instance creation'
classmethod: GtRemotePhlowItemValue
valueTypeFrom: aDictionary 
	^ (aDictionary 
		at: #valueTypeName 
		ifPresent: [ :aTypeName |
			| detectedType |
			"There are only two types now so we can do a manual check, 
			as it will be faster; this is called for every value in a table.
			As we add more types we can extend this."
			detectedType := GtRemotePhlowItemValue.
			aTypeName = GtRemotePhlowItemTextualValue valueTypeName
				ifTrue: [ detectedType := GtRemotePhlowItemTextualValue ].
			aTypeName = GtRemotePhlowItemErrorValue valueTypeName
				ifTrue: [ detectedType := GtRemotePhlowItemErrorValue ].
			detectedType ]
		ifAbsent: [ GtRemotePhlowItemValue ])
%

category: 'accessing'
classmethod: GtRemotePhlowItemValue
valueTypeName
	^ 'item'
%

!		Instance methods for 'GtRemotePhlowItemValue'

category: 'converting'
method: GtRemotePhlowItemValue
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data | 
	
	data := Dictionary new 
		at: #itemText put: self itemText;
		at: #valueTypeName put: self class valueTypeName;
		yourself.
		
	"We check the attribute here instead of using the accessor,
	as subclasses can provide default value in case the background is nil"
	background ifNotNil: [ :aBackground |
		data at: #background put: aBackground asDictionaryForExport  ].
	
	^ data
%

category: 'accessing'
method: GtRemotePhlowItemValue
background
	^ background
%

category: 'accessing'
method: GtRemotePhlowItemValue
background: anObject
	background := anObject
%

category: 'initialization'
method: GtRemotePhlowItemValue
initializeFromJSONDictionary: aDictionary
	self itemText: (aDictionary at: #itemText).
	
	aDictionary 
		at: #background 
		ifPresent: [ :aBackgroundValue |
			self background: (GtPhlowColor fromJSONDictionary: aBackgroundValue) ]
%

category: 'testing'
method: GtRemotePhlowItemValue
isErrorItemValue
	^ false
%

category: 'accessing'
method: GtRemotePhlowItemValue
itemText
	^ itemText
%

category: 'accessing'
method: GtRemotePhlowItemValue
itemText: anObject
	itemText := anObject
%

category: 'printing'
method: GtRemotePhlowItemValue
printOn: aStream 
	super printOn: aStream .
	
	aStream parenthesize: [
		aStream << self itemText.
		self background ifNotNil: [ :aBackground |
			aStream 
				<< ', background: ';
				print: aBackground ] ]
%

! Class implementation for 'GtRemotePhlowItemErrorValue'

!		Class methods for 'GtRemotePhlowItemErrorValue'

category: 'accessing'
classmethod: GtRemotePhlowItemErrorValue
valueTypeName
	^ 'errorValue'
%

!		Instance methods for 'GtRemotePhlowItemErrorValue'

category: 'accessing'
method: GtRemotePhlowItemErrorValue
background
	^ super background ifNil: [
		"#errorBackgroundColor"
		GtPhlowColor  
			r: 1.0 
			g: 0.4701857282502444 
			b: 0.458455522971652   ]
%

category: 'testing'
method: GtRemotePhlowItemErrorValue
isErrorItemValue
	^ true
%

! Class implementation for 'GtRemotePhlowItemTextualValue'

!		Class methods for 'GtRemotePhlowItemTextualValue'

category: 'accessing'
classmethod: GtRemotePhlowItemTextualValue
valueTypeName
	^ 'textualValue'
%

! Class implementation for 'GtRemotePhlowRowValue'

!		Class methods for 'GtRemotePhlowRowValue'

category: 'instance creation'
classmethod: GtRemotePhlowRowValue
fromJSONDictionary: aDictionary
	"Answer an instance of the receiver from the supplied dictionary."

	^self new 
		columnValues: (aDictionary 
			at: #columnValues 
			ifPresent: [ :aCollection |
				aCollection collect: [ :anItemValueDictionary |
					GtRemotePhlowItemValue fromJSONDictionary: anItemValueDictionary ] ]
			ifAbsent: [ nil ]);
		yourself
%

!		Instance methods for 'GtRemotePhlowRowValue'

category: 'converting'
method: GtRemotePhlowRowValue
asDictionaryForExport
	"Answer the receiver as a dictionary ready for JSON serialisation"

	| data| 
	data := Dictionary new 
		at: #columnValues put: (self columnValues 
			collect: [ :aColumnValue | aColumnValue asDictionaryForExport ]);
		yourself.
	
	^ data
%

category: 'accessing'
method: GtRemotePhlowRowValue
columnValueAt: anIndex
	^ self columnValues at: anIndex
%

category: 'accessing'
method: GtRemotePhlowRowValue
columnValues
	^ columnValues
%

category: 'accessing'
method: GtRemotePhlowRowValue
columnValues: anObject
	columnValues := anObject
%

! Class implementation for 'GtRemotePhlowNodeValueBuilder'

!		Instance methods for 'GtRemotePhlowNodeValueBuilder'

category: 'accessing'
method: GtRemotePhlowNodeValueBuilder
computeNodeValueForObject: anObject atIndex: anIndex 
	^ self subclassResponsibility
%

category: 'accessing'
method: GtRemotePhlowNodeValueBuilder
phlowView
	^ phlowView
%

category: 'accessing'
method: GtRemotePhlowNodeValueBuilder
phlowView: anObject
	phlowView := anObject
%

category: 'building'
method: GtRemotePhlowNodeValueBuilder
withErrorHandlingCompute: aBlock
	^ aBlock
		on: Error 
		do: [ :anError |
			GtRemotePhlowItemErrorValue new
				itemText: anError description ] 
%

! Class implementation for 'GtRemotePhlowItemBuilder'

!		Instance methods for 'GtRemotePhlowItemBuilder'

category: 'building'
method: GtRemotePhlowItemBuilder
basicComputeNodeValueForObject: anObject atIndex: anIndex 
	^ GtRemotePhlowItemTextualValue new 
		itemText: (self 
			formatItem: anObject 
			atIndex: anIndex)
%

category: 'building'
method: GtRemotePhlowItemBuilder
computeNodeValueForObject: anObject atIndex: anIndex 
	^ self withErrorHandlingCompute: [ 
		self basicComputeNodeValueForObject: anObject atIndex: anIndex ] 
%

category: 'accessing'
method: GtRemotePhlowItemBuilder
formatItem: anObject atIndex: rowIndex
	^ (self phlowView 
		itemComputation cull: anObject cull: rowIndex) gtDisplayString
%

! Class implementation for 'GtRemotePhlowRowBuilder'

!		Instance methods for 'GtRemotePhlowRowBuilder'

category: 'accessing'
method: GtRemotePhlowRowBuilder
computeNodeValueForObject: anObject atIndex: aRowIndex 
	| phlowColumns columnValues |

	phlowColumns := self phlowView columns.
	columnValues := Array new: phlowColumns size.
	
	phlowColumns withIndexDo: [ :aColumn :aColumnIndex | 
		| computedValue |
	
		computedValue := self withErrorHandlingCompute: [ 
			aColumn 
				computeItemValuesFor: anObject
				rowIndex: aRowIndex
				columnIndex: aColumnIndex ].
	
		columnValues 
			at: aColumnIndex
			put: computedValue ].

	^ GtRemotePhlowRowValue new
		columnValues: columnValues
%

! Class implementation for 'GtRemotePhlowProtoView'

!		Instance methods for 'GtRemotePhlowProtoView'

category: 'decorating'
method: GtRemotePhlowProtoView
columnedList

	^ self declarativeViewOfType: GtRemotePhlowColumnedListView
%

category: 'decorating'
method: GtRemotePhlowProtoView
columnedTree

	^ self declarativeViewOfType: GtRemotePhlowColumnedTreeView
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

	^ self declarativeViewOfType: GtRemotePhlowListView
%

category: 'decorating'
method: GtRemotePhlowProtoView
textEditor

	^ self declarativeViewOfType: GtRemotePhlowTextEditorView
%

category: 'decorating'
method: GtRemotePhlowProtoView
tree

	^ self declarativeViewOfType: GtRemotePhlowTreeView
%

! Class implementation for 'GtRemotePhlowView'

!		Instance methods for 'GtRemotePhlowView'

category: 'accessing'
method: GtRemotePhlowView
actionUpdateButton
	"stub"
%

category: 'converting'
method: GtRemotePhlowView
asGtDeclarativeView
	^ nil
%

category: 'message performning'
method: GtRemotePhlowView
basicOn: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments 
	^ anObject  
		perform: aMessageSymbol
		with: aCollectionOfArguments first
%

category: 'testing'
method: GtRemotePhlowView
canBeGtDeclarativeView
	^ true
%

category: 'copying'
method: GtRemotePhlowView
copyTransformationFrom: aSendBlock
	"Do nothing by default. This is a callback used by forward views that define #send: to still work in case the view that we forward to does not support #send:"
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

category: 'message performning'
method: GtRemotePhlowView
on: anObject perform: aMessageSymbol 
	<return: #GtRemotePhlowView>
	
	^ self on: anObject perform: aMessageSymbol withArguments: { self }
%

category: 'message performning'
method: GtRemotePhlowView
on: anObject perform: aMessageSymbol withArguments: aCollectionOfArguments
	<return: #GtRemotePhlowView>
	
	^ [ 
			self 
				basicOn: anObject 
				perform: aMessageSymbol 
				withArguments: aCollectionOfArguments
	] on: Error do: [ :anError |
			self 
				phlowErrorViewWithException: anError 
				forBuildContext: nil "(GtPhlowBuildContext new 
					object: anObject; 
					arguments: aCollectionOfArguments) "
				andSelector: aMessageSymbol ]
%

category: 'message performning'
method: GtRemotePhlowView
phlowErrorViewWithException: anException 
	| aTitle |
	aTitle := 'Error'.
	
	^ GtRemotePhlowViewErrorView new
		title: aTitle;
		errorMessage: anException description
%

category: 'message performning'
method: GtRemotePhlowView
phlowErrorViewWithException: anException forBuildContext: aContext andSelector: aMessageSymbol
	| aPhlow | 

	aPhlow := self phlowErrorViewWithException: anException.
	
	"aPhlow buildContext: aContext.
	aPhlow failedComputation: aFailedComputation."

	^ aPhlow
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

! Class implementation for 'GtRemotePhlowForwarderView'

!		Instance methods for 'GtRemotePhlowForwarderView'

category: 'converting'
method: GtRemotePhlowForwarderView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView."

	^ GtPhlowForwardViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeForwardViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
%

category: 'converting'
method: GtRemotePhlowForwarderView
computeForwardedView
	| targetObject computedView |
	
	[ targetObject := objectComputation value ] 
		on: Error do: [ :anError |
			^ self 
				phlowErrorViewWithException: anError  ].
				
	computedView := self on: targetObject perform: viewSelector.
	
	computedView class = self class ifTrue: [
		"If we the forward is to another forwarder view we follow the chain
		to reach the first view that is now a forward view."
		^ computedView computeForwardedView ].
		
	^ computedView
%

category: 'accessing'
method: GtRemotePhlowForwarderView
defaultTransformation
	^ GtRemotePhlowSendObjectTransformation forValuable: [ :anObject | anObject ]
%

category: 'testing'
method: GtRemotePhlowForwarderView
hasTransformation
	<return: #Boolean>
	^ transformation notNil
%

category: 'api - scripting'
method: GtRemotePhlowForwarderView
object: anObjectComputation
	objectComputation := anObjectComputation.
%

category: 'api - scripting'
method: GtRemotePhlowForwarderView
send: aBlock
	"Define what object should be displayed on selection and fire select or spawn item requests"
	self transformation: (GtRemotePhlowSendObjectTransformation forValuable: aBlock)
%

category: 'accessing'
method: GtRemotePhlowForwarderView
transformation 	
	^ transformation ifNil: [ 
		transformation := self defaultTransformation ]
%

category: 'accessing'
method: GtRemotePhlowForwarderView
transformation: aGtPhlowSendTransformation
	transformation := aGtPhlowSendTransformation.
%

category: 'api - scripting'
method: GtRemotePhlowForwarderView
view: aSelector
	viewSelector := aSelector
%

! Class implementation for 'GtRemotePhlowListingView'

!		Instance methods for 'GtRemotePhlowListingView'

category: 'copying'
method: GtRemotePhlowListingView
copyTransformationFrom: aTransformation
	aTransformation ifNil: [ ^ self ].
	self send: aTransformation valuable
%

category: 'accessing'
method: GtRemotePhlowListingView
defaultItemsComputation
	^ #() asGPhlowItemsIterator
%

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
		itemsProviderComputation := self defaultItemsComputation ]
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

! Class implementation for 'GtRemotePhlowBasicColumnedView'

!		Instance methods for 'GtRemotePhlowBasicColumnedView'

category: 'accessing'
method: GtRemotePhlowBasicColumnedView
column
	<return: #GtRemotePhlowExplicitColumn>
	
	^ self explicitColumn
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString do: aBlock
	| aColumn |
	aColumn := self column.
	aColumn title: aTitleString.
	aBlock value: aColumn
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString iconName: anIconNameComputation
	self column: aTitleString iconNameDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			iconName: anIconNameComputation ]
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString iconName: anIconNameComputation width: aNumber
	self column: aTitleString iconNameDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			iconName: anIconNameComputation;
			width: aNumber ]
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitle iconNameDo: aBlock
	aBlock value: (self iconNameColumn title: aTitle)
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString item: anItemComputation text: aBlock	
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: anItemComputation;
			format: aBlock ]
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitle number: aBlock
	self numberColumn
		title: aTitle;
		item: aBlock
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitle number: aBlock format: aFormatBlock
	self numberColumn
		title: aTitle;
		item: aBlock;
		format: aFormatBlock
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitle numberDo: aBlock
	aBlock value: (self numberColumn title: aTitle)
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString text: aBlock	
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			format: aBlock ]
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: columnName text: aBlockClosure spawn: aSpawnBlock
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure spawn: aSpawnBlock.
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: columnName text: aBlockClosure spawn: aSpawnBlock width: aNumberOrNil
	| aColumn |
	aColumn := self column.
	aColumn title: columnName.
	aColumn text: aBlockClosure spawn: aSpawnBlock.
	aColumn width: aNumberOrNil.
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString text: aBlock weight: aNumber
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			format: aBlock;
			weight: aNumber ]
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString text: aBlock width: aNumber
	self column: aTitleString textDo: [ :aColumn |
		aColumn
			item: [ :each | each ];
			format: aBlock;
			width: aNumber ]
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
column: aTitleString textDo: aBlock
	aBlock value: (self textColumn title: aTitleString)
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
columnOfType: aColumnClass
	<return: #GtRemotePhlowColumn>
	| aColumn |
	
	aColumn := aColumnClass new index: self columns size + 1.
	self columns add: aColumn.
	^ aColumn
%

category: 'accessing'
method: GtRemotePhlowBasicColumnedView
columns
	^ columns ifNil: [
		columns := OrderedCollection new ]
%

category: 'accessing'
method: GtRemotePhlowBasicColumnedView
configureColumnsSpecificationOn: aViewSpecification
	aViewSpecification
		columnSpecifications: (columns asArray collect: [ :aColumn | 
			| columnSpecification|
			columnSpecification := GtRemotePhlowColumnSpecification new
				title: aColumn title;
				cellWidth: aColumn cellWidth;
				type: aColumn asGtDeclarativeColumnDataType;
				spawnsObjects: aColumn isSpawningObject.
			
			aColumn hasBackgroundComputation ifTrue: [ 
				columnSpecification  markAsHavingBackground ].
			columnSpecification ] )
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
explicitColumn
	<return: #GtRemotePhlowExplicitColumn>

	^ self columnOfType: GtRemotePhlowExplicitColumn
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
iconNameColumn
	<return: #GtRemotePhlowThemeIconNameColumn>

	^ self columnOfType: GtRemotePhlowThemeIconNameColumn
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
numberColumn
	<return: #GtRemotePhlowNumberColumn>

	^ self columnOfType: GtRemotePhlowNumberColumn
%

category: 'api - scripting column'
method: GtRemotePhlowBasicColumnedView
textColumn
	<return: #GtRemotePhlowTextColumn>

	^ self columnOfType: GtRemotePhlowTextColumn
%

! Class implementation for 'GtRemotePhlowColumnedListView'

!		Instance methods for 'GtRemotePhlowColumnedListView'

category: 'accessing'
method: GtRemotePhlowColumnedListView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	| viewSpecification |
	viewSpecification := GtPhlowColumnedListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedListDataSource 
			forPhlowView: self);
		title: self title;
		priority: self priority;
		horizontalScrollingEnabled:  horizontalScrollingEnabled;
		dataTransport: GtPhlowViewSpecification dataLazy.
		
	self configureColumnsSpecificationOn: viewSpecification.
	
	^ viewSpecification
%

category: 'testing'
method: GtRemotePhlowColumnedListView
isHorizontalScrollingEnabled
	^ horizontalScrollingEnabled ifNil: [ false ]
%

category: 'api - scripting'
method: GtRemotePhlowColumnedListView
withHorizontalScrolling
	horizontalScrollingEnabled := true
%

category: 'api - scripting'
method: GtRemotePhlowColumnedListView
withoutHorizontalScrolling
	horizontalScrollingEnabled := false
%

! Class implementation for 'GtRemotePhlowColumnedTreeView'

!		Instance methods for 'GtRemotePhlowColumnedTreeView'

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView."

	| viewSpecification |
	
	viewSpecification := GtPhlowColumnedTreeViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewColumnedTreeDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
		
	self configureColumnsSpecificationOn: viewSpecification.
	
	^ viewSpecification
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
children: aBlock

	childrenBuilder := aBlock
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
childrenBuilder

	^ childrenBuilder
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
defaultItemsComputation
	^ [ #() ]
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
expandAll
	"To implement"
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
itemComputation
	^ self itemText
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
itemsBuilder
	^ self itemsProviderComputation
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
itemText

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
%

category: 'accessing'
method: GtRemotePhlowColumnedTreeView
itemText: aBlock

	itemTextBlock := aBlock
%

! Class implementation for 'GtRemotePhlowListView'

!		Instance methods for 'GtRemotePhlowListView'

category: 'converting'
method: GtRemotePhlowListView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowListViewSpecification new 
		phlowDataSource: (GtRemotePhlowDeclarativeViewListDataSource 
			forPhlowView: self);
		title: self title;
		priority: self priority;
		dataTransport: GtPhlowViewSpecification dataLazy.
%

category: 'private - accessing'
method: GtRemotePhlowListView
itemComputation

	^ self itemText
%

category: 'accessing'
method: GtRemotePhlowListView
itemText
	"Answer the BlockClosure that will convert each item to its displayed format.
	The result of the BlockClosure must be a JSON primitive type, effectively a string or number."

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ] 
%

category: 'api - scripting'
method: GtRemotePhlowListView
itemText: aBlockClosure

	itemTextBlock := aBlockClosure
%

! Class implementation for 'GtRemotePhlowTreeView'

!		Instance methods for 'GtRemotePhlowTreeView'

category: 'converting'
method: GtRemotePhlowTreeView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView."

	^ GtPhlowTreeViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeViewTreeDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy
%

category: 'accessing'
method: GtRemotePhlowTreeView
children: aBlock

	childrenBuilder := aBlock
%

category: 'accessing'
method: GtRemotePhlowTreeView
childrenBuilder

	^ childrenBuilder
%

category: 'accessing'
method: GtRemotePhlowTreeView
defaultItemsComputation
	^ [ #() ]
%

category: 'accessing'
method: GtRemotePhlowTreeView
expandAll
	"To implement"
%

category: 'accessing'
method: GtRemotePhlowTreeView
itemComputation
	^ self itemText
%

category: 'accessing'
method: GtRemotePhlowTreeView
itemsBuilder
	^ self itemsProviderComputation
%

category: 'accessing'
method: GtRemotePhlowTreeView
itemText

	^ itemTextBlock ifNil: [ 
		itemTextBlock := [ :item | item ] ]
%

category: 'api - scripting'
method: GtRemotePhlowTreeView
itemText: aBlock

	itemTextBlock := aBlock
%

! Class implementation for 'GtRemotePhlowTextEditorView'

!		Instance methods for 'GtRemotePhlowTextEditorView'

category: 'accessing'
method: GtRemotePhlowTextEditorView
aptitude: anAptitude
	"stub method"
%

category: 'converting'
method: GtRemotePhlowTextEditorView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtPhlowTextEditorViewSpecification new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtPhlowViewSpecification dataIncluded.
%

category: 'accessing'
method: GtRemotePhlowTextEditorView
text: aBlockClosure
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
%

category: 'accessing'
method: GtRemotePhlowTextEditorView
textBuilder
	^ textBuilder
%

! Class implementation for 'GtRemotePhlowViewErrorView'

!		Instance methods for 'GtRemotePhlowViewErrorView'

category: 'converting'
method: GtRemotePhlowViewErrorView
asGtDeclarativeView
	"Answer the receiver as a GtDeclarativeView."

	^GtPhlowViewErrorViewSpecification new 
		title: self title;
		priority: self priority;
		errorMessage: self errorMessage;
		dataTransport: GtPhlowViewSpecification dataIncluded.
%

category: 'accessing'
method: GtRemotePhlowViewErrorView
errorMessage
	^ errorMessage
%

category: 'accessing'
method: GtRemotePhlowViewErrorView
errorMessage: aStringMessage
	errorMessage := aStringMessage
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

category: 'api - transformation'
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

category: 'initialization'
method: GtRemotePhlowViewedObject
computeViewSpecificationForPhlowView: aPhlowView
	^ [ aPhlowView asGtDeclarativeView ] 
		on: Error do: [ :anError |
			| errorView |
			errorView := aPhlowView phlowErrorViewWithException: anError.
			errorView title: aPhlowView title.
			errorView priority: aPhlowView priority.
			
			errorView asGtDeclarativeView ]
%

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
getViewDeclaration: aViewSelector
	| declarativeView |
	declarativeView := self getDeclarativeViewFor: aViewSelector.
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
		collect: [ :aDeclarativeView |
			self getViewDeclarationForView: aDeclarativeView ]).
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
	phlowViews
		do: [ :aPhlowView | 
			| viewSpecification |
			viewSpecification := self computeViewSpecificationForPhlowView: aPhlowView.
			viewSpecification
				ifNotNil: [ viewSpecification methodSelector: aPhlowView definingSelector.
					declarativeViewsBySelector
						at: aPhlowView definingSelector
						put: viewSpecification ] ]
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
		ifNone: [ views := views, (Array with: (object 
			gtRemoteGtRawFor: #GtPhlowView asClass empty)) ].
	
	^ views
%

! Class implementation for 'GtRmGeoGpsGroup'

!		Instance methods for 'GtRmGeoGpsGroup'

category: 'accessing'
method: GtRmGeoGpsGroup
add: anObject
	self clearCache.
	self items add: anObject
%

category: 'accessing'
method: GtRmGeoGpsGroup
addAll: aCollection
	self clearCache.
	self items addAll: aCollection
%

category: 'accessing'
method: GtRmGeoGpsGroup
cacheAt: aKey ifAbsentPut: aBlock
	cache ifNil: [ 
		cache := Dictionary new].
	^ cache 
		at: aKey
		ifAbsentPut: [ aBlock value ]
%

category: 'accessing'
method: GtRmGeoGpsGroup
clearCache
	cache := nil
%

category: 'accessing'
method: GtRmGeoGpsGroup
collect: aBlock
	^ self items  collect: aBlock
%

category: 'accessing'
method: GtRmGeoGpsGroup
detect: aBlock ifNone: exceptionBlock
	^ self items 
		detect: aBlock ifNone: exceptionBlock
%

category: 'accessing'
method: GtRmGeoGpsGroup
do: aBlock 
	self items do: aBlock
%

category: 'accessing'
method: GtRmGeoGpsGroup
items
	^ items ifNil: [
		items := OrderedCollection new ]
%

category: 'printing'
method: GtRmGeoGpsGroup
printOn: aStream
	super printOn: aStream.
	
	aStream 
		<< '[';
		print: self size;
		<< ' items';
		<< ']'
%

category: 'accessing'
method: GtRmGeoGpsGroup
size
	^ self items size
%

category: 'accessing'
method: GtRmGeoGpsGroup
sumNumbers: aBlock
	^ self items
		inject: 0 
		into: [ :sum :each |  sum + (aBlock value: each) ]
%

! Class implementation for 'GtRmGeoGpsRecordsGroup'

!		Instance methods for 'GtRmGeoGpsRecordsGroup'

category: 'accessing'
method: GtRmGeoGpsRecordsGroup
computeDistance
	| distance |
	self size = 1 ifTrue: [ ^ 0 ].
	distance := 0.
	1 to: self size - 1 do: [ :anIndex |
		distance := distance + (self
			distanceFrom: (self items at: anIndex)
			to: (self items at: anIndex + 1)) ].
	^ distance
%

category: 'accessing'
method: GtRmGeoGpsRecordsGroup
distance
	^ self 
		cacheAt: 'distance' 
		ifAbsentPut: [
			self computeDistance ]
%

category: 'accessing'
method: GtRmGeoGpsRecordsGroup
distanceBetween: firstPosition and: secondPosition
        "T3GeoTools distanceBetween: 5.33732@50.926 and: 5.49705@50.82733"

        | c |
        c := (firstPosition y degreesToRadians sin 
        	* secondPosition y degreesToRadians sin)
                + (firstPosition y degreesToRadians cos 
                	* secondPosition y degreesToRadians cos
                        * (secondPosition x degreesToRadians 
                        	- firstPosition x degreesToRadians) cos).
        c := c >= 0 ifTrue: [ 1 min: c ] ifFalse: [ -1 max: c ].
        ^ c arcCos * 6371000
%

category: 'accessing'
method: GtRmGeoGpsRecordsGroup
distanceFrom: firstRecord to: secondRecord
	| c |
    c := (firstRecord longitude degreesToRadians sin 
    	* secondRecord longitude degreesToRadians sin)
			+ (firstRecord longitude degreesToRadians cos 
				* secondRecord longitude degreesToRadians cos
            		* (secondRecord latitude degreesToRadians 
            			- firstRecord latitude degreesToRadians) cos).
    c := c >= 0 ifTrue: [ 1 min: c ] ifFalse: [ -1 max: c ].
    ^ c arcCos * 6371000
%

category: 'gt - extensions'
method: GtRmGeoGpsRecordsGroup
gtItemsFor: aView
	<gtView>
	
	^ aView columnedList
		title: 'Records';
		items: [ self items ];
		column: 'Timestamp' text: [ :aRecord | aRecord timestamp ];
		column: 'Latitude' text: [ :aRecord | aRecord latitude ];
		column: 'Longitude' text: [ :aRecord | aRecord longitude ]
%

! Class implementation for 'GtRmGeoGpsTrajectoriesGroup'

!		Instance methods for 'GtRmGeoGpsTrajectoriesGroup'

category: 'accessing'
method: GtRmGeoGpsTrajectoriesGroup
allRecords
	^ self 
		cacheAt: 'allRecords' 
		ifAbsentPut: [  
			self items
				inject: GtRmGeoGpsRecordsGroup new 
				into: [ :records :aTrajectory |
					records addAll: aTrajectory records items.
					records ] ]
%

category: 'gt - extensions'
method: GtRmGeoGpsTrajectoriesGroup
gtItemsFor: aView
	<gtView>
	
	^ aView columnedList
		title: 'Trajectories';
		items: [ self items ];
		column: 'Filename' text: [ :aTrajectory | 
			aTrajectory targetFolderName ];
		column: 'Records' text: [ :aTrajectory | 
			aTrajectory numberOfRecords ];
		column: 'Distance (km)' text: [ :aTrajectory | 
			self 
				gtDo: [
					(aTrajectory distance /1000) printShowingDecimalPlaces: 2] 
				gemstoneDo: [
					(aTrajectory distance /1000) asStringUsingFormat: #(0 2 false)  ] ]
%

! Class implementation for 'GtRmGeoGpsUsersGroup'

!		Instance methods for 'GtRmGeoGpsUsersGroup'

category: 'accessing'
method: GtRmGeoGpsUsersGroup
allRecords
	^ self 
		cacheAt: 'allRecords'
		ifAbsentPut: [ 
			self allTrajectories allRecords ]
%

category: 'accessing'
method: GtRmGeoGpsUsersGroup
allTrajectories
	^ self 
		cacheAt: 'allTrajectories'
		ifAbsentPut: [  
			self items
				inject: GtRmGeoGpsTrajectoriesGroup new 
				into: [ :trajectories :aUser |
					trajectories addAll: aUser trajectories.
					trajectories ] ]
%

category: 'gt - extensions'
method: GtRmGeoGpsUsersGroup
gtItemsFor: aView
	<gtView>
	
	^ aView columnedList
		title: 'Users';
		items: [ self items ];
		column: 'Id' text: [ :aUser | aUser id ];
		column: 'Number of trajectories' 
			text: [ :aUser | aUser numberOfTrajectories ];
		column: 'Number of records' 
			text: [ :aUser | aUser numberOfRecords  ]
%

category: 'accessing'
method: GtRmGeoGpsUsersGroup
removeUser: aString
	"Remove the supplied user.
	GS only has #detect:ifNone: (not #detect:ifFound:)"

	(items
		detect: [ :user | user id = aString ]
		ifNone: [ nil ]) ifNotNil:
			[ :user | items remove: user ]
%

! Class implementation for 'GtRmGeoGpsRecord'

!		Class methods for 'GtRmGeoGpsRecord'

category: 'instance creation'
classmethod: GtRmGeoGpsRecord
fromJsonDictionary: aDictionary
	^ self new 
		initializeFomJsonDictionary: aDictionary
%

!		Instance methods for 'GtRmGeoGpsRecord'

category: 'converting'
method: GtRmGeoGpsRecord
asJsonDictionary
	^ {
		#timestamp -> self timestamp.
		#latitude -> self latitude.
		#longitude -> self longitude } asDictionary
%

category: 'accessing'
method: GtRmGeoGpsRecord
asPoint

	^ self longitude @ self latitude
%

category: 'initialization'
method: GtRmGeoGpsRecord
initializeFomJsonDictionary: aDictionary
	self latitude: (aDictionary at: #latitude).
	self longitude: (aDictionary at: #longitude).
	self timestamp: (aDictionary at: #timestamp)
%

category: 'accessing'
method: GtRmGeoGpsRecord
latitude
	^ latitude
%

category: 'accessing'
method: GtRmGeoGpsRecord
latitude: aFloat
	latitude := aFloat
%

category: 'accessing'
method: GtRmGeoGpsRecord
longitude
	^ longitude
%

category: 'accessing'
method: GtRmGeoGpsRecord
longitude: aFloat
	longitude := aFloat
%

category: 'printing'
method: GtRmGeoGpsRecord
printOn: aStream
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self timestamp;
		<< '; ';
		print: self latitude;
		<< ', ';
		print: self longitude;
		<< ')'
%

category: 'accessing'
method: GtRmGeoGpsRecord
timestamp
	^ timestamp
%

category: 'accessing'
method: GtRmGeoGpsRecord
timestamp: aDateAndTime
	timestamp := aDateAndTime
%

! Class implementation for 'GtRmGeoGpsTrajectory'

!		Class methods for 'GtRmGeoGpsTrajectory'

category: 'instance creation'
classmethod: GtRmGeoGpsTrajectory
fromJsonDictionary: aDictionary
	^ self new 
		initializeFomJsonDictionary: aDictionary
%

!		Instance methods for 'GtRmGeoGpsTrajectory'

category: 'adding'
method: GtRmGeoGpsTrajectory
addRecord: aRecord
	self records add: aRecord
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
asJsonDictionary
	^ {
		'targetFolderName' -> self targetFolderName.
		'records' -> self recordsAsJsonData  } asDictionary
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
distance
	^ self records distance
%

category: 'gt - extensions'
method: GtRmGeoGpsTrajectory
gtViewGpsRecordsFor: aView

	^ aView columnedList
		title: 'Records';
		items: [ self records items ];
		column: 'Timestamp' text: [ :aRecord | aRecord timestamp ];
		column: 'Latitude' text: [ :aRecord | aRecord latitude ];
		column: 'Longitude' text: [ :aRecord | aRecord longitude ]
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
gtViewMapFor: aView

	^ aView explicit
		title: 'OSM';
		priority: 20;
		stencil: [ self osmMap ]
%

category: 'initialization'
method: GtRmGeoGpsTrajectory
initializeFomJsonDictionary: aDictionary
	self targetFolderName: (aDictionary at: 'targetFolderName').
	
	(aDictionary at: 'records') do: [ :aRecordData |
		self addRecord:  (GtRmGeoGpsRecord 
			fromJsonDictionary: aRecordData) ].
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
numberOfRecords
	^ self records size
%

category: 'printing'
method: GtRmGeoGpsTrajectory
printOn: aStream
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self targetFolderName;
		<< '; ';
		print: self records size;
		<< ' records';
		<< ')'
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
records
	^ records ifNil: [
		records := GtRmGeoGpsRecordsGroup new ]
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
recordsAsJsonData
	^ (self records collect: [ :aRecord |
			aRecord asJsonDictionary ]) asArray
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
targetFolderName
	^ targetFolderName
%

category: 'accessing'
method: GtRmGeoGpsTrajectory
targetFolderName: aFolderName
	targetFolderName := aFolderName
%

! Class implementation for 'GtRmGeolife'

!		Class methods for 'GtRmGeolife'

category: 'accessing'
classmethod: GtRmGeolife
defaultInstance
	^ DEFAULT ifNil: [
		DEFAULT := self new ]
%

category: 'accessing'
classmethod: GtRmGeolife
resetDefaultInstance
	DEFAULT := nil
%

!		Instance methods for 'GtRmGeolife'

category: 'adding'
method: GtRmGeolife
addUser: aUser
	self users add: aUser
%

category: 'accessing'
method: GtRmGeolife
allRecords
	
	^ self users allRecords
%

category: 'accessing'
method: GtRmGeolife
allTrajectories
	
	^ self users allTrajectories
%

category: 'initialization'
method: GtRmGeolife
defaultUsersGroup
	^ GtRmGeoGpsUsersGroup new
%

category: 'adding'
method: GtRmGeolife
ensureUserWithId: anId
	^ self users 
		detect: [ :aUser | aUser id = anId ];
		ifNone: [ 
			| newUser |
			newUser := GtRmGeoUser new 
				id: anId.
			self addUser: newUser.
			newUser ]
%

category: 'gt - extensions'
method: GtRmGeolife
gtViewSummaryDataFor: aView
	<gtView>
	
	^ aView columnedList
		title: 'Overview';
		priority: 1;
		items: [ self summaryData ];
		column: 'Name' text: [ :array | array first ];
		column: 'Value' text: [ :array | array second value ];
		send: [ :array | array third value ]
%

category: 'gt - extensions'
method: GtRmGeolife
gtViewUsersFor: aView
	<gtView>
	
	^ aView forward
		title: 'Users';
		priority: 10;
		object: [ self users ];
		view: #gtItemsFor:
%

category: 'accessing'
method: GtRmGeolife
numberOfUsers
	^ self users size
%

category: 'printing'
method: GtRmGeolife
printOn: aStream
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self numberOfUsers;
		<< ' users';
		<< ')'
%

category: 'accessing'
method: GtRmGeolife
removeUser: aString

	self users removeUser: aString
%

category: 'accessing'
method: GtRmGeolife
summaryData
	^ {
		{'Users'. [ self users size]. [self users]}.
		{'Trajectories'. [ self allTrajectories size]. [self allTrajectories]}.
		{'Records'. [ self allRecords size]. [self allRecords]}
	}
%

category: 'accessing'
method: GtRmGeolife
users
	^ users ifNil: [
		users := self defaultUsersGroup ]
%

! Class implementation for 'GtRmGeolifeBaseImporter'

!		Instance methods for 'GtRmGeolifeBaseImporter'

category: 'importing'
method: GtRmGeolifeBaseImporter
createRecordFromLine: aLine
	| parts record |
	record := GtRmGeoGpsRecord new.
	parts := aLine splitOn: ','.
	
	record 
		timestamp: (DateAndTime  
			date: (Date fromString: parts sixth)
			time: (Time fromString: parts seventh));
		longitude: (parts second asNumber);
		latitude:(parts first asNumber).
		
	^ record
%

category: 'importing'
method: GtRmGeolifeBaseImporter
createTrajectoryFromDirectory: aTrajectoryFolder 
	| trajectory lines |
	
	trajectory := GtRmGeoGpsTrajectory new.
	trajectory targetFolderName: aTrajectoryFolder basename.
	lines := aTrajectoryFolder contents lines.
	7 to: lines size do: [ :anIndex |
		| record | 
		record := self createRecordFromLine: (lines at: anIndex).
		trajectory addRecord: record ].
		
	^ trajectory
%

category: 'accessing'
method: GtRmGeolifeBaseImporter
directoriesToImport
	| directories |
	
	directories := (currentDirectory / 'Data') directories.
	^ usersCount 
		ifNil: [ directories ] 
		ifNotNil: [ directories first: usersCount ]
%

category: 'accessing'
method: GtRmGeolifeBaseImporter
usersCount: aNumber
	usersCount := aNumber
%

! Class implementation for 'GtRmGeolifeLocalImporter'

!		Instance methods for 'GtRmGeolifeLocalImporter'

category: 'importing'
method: GtRmGeolifeLocalImporter
createUserFromDirectory: aUserFolder
	| user |
	
	user := GtRmGeoUser new.
	user id: aUserFolder basename.
	((aUserFolder / 'Trajectory') childrenMatching: '*.plt') 
		do: [ :aTrajectoryFolder |
			| trajectory |
			trajectory := self createTrajectoryFromDirectory: aTrajectoryFolder.
			user addTrajectory:trajectory ].
	
	^ user
%

category: 'importing'
method: GtRmGeolifeLocalImporter
importFromDirectory: aDirectory
	| geoLife |
	
	currentDirectory := aDirectory.
	geoLife := GtRmGeolife new.
	
	self directoriesToImport do: [ :aUserFolder |
		self 
			importUserFromDirectory: aUserFolder
			into: geoLife ].
		
	^ geoLife
%

category: 'importing'
method: GtRmGeolifeLocalImporter
importUserFromDirectory: aUserFolder into: aGeolife
	| user |
	user := self createUserFromDirectory: aUserFolder.
	aGeolife addUser: user
%

! Class implementation for 'GtRmGeoUser'

!		Instance methods for 'GtRmGeoUser'

category: 'adding'
method: GtRmGeoUser
addTrajectory: aTrajectory 
	self trajectories add: aTrajectory
%

category: 'adding'
method: GtRmGeoUser
addTrajectoryFromJsonData: aJsonData
	self addTrajectory: (GtRmGeoGpsTrajectory 
		fromJsonDictionary:  aJsonData)
%

category: 'accessing'
method: GtRmGeoUser
allRecords
	
	^ self trajectories allRecords
%

category: 'gt - extensions'
method: GtRmGeoUser
gtViewRecordsFor: aView
	<gtView>
	
	^ aView forward
		title: 'Records';
		priority: 10;
		object: [ self allRecords ];
		view: #gtItemsFor: 
%

category: 'gt - extensions'
method: GtRmGeoUser
gtViewSummaryDataFor: aView
	<gtView>
	
	^ aView columnedList
		title: 'Overview';
		priority: 1;
		items: [ self summaryData ];
		column: 'Name' text: [ :array | array first ];
		column: 'Value' text: [ :array | array second value ];
		send: [ :array | array third value ]
%

category: 'gt - extensions'
method: GtRmGeoUser
gtViewTrajectoriesFor: aView
	<gtView>
	
	^ aView forward
		title: 'Trajectories';
		priority: 5;
		object: [ self trajectories ];
		view: #gtItemsFor:
%

category: 'accessing'
method: GtRmGeoUser
id
	^ id
%

category: 'accessing'
method: GtRmGeoUser
id: anObject
	id := anObject
%

category: 'accessing'
method: GtRmGeoUser
numberOfRecords
	^ self trajectories sumNumbers: [ :aTrajectory |
		aTrajectory numberOfRecords ]
%

category: 'accessing'
method: GtRmGeoUser
numberOfTrajectories
	^ self trajectories size
%

category: 'printing'
method: GtRmGeoUser
printOn: aStream
	super printOn: aStream.
	
	aStream 
		<< '(';
		print: self id;
		<< '; ';
		print: self trajectories size;
		<< ' trajectories';
		<< ')'
%

category: 'accessing'
method: GtRmGeoUser
summaryData
	^ {
		{'Trajectories'. [ self trajectories size]. [self trajectories]}.
		{'Records'. [ self allRecords size]. [self allRecords]}
	}
%

category: 'accessing'
method: GtRmGeoUser
trajectories
	^ trajectories ifNil: [
		trajectories := GtRmGeoGpsTrajectoriesGroup new ]
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

! Class extensions for 'GtPhlowViewSpecification'

!		Class methods for 'GtPhlowViewSpecification'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtPhlowViewSpecification
globalsDictionary

	self halt.  "How to look up classes?"
	^ GsCurrentSession currentSession symbolList
%

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtPhlowViewSpecification
new

	^ super new initialize
%

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtPhlowViewSpecification
readJsonString: aString

	self halt.
	^ JsonParser parse: aString
%

!		Instance methods for 'GtPhlowViewSpecification'

category: '*GToolkit-RemotePhlow-GemStone'
method: GtPhlowViewSpecification
writeJsonString: aJsonObject

	^ aJsonObject asJson
%

! Class extensions for 'GtRemotePhlowDeclarativeTestInspectable'

!		Class methods for 'GtRemotePhlowDeclarativeTestInspectable'

category: '*GToolkit-RemotePhlow-GemStone'
classmethod: GtRemotePhlowDeclarativeTestInspectable
new

	^ super new initialize
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
			
		phlowView := GtRemotePhlowProtoView new empty 
			on: self
			perform: methodSelector.
		
		phlowView definingSelector: methodSelector.
		phlowView ]
%

! Class extensions for 'PrintStream'

!		Instance methods for 'PrintStream'

category: '*GToolkit-RemotePhlow-GemStone'
method: PrintStream
parenthesize: aBlock
	self nextPut: $(.
	aBlock ensure: [ self nextPut: $) ]
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

! Class extensions for 'WriteStream'

!		Instance methods for 'WriteStream'

category: '*GToolkit-RemotePhlow-Remote'
method: WriteStream
parenthesize: aBlock
	self nextPut: $(.
	aBlock ensure: [ self nextPut: $) ]
%

