Class {
	#name : #GtRemotePhlowDetailsRow,
	#superclass : #Object,
	#instVars : [
		'name',
		'valueComputation',
		'textComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #'instance creation' }
GtRemotePhlowDetailsRow class >> new [
	^ self basicNew initialize
]

{ #category : #initialization }
GtRemotePhlowDetailsRow >> initialize [
	super initialize.
	
	name := 'Row'.
	valueComputation := [ nil ].
	textComputation := [ :aValue | aValue gtDisplayText ]
]

{ #category : #accessing }
GtRemotePhlowDetailsRow >> name [
	^name
]

{ #category : #accessing }
GtRemotePhlowDetailsRow >> name: aString [
	name := aString
]

{ #category : #accessing }
GtRemotePhlowDetailsRow >> textComputation [
	^textComputation
]

{ #category : #accessing }
GtRemotePhlowDetailsRow >> textComputation: aTextComputation [
	textComputation := aTextComputation
]

{ #category : #accessing }
GtRemotePhlowDetailsRow >> valueComputation [
	^valueComputation
]

{ #category : #accessing }
GtRemotePhlowDetailsRow >> valueComputation: aBlockClosure [
	valueComputation := aBlockClosure
]
