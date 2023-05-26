Class {
	#name : #GtRemotePhlowDeclarativeTextEditor,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'textBuilder'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowDeclarativeTextEditor >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtPhlowDeclarativeTextEditorView new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtPhlowDeclarativeView dataIncluded.

]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextEditor >> text: aBlockClosure [
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextEditor >> textBuilder [
	^ textBuilder
]
