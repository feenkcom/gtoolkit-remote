Class {
	#name : #GtRemotePhlowInspectorObject,
	#superclass : #GtInspectorObject,
	#instVars : [
		'objectInspectorAdaptor'
	],
	#category : #'GToolkit-RemoteGt'
}

{ #category : #accessing }
GtRemotePhlowInspectorObject >> clearCachedData [
	
	objectInspectorAdaptor clearProxyInspector
]

{ #category : #accessing }
GtRemotePhlowInspectorObject >> object: anObject [
	super object: anObject.
	
	objectInspectorAdaptor := GtRemotePhlowViewedObjectInspectorAdaptor
		forTargetObject: anObject
]

{ #category : #accessing }
GtRemotePhlowInspectorObject >> view [
	"Answer the view for the receiver's object and view"

	"Using #object:perform:withArguments:inClass: allows proxies that are a subclass of ProtoObject to be inspected. #perform:with: is defined in Object."

	<return: #GtPhlowLabelledView>
	
	^ GtPhlowView empty 
		on: objectInspectorAdaptor 
		perform: self viewSelector
]
