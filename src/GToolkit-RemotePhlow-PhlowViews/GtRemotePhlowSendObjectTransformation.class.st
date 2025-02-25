Class {
	#name : #GtRemotePhlowSendObjectTransformation,
	#superclass : #Object,
	#instVars : [
		'valuable'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #'instance creation' }
GtRemotePhlowSendObjectTransformation class >> forValuable: aValuable [
	^ self new
		valuable: aValuable
]

{ #category : #'api - converting' }
GtRemotePhlowSendObjectTransformation >> asPhlowSendTransformation [
	^ self
]

{ #category : #asserting }
GtRemotePhlowSendObjectTransformation >> assertValuable: aBlock [
	self
		assert: [ aBlock isNotNil ].
	self
		assert: [ aBlock argumentCount <= 2 ].
]

{ #category : #'api - transformation' }
GtRemotePhlowSendObjectTransformation >> transformedValueFrom: aSelectedObject selection: aSelectionIndices [
	^ self valuable cull: aSelectedObject cull: aSelectionIndices
]

{ #category : #accessing }
GtRemotePhlowSendObjectTransformation >> valuable [
	^ valuable
]

{ #category : #accessing }
GtRemotePhlowSendObjectTransformation >> valuable: anObject [
	valuable := anObject
]
