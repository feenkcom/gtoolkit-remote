Class {
	#name : #GtRemotePhlowTextualView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'textBuilder'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowTextualView >> aptitude: anAptitude [
	"stub method"
]

{ #category : #accessing }
GtRemotePhlowTextualView >> text: aBlockClosure [
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowTextualView >> textBuilder [
	^ textBuilder
]
