Class {
	#name : #GtRemotePhlowTextEditorView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'textBuilder',
		'textStylerComputation'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #accessing }
GtRemotePhlowTextEditorView >> aptitude: anAptitude [
	"stub method"
]

{ #category : #converting }
GtRemotePhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowTextEditorViewSpecification new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtPhlowViewSpecification dataIncluded.
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> styler: aBlockClosure [
	"Set the computation that will generate ."

	textStylerComputation := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> text: aBlockClosure [
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> textBuilder [
	^ textBuilder
]
