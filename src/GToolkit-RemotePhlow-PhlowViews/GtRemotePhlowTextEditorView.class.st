Class {
	#name : #GtRemotePhlowTextEditorView,
	#superclass : #GtRemotePhlowView,
	#instVars : [
		'textBuilder',
		'stylerSpecification'
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
		phlowDataSource: (GtRemotePhlowDeclarativeTextEditorViewDataSource 
			forPhlowView: self);
		dataTransport: GtPhlowViewSpecification dataLazy.
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> styler: aBlockClosure [
	"Set the computation that will create the styler."

	stylerSpecification := GtRemoteTextStylerComputableSpecification new 
		stylerComputation: aBlockClosure
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> stylerClassName: aStylerClassName [
	stylerSpecification := GtRemotePhlowTextClassStylerSpecification new 
		stylerClassName: aStylerClassName
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> stylerParserClassName: aParserClassName [
	stylerSpecification := GtRemotePhlowTextParserStylerSpecification new 
		parserClassName: aParserClassName
]

{ #category : #accessing }
GtRemotePhlowTextEditorView >> stylerSpecification [
	^ stylerSpecification
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
