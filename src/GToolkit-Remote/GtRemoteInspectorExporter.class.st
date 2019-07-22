"
GtRemoteInspectorExporter starts from the named objects of the supplied GtRemoteInspectorServer and writes out a JSON file for most of the possible URLs that the server accepts.  The exception is that the raw view (#gtRawFor:) does not have its objects written out (to stop the number of files and disk space from exploding).

This allows a simple file server in some other language, e.g. JavaScript, to look like it is serving up all the objects in the supplied server.

A typical invocation of the exporter is (from the inspector of a GtRemoteInspectorServer): 

[[[ 
GtRemoteInspectorExporter new
	server: self;
	rootDirectory: '/dev/shm/export';
	maxDepth: 3;
	export
]]]

Note that the number of files and consumed disk space will quickly blow out as the depth increases.

To avoid creating nested directories the urlTransformationBlock is used to replace the slash character (/) with something else allowed by the file system, an underscore (_) by default.


!!Internal Representation and Key Implementation Points.

!!!Instance Variables

	exportedObjects:		<Set>
	maxDepth:					<Integer>
	rootDirectory:			<FileReference>
	server:					<GtRemoteInspectorServer>
	urlTransformationBlock:		<BlockClosure>


    Implementation Points
"
Class {
	#name : #GtRemoteInspectorExporter,
	#superclass : #Object,
	#instVars : [
		'server',
		'rootDirectory',
		'urlTransformationBlock',
		'exportedObjects',
		'maxDepth'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #'api - exporting' }
GtRemoteInspectorExporter >> export [ 
	"Export all the objects from the server"

	self exportNamedObjects.
	server namedObjects do: [ :each |
		self exportObjectId: each depth: 1 ]
]

{ #category : #private }
GtRemoteInspectorExporter >> exportAccessor: anAccessor [

	| relativeUrl jsObject |

	relativeUrl := anAccessor relativeUrl.
	jsObject := server handleViewRequest: { 
						#id -> anAccessor id.
						#viewName -> anAccessor selector } asDictionary.
	self write: jsObject toUrl: relativeUrl.
	(jsObject at: #dataTransport) = GtDeclarativeView dataLazy ifTrue:
		[ self write: anAccessor declarativeView data toUrl: relativeUrl, '/data' ].

]

{ #category : #private }
GtRemoteInspectorExporter >> exportAccessorList: anAccessorList [

	anAccessorList accessors do: [ :accessor |
		self exportAccessor: accessor ].


]

{ #category : #private }
GtRemoteInspectorExporter >> exportNamedObjects [
	"Write out /namedObjects"

	| jsObject |

	jsObject := server handleNamedObjectsRequest: Dictionary new.
	self write: jsObject toUrl: 'namedObjects'.
]

{ #category : #private }
GtRemoteInspectorExporter >> exportObjectId: objectId depth: depth [
	"Write out the list of views, view definitions, data for the supplied object id.
	Then iterate over the objects sentItems (if any) and do the same."
	| accessorList jsObject |

	(exportedObjects includes: objectId) ifTrue: [ ^self].
	depth > maxDepth ifTrue: [ ^self ].
	accessorList := server accessorListAt: objectId.
	jsObject := server handleObjectRequest: { #id -> objectId } asDictionary.
	self write: jsObject toUrl: 'object/', objectId asString.

	self exportAccessorList: accessorList.
	exportedObjects add: objectId.
	self exportSentItemsFromList: accessorList depth: depth+1.
]

{ #category : #private }
GtRemoteInspectorExporter >> exportSentItemsFromList: anAccessorList depth: depth [
	"Iterate over the supplied accessor list and export all the sent items"

	| objectId jsObject |

	anAccessorList accessors do: [ :accessor |
		accessor sentItems withIndexDo: [ :sentItem :index |
			(server isLiteralObject: sentItem) ifTrue: [
				self write: sentItem toUrl: accessor relativeUrl, '/', index asString.
			] ifFalse: [ accessor selector = #gtRawFor: ifFalse: [ 
				objectId := server register: sentItem.
				jsObject := server handleObjectRequest: { #id -> objectId } asDictionary.
				self write: jsObject toUrl: accessor relativeUrl, '/', index asString.
				self exportObjectId: objectId depth: depth ] ] ] ].

]

{ #category : #initialization }
GtRemoteInspectorExporter >> initialize [ 

	super initialize.
	rootDirectory := '.' asFileReference.
	urlTransformationBlock := [ :relativeUrl | relativeUrl copyReplaceAll: '/' with: '_' ].
	exportedObjects := Set new.
	maxDepth := 3.
]

{ #category : #accessing }
GtRemoteInspectorExporter >> maxDepth [
	^ maxDepth
]

{ #category : #accessing }
GtRemoteInspectorExporter >> maxDepth: anObject [
	maxDepth := anObject
]

{ #category : #accessing }
GtRemoteInspectorExporter >> rootDirectory [
	^ rootDirectory
]

{ #category : #accessing }
GtRemoteInspectorExporter >> rootDirectory: aFileReference [

	rootDirectory := aFileReference asFileReference
]

{ #category : #accessing }
GtRemoteInspectorExporter >> server [
	^ server
]

{ #category : #accessing }
GtRemoteInspectorExporter >> server: anObject [
	server := anObject
]

{ #category : #accessing }
GtRemoteInspectorExporter >> urlTransformationBlock [
	^ urlTransformationBlock
]

{ #category : #accessing }
GtRemoteInspectorExporter >> urlTransformationBlock: anObject [
	urlTransformationBlock := anObject
]

{ #category : #private }
GtRemoteInspectorExporter >> write: jsObject toUrl: relativeUrl [

	| file url |

	url := relativeUrl first = $/
		ifTrue: [ relativeUrl allButFirst ]
		ifFalse: [ relativeUrl ].
	file := rootDirectory / (urlTransformationBlock value: url).
	file writeStreamDo: [ :stream |
		STONJSON put: jsObject onStreamPretty: (ZnNewLineWriterStream on: stream) ].
]
