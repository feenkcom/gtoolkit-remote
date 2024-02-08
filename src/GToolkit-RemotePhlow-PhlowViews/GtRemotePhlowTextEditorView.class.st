Class {
	#name : #GtRemotePhlowTextEditorView,
	#superclass : #GtRemotePhlowTextualView,
	#instVars : [
		'stylerSpecification'
	],
	#category : #'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : #converting }
GtRemotePhlowTextEditorView >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^ GtPhlowTextEditorViewSpecification new 
		title: self title;
		priority: self priority;
		phlowDataSource: (GtRemotePhlowDeclarativeTextualViewDataSource 
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
