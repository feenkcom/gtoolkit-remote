"
PBImageMetadata is a proxy for an Image instance in Python.

The proxy assumes that the python instance has had the source_file_name attribute added to it.

"
Class {
	#name : #PBImageMetadataProxy,
	#superclass : #PBProxyObject,
	#category : #'GToolkit-RemoteViews-Python'
}

{ #category : #accessing }
PBImageMetadataProxy class >> pythonClass [

	^ #Image
]

{ #category : #accessing }
PBImageMetadataProxy >> at: attributeString [
	"Answer the value of the named attribute"

	^ self newCommandFactory 
		<< (self => #get callWith: { attributeString });
		sendAndWait
]

{ #category : #accessing }
PBImageMetadataProxy >> attributes [
	"Answer the list of metadata attributes"

	^ self newCommandFactory
		<< (#dir asP3GI callWith: { self });
		sendAndWait
]

{ #category : #accessing }
PBImageMetadataProxy >> getAll [
	"Answer all attributes"

	^ self newCommandFactory
		<< (self => #get_all callWith: #());
		sendAndWait
]

{ #category : #ui }
PBImageMetadataProxy >> gtAttributesFor: aView [
	<gtView>

	^ aView forward 
		title: 'Attributes';
		priority: 5;
		object: [ self getAll ];
		view: #gtItemsFor:
]

{ #category : #ui }
PBImageMetadataProxy >> gtImageFor: aView [
	<gtView>

	^ aView explicit
		title: 'Image';
		priority: 10;
		stencil: [ (BlFileImageElement file: self sourceFileName)
			constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ] ]
]

{ #category : #accessing }
PBImageMetadataProxy >> imageData [
	"Answer the image data"

	^ self newCommandFactory
		<< (self => #get_file callWith: #());
		sendAndWait
]

{ #category : #accessing }
PBImageMetadataProxy >> sourceFileName [
	"Answer the image source file name"

	^ self newCommandFactory
		<< (self => #source_file_name);
		sendAndWait
]
