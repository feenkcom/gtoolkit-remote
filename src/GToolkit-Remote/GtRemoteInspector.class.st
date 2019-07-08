Class {
	#name : #GtRemoteInspector,
	#superclass : #Object,
	#instVars : [
		'namedObjects'
	],
	#category : #'GToolkit-Remote-Inspection'
}

{ #category : #inspecting }
GtRemoteInspector >> gtNamedObjectsFor: aView [
	<gtView>

	^self subclassResponsibility 
]

{ #category : #testing }
GtRemoteInspector >> isLiteralObject: anObject [
	"Answer a boolean indicating whether anObject is considered a literal and should be sent back directly to the client.
	Currently this is only numbers and strings, so is handled here.  If the logic becomes more complex it should be deferred to the objects themselves"

	^anObject isNumber or: [anObject isString]
]

{ #category : #accessing }
GtRemoteInspector >> namedObjectAt: aString [

	^self objectAt: (namedObjects at: aString)
]

{ #category : #accessing }
GtRemoteInspector >> namedObjects [
	"Answer the list of named objects for the receiver"

	^self subclassResponsibility 
]

{ #category : #accessing }
GtRemoteInspector >> objectAt: aString [
	"Answer the objects identified by aString"

	^self subclassResponsibility 
]
