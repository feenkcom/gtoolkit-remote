Class {
	#name : 'GtRemotePhlowDeclarativeTextEditor',
	#superclass : 'GtRemotePhlowDeclarativeView',
	#instVars : [
		'textBuilder'
	],
	#category : 'GToolkit-RemotePhlow-PhlowViews'
}

{ #category : 'instance creation' }
GtRemotePhlowDeclarativeTextEditor class >> fromJSONDictionary: aDictionary [

	| editor |

	editor := super fromJSONDictionary: aDictionary.
	editor dataTransport = self dataIncluded ifTrue:
		[ editor string: (aDictionary at: #string) ].
	^editor
]

{ #category : 'converting' }
GtRemotePhlowDeclarativeTextEditor >> asGtDeclarativeView [
	"Answer the receiver as a GtDeclarativeView.
	nil = not supported"

	^GtDeclarativeTextEditorView new 
		title: self title;
		priority: self priority;
		string: self textBuilder value asString;
		dataTransport: GtDeclarativeView dataIncluded.

]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTextEditor >> text: aBlockClosure [
	"Set the BlockClosure that will generate the string to be displayed.
	The result of the BlockClosure must be a String (not a BlText)."

	textBuilder := aBlockClosure
]

{ #category : 'accessing' }
GtRemotePhlowDeclarativeTextEditor >> textBuilder [
	^ textBuilder
]
